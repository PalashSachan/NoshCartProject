using System;
using System.Data;
using System.Web.UI;
using System.Web.Security;
using NoshCart.SendSMS;
using NoshCart.CheckLogin;
using NoshCart.BusinessLayer;

namespace NoshCart
{
    public partial class ThankYou : Page
    {
        protected void Page_PreLoad(object sender, EventArgs e)
        {
            if (Session["OrderID"] == null || Session["MyCart"] == null || User.Identity.Name == ""
                || (bool)Session["IsAuthenticated"] == false || Request.QueryString["Status"] != "success"
                || (bool)Session["IsFirstTime"] == false) //checking some conditions on which is they are true then the user will be redirected back to the login page
            {
                FormsAuthentication.RedirectToLoginPage(); //redirecting the user to the login page
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["IsFirstTime"] != null && (bool)Session["IsFirstTime"] == true)
                {
                    LabelOrderIdNumber.Text = Session["OrderID"].ToString(); //assigning the value
                    LabelUserName.Text = Session["Username"].ToString(); //assigning the value
                    LabelEmailID.Text = Session["Email"].ToString(); //assigning the value
                    LabelPhoneNumber.Text = Session["PhoneNumber"].ToString(); //assigning the value
                }
            }
        }

        private void SendMsgAndEmail() //invoked to send msg and email
        {
            if ((bool)Session["IsFirstTime"] == true) //checking the querystring Status is sussess and isfirsttime is true
            {
                Session["IsFirstTime"] = false; //making it false so that it can prevent the user when tries to open the thankyou page again

                SaveOrderDetailsAndUserDetails(); //calling method to save the details
                Check.PurchasedProductsToArray(); //converting the session cart datatable to 2D Array...i know you must be thinking that why the hell he is converting the datatable to 2d array when the datatable is already in the form of table and can be get data in the form of row and column....but....It was NOT working...YES..it was not working when i was using the datatable directly accessing its rows and columns....So i converted datatable into 2D Array and then it worked
                Send.SendOrderConfirmationSMS(); //calling method to send the sms
                Send.SendOrderConfirmationMail(); //calling method to send the email

                Session["MyCart"] = null; //initializing null

                Session["MyCart"] = null; //initializing null
                Session["ttprice"] = null; //initializing null
                Session["ttproduct"] = null; //initializing null
                Session["PaymentMode"] = null; //initializing null
                Session["PaymentModeName"] = null; //initializing null
            }
        }

        private void SaveOrderDetailsAndUserDetails() //invoked to save User and Order Details before sending the sms and email
        {
            string productids = string.Empty; //initialising the value..setting the string value to empty for the first time
            DataTable dt; //declaring the datatable variable

            if (Session["MyCart"] != null) //checking if the cart is null or not
            {
                dt = (DataTable)Session["MyCart"]; // converting entire session into data table

                ShoppingCart k = new ShoppingCart() //calling and creating the object of shoppingcart class
                {
                    TotalProducts = Convert.ToInt32(Session["ttproduct"].ToString()), //Assigning the value of total products to the local class variable
                    TotalPrice = Convert.ToInt32(Session["ttprice"].ToString()), //Assigning the value of total price to the local class variable
                    PaymentMethod = Session["PaymentModeName"].ToString() //Assigning the value of payment method to the local class variable
                };

                DataTable dtResult = k.SaveCustomerDetails(); //saving the customer details and getting the result

                for (int i = 0; i < dt.Rows.Count; i++) //using for loop to save all product details
                {
                    ShoppingCart saveproducts = new ShoppingCart()  //this will tell which customer has placed which order and customer id act as a order id
                    {
                        sID = Convert.ToInt64(Session["Id"]), //Assigning the value of UserID to the local class variable
                        sOrderID = Convert.ToInt64(Session["OrderID"]), //Assigning the value of OrderID to the local class variable
                        ProductID = Convert.ToInt32(dt.Rows[i]["ProductID"]), //Assigning the value of ProductID to the local class variable
                        TotalProducts = Convert.ToInt32(dt.Rows[i]["ProductQuantity"]) //Assigning the value of total products to the local class variable
                    };
                    saveproducts.SaveCustomerProducts(); //saving the customer products
                }
            }
        }

        protected void HiddenButton_Click(object sender, EventArgs e) //invoked automatically using the javascript as soon as the page is loaded to send sms and email
        {
            PageReloadScript.Visible = false; //to stop the page reload hiding the placeholder
            SendMsgAndEmail(); //Calling the method to send sms and email to the user
        }
    }
}