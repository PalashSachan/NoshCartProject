using NoshCart.CheckLogin;
using NoshCart.DataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NoshCart.Account
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //DateLabel.Text = Check.GetDate;
            if (!IsPostBack)
            {
                GetData();
            }
        }

        private void GetData()
        {
            //creating the sqlparameter object
            SqlParameter[] parameters = new SqlParameter[1];

            //adding the parameters
            parameters[0] = DataAccess.AddParameter("@custid", Convert.ToInt64(Session["Id"]), SqlDbType.BigInt, 20);

            //executing the Stored Procedure
            DataTable table = DataAccess.ExecuteDTByProcedure("SP_GetOrderIDNumbers", parameters);
            Check.orderIDofCustomer(table);
            if(table.Rows.Count > 0)
            {
                GridView1.Visible = true;
                GridView1.DataSource = table;
                GridView1.DataBind();
            }
            else
            {
                LabelDataNotFound.Visible = true;
                LabelDataNotFound.Text = "No Orders Found";
            }
        }

        protected void FindGridAndBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;
            
            GridView nestedGridView = (GridView)e.Row.FindControl("GridViewNested");
            
            int ordid = int.Parse(GridView1.DataKeys[e.Row.RowIndex].Value.ToString());
            
            //creating the sqlparameter object
            SqlParameter[] parameters = new SqlParameter[2];

            //adding the parameters
            parameters[0] = DataAccess.AddParameter("@custid", Convert.ToInt64(Session["Id"]), SqlDbType.BigInt, 20);
            parameters[1] = DataAccess.AddParameter("@orderid", Convert.ToInt64(ordid), SqlDbType.BigInt, 20);

            //executing the Stored Procedure
            DataTable table = DataAccess.ExecuteDTByProcedure("SP_GetAllOrderDetails", parameters);

            nestedGridView.DataSource = table;
            nestedGridView.DataBind();
        }

        
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["src"] = "orders";
            string st = (GridView1.SelectedRow.FindControl("OrderIDButton") as LinkButton).Text;
            Response.Redirect("order_details?Oid=" + Check.GetOnlyOrderIDFromText(st) + "&Uid=" + Session["Id"] + "&Uname=" + Session["Username"] + "&src=od&link=order_number"); //redirecting user to thankyou page with 1 major querystring sending the orderID
        }
    }
}