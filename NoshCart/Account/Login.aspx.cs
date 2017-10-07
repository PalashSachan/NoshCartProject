using NoshCart.CheckLogin;
using NoshCart.DataLayer;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI;

namespace NoshCart.Account
{
    public partial class Login : Page
    {
        protected void Page_PreLoad(object sender, EventArgs e)
        {
            if (Session["prepage"] as string != null) //checking the previous page is null or not
            {
                if (Session["prepage"].ToString() == "Profile") //checking the previous page is profile page
                {
                    ErrorMessage.Visible = true; //displaying the error message
                    FailureText.Text = "The page you tried to view can only be viewed when you're logged in."; //setting the error message
                    Session["prepage"] = "Login"; //setting the previous page name
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //checking the postback
            {
                if (Session["UserIsNotLoggedInAndTryingToPlaceTheOrder"] != null && Session["prepage"] as string != null) //checking if the user is not logged in and trying to place the order is null or not and previous page is null or not
                {
                    if ((bool)Session["UserIsNotLoggedInAndTryingToPlaceTheOrder"] == true && Session["prepage"].ToString().StartsWith("Cart")) //checking if the user is not logged in and trying to place the order is true and previous page name starts with cart
                    {
                        ErrorMessage.Visible = true; //displaying the error message
                        FailureText.Text = "Please Log in to place your order"; //setting the error message
                        Session["prepage"] = "Login"; //setting the previous page to Login page name
                    }
                }
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e) //invokes when the user clicks the login button
        {
            DoLogin(TextBoxUsername.Text, TextBoxPassword.Text, RememberMe.Checked); //calling the method to login with the provided login credientials
        }

        private void DoLogin(string username, string password, bool RememberMeChecked) //invoked when the user clicks the login button
        {
            if (Check.AuthenticateUser(username, password)) //checking the username and password of the user and authenticating it
            {
                Session["IsAuthenticated"] = true; //setting the user is authenticated to true

                Session["UserName"] = username; //storing the username to the session variable

                Check.GetAuthenticatedUserAllInfo(); //getting all the info of the user

                Session["UserIsNotLoggedInAndTryingToPlaceTheOrder"] = false; //making it false because the user is now on the cart page initially before placing the order

                FormsAuthentication.RedirectFromLoginPage(username, RememberMeChecked); //authenticating the user and redirecting the user
            }
            else
            {
                Session["IsAuthenticated"] = false; //setting it false
                ErrorMessage.Visible = true; //displaying the error message
                FailureText.Text = "Invalid Username/Password";  //setting the error message text
            }
        }
    }
}