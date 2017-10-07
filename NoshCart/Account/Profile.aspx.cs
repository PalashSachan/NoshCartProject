using System;
using System.Web.UI;
using NoshCart.CheckLogin;
using System.IO;

namespace NoshCart.Account
{
    public partial class Profile : Page
    {
        protected void Page_PreLoad(object sender, EventArgs e)
        {
            if (Session["UserIsNotLoggedInAndTryingToPlaceTheOrder"] != null && Session["prepage"] as string != null) //checking the variables for null
            {
                if ((bool)Session["UserIsNotLoggedInAndTryingToPlaceTheOrder"] == true && Session["prepage"].ToString() == "Register" || Session["prepage"].ToString() == "Login") //checking the conditions
                {
                    Response.Redirect("~/Cart"); //redirecting the user
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LabelCustomerUserName.Text = "Welcome, " + Session["Username"].ToString(); //assigning the value
                LabelEmail.Text = Session["Email"].ToString(); //assigning the value
                LabelPhoneNumber.Text = Session["PhoneNumber"].ToString(); //assigning the value
                LabelAddress.Text = Session["Address"].ToString(); //assigning the value
                LabelCity.Text = Session["City"].ToString(); //assigning the value
                LabelState.Text = Session["State"].ToString(); //assigning the value
                LabelGender.Text = Session["Gender"].ToString(); //assigning the value

                Check.IsUserImageAvailableAndGetOldImageURL(); //Checking the profile image is available or not

                if ((bool)Session["UserImageAvailable"] == false) //checking the image available or not
                {
                    SetImage(); //setting the default image
                }
                else
                {
                    if (File.Exists(Server.MapPath(Session["OldImageURL"].ToString()))) //checking if the image file exists of the server
                    {
                        ImageUserDisplay.ImageUrl = Session["OldImageURL"].ToString(); //displaying the user image
                    }
                    else
                    {
                        Session["UserImageAvailable"] = false; //setting the image available to false
                        SetImage(); //setting the default image
                    }
                }
                Session["prepage"] = "Profile"; //setting the current page as previous page
            }
        }

        void SetImage() //invoked when default user image is to be set
        {
            if (Session["Gender"].ToString() == "Male") //checking the gender to display the image accordingly
            {
                ImageUserDisplay.ImageUrl = "~/Image/User-Icon-Male-512x512.png"; //displaying the user image
            }
            else
            {
                ImageUserDisplay.ImageUrl = "~/Image/User-Icon-Female-512x512.png"; //displaying the user image
            }
        }
    }
}