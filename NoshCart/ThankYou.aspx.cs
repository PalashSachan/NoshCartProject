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
                    ClearAll();
                }
            }
        }

        //private void SendMsgAndEmail() //invoked to send msg and email
        //{
        //    if ((bool)Session["IsFirstTime"] == true) //checking the querystring Status is sussess and isfirsttime is true
        //    {
        //        Session["IsFirstTime"] = false; //making it false so that it can prevent the user when tries to open the thankyou page again

        //        //SaveOrderDetailsAndUserDetails(); //calling method to save the details
        //        //Check.PurchasedProductsToArray(); //converting the session cart datatable to 2D Array...i know you must be thinking that why the hell he is converting the datatable to 2d array when the datatable is already in the form of table and can be get data in the form of row and column....but....It was NOT working...YES..it was not working when i was using the datatable directly accessing its rows and columns....So i converted datatable into 2D Array and then it worked
        //        //Send.SendOrderConfirmationSMS(); //calling method to send the sms
        //        //Send.SendOrderConfirmationMail(); //calling method to send the email

        //        Session["MyCart"] = null; //initializing null

        //        Session["MyCart"] = null; //initializing null
        //        Session["ttprice"] = null; //initializing null
        //        Session["ttproduct"] = null; //initializing null
        //        Session["PaymentMode"] = null; //initializing null
        //        Session["PaymentModeName"] = null; //initializing null
        //    }
        //}

        private void ClearAll()
        {
            if ((bool)Session["IsFirstTime"] == true) //checking the querystring Status is sussess and isfirsttime is true
            {
                Session["IsFirstTime"] = false; //making it false so that it can prevent the user when tries to open the thankyou page again

                //SaveOrderDetailsAndUserDetails(); //calling method to save the details
                //Check.PurchasedProductsToArray(); //converting the session cart datatable to 2D Array...i know you must be thinking that why the hell he is converting the datatable to 2d array when the datatable is already in the form of table and can be get data in the form of row and column....but....It was NOT working...YES..it was not working when i was using the datatable directly accessing its rows and columns....So i converted datatable into 2D Array and then it worked
                //Send.SendOrderConfirmationSMS(); //calling method to send the sms
                //Send.SendOrderConfirmationMail(); //calling method to send the email

                Session["MyCart"] = null; //initializing null

                Session["MyCart"] = null; //initializing null
                Session["ttprice"] = null; //initializing null
                Session["ttproduct"] = null; //initializing null
                Session["PaymentMode"] = null; //initializing null
                Session["PaymentModeName"] = null; //initializing null
            }
        }

        //protected void HiddenButton_Click(object sender, EventArgs e) //invoked automatically using the javascript as soon as the page is loaded to send sms and email
        //{
        //    PageReloadScript.Visible = false; //to stop the page reload hiding the placeholder
        //    SendMsgAndEmail(); //Calling the method to send sms and email to the user
        //}
    }
}