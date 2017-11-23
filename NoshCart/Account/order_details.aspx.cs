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
    public partial class order_details : Page
    {
        
        static string Oid;
        static string Uid;

        protected void Page_Load(object sender, EventArgs e)
        {
            LabelOrderIDNotFound.Visible = false;
            if (!IsPostBack)
            {
                if (Session["src"] != null && Session["src"].Equals("orders") && Request.QueryString["Oid"] != null && Request.QueryString["Uid"] != null && Request.QueryString["Oid"] != null && Request.QueryString["Uid"] != null)
                {
                    if (Check.orderIDwithCurrentUser(Request.QueryString["Oid"], Request.QueryString["Uid"], Session["Id"].ToString()))
                    {
                        Oid = Request.QueryString["Oid"];
                        Uid = Request.QueryString["Uid"];
                        GetData();
                    }
                    else
                    {
                        LabelOrderIDNotFound.Visible = true;
                        LabelOrderIDNotFound.Text = "Wrong Order ID..Please Try Again";
                    }
                }
                else
                {
                    LabelOrderIDNotFound.Text = "Something Went Wrong. Try again later.";
                    LabelOrderIDNotFound.Visible = true;
                }
            }
        }

        private void GetData()
        {
            //creating the sqlparameter object
            SqlParameter[] parameters = new SqlParameter[2];

            //adding the parameters
            parameters[0] = DataAccess.AddParameter("@custid", Convert.ToInt64(Session["Id"]), SqlDbType.BigInt, 20);
            parameters[1] = DataAccess.AddParameter("@orderid", Convert.ToInt64(Oid), SqlDbType.BigInt, 20);

            //executing the Stored Procedure
            DataTable table = DataAccess.ExecuteDTByProcedure("SP_GetOneOrderDetail", parameters);

            if (table.Rows.Count == 1)
            {
                GridView1.Visible = true;
                GridView1.DataSource = table;
                GridView1.DataBind();
            }
            else
            {
                LabelOrderIDNotFound.Visible = true;
                LabelOrderIDNotFound.Text = "Something is not right here. Try again later.";
            }
        }

        protected void FindGridAndBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;

            //creating the sqlparameter object
            SqlParameter[] parameters = new SqlParameter[2];

            //adding the parameters
            parameters[0] = DataAccess.AddParameter("@custid", Convert.ToInt64(Uid), SqlDbType.BigInt, 20);
            parameters[1] = DataAccess.AddParameter("@orderid", Convert.ToInt64(Oid), SqlDbType.BigInt, 20);

            //executing the Stored Procedure
            DataTable table = DataAccess.ExecuteDTByProcedure("SP_GetAllOrderDetails", parameters);

            GridView nestedGridView = (GridView)e.Row.FindControl("GridViewNested");

            nestedGridView.Visible = true;
            nestedGridView.DataSource = table;
            nestedGridView.DataBind();
        }
    }
}