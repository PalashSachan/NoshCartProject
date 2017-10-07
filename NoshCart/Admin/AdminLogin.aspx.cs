using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;

namespace NoshCart.Admin
{
    public partial class AdminLogin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtloginid.Focus();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string loginid = WebConfigurationManager.AppSettings["AdminID"];
            string pass = WebConfigurationManager.AppSettings["AdminPassword"];

            if (txtloginid.Text == loginid && txtpassword.Text == pass)
            {
                Session["Cart"] = "Cart";
                Response.Redirect("~/Admin/AddEditCategory.aspx");
            }
            else
            {
                lblalert.Text = "Wrong Input";
            }

        }
    }
}
