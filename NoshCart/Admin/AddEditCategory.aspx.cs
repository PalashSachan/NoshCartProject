using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NoshCart.BusinessLayer;

namespace NoshCart.Admin
{
    public partial class AddEditCategory : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Session["Cart"]);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ShoppingCart k = new ShoppingCart
            {
                categoryname = txtcategoryname.Text
            };

            k.addnewcategory();
            txtcategoryname.Text=string.Empty;
            Response.Redirect("~/Admin/AddNewProduct.aspx");
            
    }

    }
}