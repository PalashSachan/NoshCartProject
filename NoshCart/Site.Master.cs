using System;
using System.Data;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NoshCart
{
    public partial class Site : MasterPage
    {
        protected void Page_PreLoad(object sender, EventArgs e)
        {
            //PreLoad occurs before the post back data is loaded in the controls.
            //This event can be handled by overloading the OnPreLoad method or creating a Page_PreLoad handler.

            //To learn more about Page Life Cycle Events in ASP.NET
            //Please refer:-
            //https://msdn.microsoft.com/en-us/library/ms178472.aspx
            //http://www.c-sharpcorner.com/UploadFile/8911c4/page-life-cycle-with-examples-in-Asp-Net/
            //https://www.tutorialspoint.com/asp.net/asp.net_life_cycle.htm
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //IsPostBack is a Page level property, that can be used to determine whether the page is being loaded in response to a client postback, or if it is being loaded and accessed for the first time. In real time there are many situations where IsPostBack property is used. For Detailed Explanation See :- https://www.youtube.com/watch?v=yZJQ4Z6kEzs
            {
                if (Session["CartQuantity"] as string != null) //Checking if variable "CartQuantity" is available in Session object and is not equal to null
                {
                    CartQuantityIDLinkButton.Text = Session["CartQuantity"].ToString(); //Assigning value to "CartQuantity"
                }
            }
        }

        //For Detailed Explanation See :- https://www.youtube.com/watch?v=JxRBUZrMb58
        public LinkButton CartQuantityIDButton // The property returns a TextBox
        {
            get
            {
                return this.CartQuantityIDLinkButton; //Return the textbox on the master page
            }
        }
        
        protected void WelcomeUserName_Click(object sender, EventArgs e) //invoked when user clicks the profile button
        {
            Response.Redirect("~/Account/Profile"); //Navigate user to Profile page of loggedin user when clicked on Profile Button
        }

        protected void LoginState_LoggingOut(object sender, LoginCancelEventArgs e) //invoked when user clicks the logout button
        {
            string temp = "";
            DataTable dt = new DataTable();
            string url = Request.Url.AbsoluteUri; //getting the current page URL so that after logging out the user is redirected to the same page

            if (Path.GetFileNameWithoutExtension(Request.Url.AbsoluteUri) == "Profile"
                || Path.GetFileNameWithoutExtension(Request.Url.AbsoluteUri).StartsWith("ThankYou")
                || Path.GetFileNameWithoutExtension(Request.Url.AbsoluteUri) == "EditProfile"
                || Path.GetFileNameWithoutExtension(Request.Url.AbsoluteUri) == "ChangePassword") //if the current page are these then the user should not be redirected to these pages again after logging out
            {
                url = "~/Menu"; // setting the URL to menu page
            }

            Session["CartQuantity"] = Session["CartQuantity"] as string != null ? Session["CartQuantity"].ToString() : "0";
            temp = Session["CartQuantity"].ToString(); //Checking if null or not and then Storing Cart Quantity to varaible. I have done this so that when the user is logged out then also the old quantity of cart is shown to the user.

            Session["MyCart"] = Session["MyCart"] != null ? (DataTable)Session["MyCart"] : null;
            dt = (DataTable)Session["MyCart"];        //Checking if null or not and then Converting Session Object to Datatable and storing it. I have done this so that when the user is logged out then also the old items of cart is still available in the cart to the user.

            FormsAuthentication.SignOut(); //Calling SignOut method in FormsAuthentication class to signout/logout the current user

            Session.Clear(); //Clearing the entire session
            Session["IsAuthenticated"] = false; //Setting false to IsAuthenticated variable of Session object because now user is logged out.
            Session["CartQuantity"] = temp; //Reassigning the value
            Session["MyCart"] = dt; //Reassigning the value

            Response.Redirect(url); //redirect user to the assigined URL
        }
    }
}