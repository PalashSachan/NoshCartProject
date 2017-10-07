using NoshCart.CheckLogin;
using NoshCart.DataLayer;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace NoshCart.Account
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserIsNotLoggedInAndTryingToPlaceTheOrder"] != null) //checking for null variable
                {
                    if ((bool)Session["UserIsNotLoggedInAndTryingToPlaceTheOrder"] == true && Session["prepage"].ToString().StartsWith("Login")) //checking the conditions
                    {
                        ErrorMessage.Visible = true; //displaying the error
                        FailureText.Text = "Please Sign Up to place your order"; //setting the error message
                        Session["prepage"] = "Register"; //setting previous page as current page
                    }
                }
            }
        }

        protected void CreateUser_Click(object sender, EventArgs e) //invoked when the user clicks Register Button
        {
            using (SqlConnection con = new SqlConnection(DataAccess.ConnectionString)) //creating the sql connection
            {
                SqlCommand cmd = new SqlCommand("SP_UserData", con); //creating the sql command
                cmd.CommandType = CommandType.StoredProcedure; //setting the command type as stored procedure

                long NullId = 0; //setting the UserID for the initial time as null or 0 zero

                SqlParameter UserID = new SqlParameter("@UserID", Convert.ToInt64(NullId)); //assigning the value to sql parameter
                SqlParameter username = new SqlParameter("@CustomerUserName", TextBoxUserName.Text); //assigning the value to sql parameter
                SqlParameter email = new SqlParameter("@CustomerEmailID", TextBoxEmail.Text); //assigning the value to sql parameter
                SqlParameter password = new SqlParameter("@CustomerPassword", Check.GetEncryptedPassword(TextBoxPassword.Text)); //assigning the value to sql parameter
                SqlParameter address = new SqlParameter("@CustomerAddress", TextBoxAddress.Text); //assigning the value to sql parameter
                SqlParameter city = new SqlParameter("@CustomerCity", TextBoxCity.Text); //assigning the value to sql parameter
                SqlParameter state = new SqlParameter("@CustomerState", TextBoxState.Text); //assigning the value to sql parameter
                SqlParameter phonenumber = new SqlParameter("@CustomerPhoneNumber", TextBoxNumber.Text); //assigning the value to sql parameter
                SqlParameter gender = new SqlParameter("@Gender", RadioButtonGender.SelectedItem.Text); //assigning the value to sql parameter

                cmd.Parameters.Add(UserID); //adding the parameter to sql command
                cmd.Parameters.Add(username); //adding the parameter to sql command
                cmd.Parameters.Add(email); //adding the parameter to sql command
                cmd.Parameters.Add(password); //adding the parameter to sql command
                cmd.Parameters.Add(address); //adding the parameter to sql command
                cmd.Parameters.Add(city); //adding the parameter to sql command
                cmd.Parameters.Add(state); //adding the parameter to sql command
                cmd.Parameters.Add(phonenumber); //adding the parameter to sql command
                cmd.Parameters.Add(gender); //adding the parameter to sql command

                con.Open(); //opening the sql connection

                int ReturnCode = (int)cmd.ExecuteScalar(); //executing the sql command and getting the return code

                if (ReturnCode == -1) //checking the return code
                {
                    ErrorMessage.Visible = true; //displaying the error message
                    FailureText.Text = "Username Already In Use"; //setting the error message
                }
                else if (ReturnCode == -2)
                {
                    ErrorMessage.Visible = true; //displaying the error message
                    FailureText.Text = "Email Already In Use"; //setting the error message
                }
                else
                {
                    Check.DoLogin(TextBoxUserName.Text, TextBoxPassword.Text); //calling the method to login the new created user
                }
            }
        }
    }
}