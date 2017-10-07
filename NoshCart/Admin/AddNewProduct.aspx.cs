using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using NoshCart.BusinessLayer;

namespace NoshCart.Admin
{
    public partial class AddNewProduct : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCategories();
                AddSubmitEvent();

                if (Request.QueryString["alert"] == "success")
                {
                    Response.Write("<script>alert('Record Saved Sucessfully.');</script>");
                }
            }
        }
        private void AddSubmitEvent() // this will force to  get the page refreshed on for this page 
        {
            UpdatePanel updatePanel = Page.Master.FindControl("AdminUpdatePanel") as UpdatePanel;
            UpdatePanelControlTrigger trigger = new PostBackTrigger();
            trigger.ControlID = btnsubmit.UniqueID;
            updatePanel.Triggers.Add(trigger);
        }
        private void GetCategories()
        {
            ShoppingCart k = new ShoppingCart();
            DataTable dt = k.GetCategories();
            if (dt.Rows.Count > 0)
            {
                Dddlcategory.DataValueField = "categoryid";
                Dddlcategory.DataTextField = "categoryname";
                Dddlcategory.DataSource = dt;
                Dddlcategory.DataBind();

            }
        }
        private void ClearText()
        {
            FileUpload1 = null;
            txtname.Text = string.Empty;
            txtprice.Text = string.Empty;
            txtproductdiscription.Text = string.Empty;
            txtquantity.Text = string.Empty;
        }
        private void SaveProductPhoto()
        {
            if (FileUpload1.PostedFile != null)
            {
                string filename = FileUpload1.PostedFile.FileName.ToString();
                string fileExt = System.IO.Path.GetExtension(FileUpload1.FileName);

                if (filename.Length > 96)
                {
                    // Alert.Show("image name should not exceed 96 charater");
                }
                else if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png" && fileExt != ".bmp")
                {
                    // Alert.Show("This file type is not allowed!");
                }
                else if (FileUpload1.PostedFile.ContentLength > 40000000)
                {
                    // Alert.Show("Decrease the file size");
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("~/ProductImage/" + filename));
                }
            }

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (FileUpload1.PostedFile != null)
            {
                SaveProductPhoto();

                ShoppingCart k = new ShoppingCart()
                {
                    productname = txtname.Text,
                    productimage = "~/ProductImage/" + FileUpload1.FileName,
                    productprice = txtprice.Text,
                    productdiscription = txtproductdiscription.Text,
                    categoryid = Convert.ToInt32(Dddlcategory.SelectedValue),
                    TotalProducts = Convert.ToInt32(txtquantity.Text)
                };
                k.addnewproduct();
                //Response.Write("<script>alert('Data saved')</script>");
                ClearText();
                Response.Redirect("~/Admin/AddNewProduct.aspx?alert=Success");
            }
            else
            {
                //Response.Redirect("<script>alert('Data Not Saved')</script>");
                Response.Redirect("<script>alert('Please Upload Photo');</script>");
            }
        }
    }
}