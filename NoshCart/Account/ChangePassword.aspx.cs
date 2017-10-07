using NoshCart.CheckLogin;
using NoshCart.DataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI;

namespace NoshCart.Account
{
    public partial class ChangePassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["uid"] == null && User.Identity.Name == "") //checking the querystring and loggedin user name..if its not available then redirect the user to the login page
            {
                FormsAuthentication.RedirectToLoginPage(); //redirecting the user to the login page
            }

            if (!IsPostBack) //checking postback
            {
                if (Request.QueryString["uid"] != null) //checking if the querystring is not null
                {
                    if (IsPasswordResetLinkValid() == false) //checking the querystring is valid or not
                    {
                        ErrorMessage.Visible = true; //displaying the error message
                        FailureText.Text = "Password Reset link has expired or is invalid"; //displaying the error message
                        PlaceHolderChangePassword.Visible = false; //changepassword textbox is not visible
                    }
                    PlaceHolderCurrentPassword.Visible = false; //currentpassword textbox is not visible
                }
                else if (User.Identity.Name != "") //checking if the username is empty
                {
                    PlaceHolderCurrentPassword.Visible = true; //show the currentpassword textbox also
                }
            }
        }

        protected void ChangePassword_Click(object sender, EventArgs e) //invoked when the user clicks on the change password button
        {
            if(PlaceHolderCurrentPassword.Visible) //checking if the currentpassword placeholder is visible or not
            {
                if(ChangeUserPasswordUsingCurrentPassword()) //calling method to change the password using the current password only
                {
                    LabelPasswordChanged.Visible = true; //display the password change message
                }
                else
                {
                    ErrorMessage.Visible = true; //show the error message
                    FailureText.Text = "Invalid Current Password"; //display the error message
                }
            }
            else if (Request.QueryString["uid"] != null) //checking the querystring is null or not
            {
                if(ChangeUserPassword()) //calling method to change the user password without using the current password
                {
                    LabelPasswordChanged.Visible = true; //display the password change message
                }
                else
                {
                    ErrorMessage.Visible = true; //show the error message
                    FailureText.Text = "Password Reset link has expired or is invalid"; //display the error message
                }
            }
        }

        private bool ExecuteSP(string SPName, List<SqlParameter> SPParameters) //invoked when to execute a sql storedprocedure
        {
            try //starting the try-catch block
            {
                using (SqlConnection con = new SqlConnection(DataAccess.ConnectionString)) //creating the sql connection object and passing the connection string object for the connection with database
                {
                    SqlCommand cmd = new SqlCommand(SPName, con); //creating the sqlcommand object and passing the parameters as storedprocedures name and sqlconnection
                    cmd.CommandType = CommandType.StoredProcedure; //setting the value of command type to be treated as the stroedprocedures

                    foreach (SqlParameter parameter in SPParameters) //adding all the parameters into the sqlcommand by loop
                    {
                        cmd.Parameters.Add(parameter); //adding the parameters to sqlcommand
                    }

                    con.Open(); //opening the sqlconnection database connection

                    return Convert.ToBoolean(cmd.ExecuteScalar()); //returning the value
                }
            }
            
            catch(SqlException) //catching the exception
            {
                return false; //returning the false
            }
        }

        private bool IsPasswordResetLinkValid() //invoked when to check the password reset link is valid or not
        {
            List<SqlParameter> paramList = new List<SqlParameter>() //creating the list to add the sql parameters
            {
                new SqlParameter() //creatig the new sql parameter
                {
                    ParameterName = "@GUID", //assigning the parameter name
                    Value = Request.QueryString["uid"] //assigning the querystring uid
                }
            };

            return ExecuteSP("SP_UserPasswordResetLinkIsValid", paramList); //returning the true or false and executing the sql stroedprocedure
        }

        private bool ChangeUserPassword() //invoked when the user change password without using the current password
        {
            List<SqlParameter> paramList = new List<SqlParameter>() //creating the list to add the sql parameters
            {
                new SqlParameter() //creatig the new sql parameter
                {
                    ParameterName = "@GUID", //assigning the parameter name
                    Value = Request.QueryString["uid"] //assigning the querystring uid
                },
                new SqlParameter() //creatig the new sql parameter
                {
                    ParameterName = "@Password", //assigning the parameter name
                    Value = Check.GetEncryptedPassword(NewPassword.Text) //assigning the value of new password which is encrypted
                }
            };
            
            return ExecuteSP("SP_UserChangePassword", paramList); //returning the true or false and executing the sql stroedprocedure
        }

        private bool ChangeUserPasswordUsingCurrentPassword() //invoked when user changes the password using the current password
        {
            List<SqlParameter> paramList = new List<SqlParameter>() //creating the list to add the sql parameters
            {
                new SqlParameter() //creatig the new sql parameter
                {
                    ParameterName = "@UserName", //assigning the parameter name
                    Value = Session["Username"] //assigning the value
                },
                new SqlParameter() //creatig the new sql parameter
                {
                    ParameterName = "@CurrentPassword", //assigning the parameter name
                    Value = Check.GetEncryptedPassword(CurrentPassword.Text) //assigning the value of new password which is encrypted
                },
                new SqlParameter() //creatig the new sql parameter
                {
                    ParameterName = "@NewPassword", //assigning the parameter name
                    Value = Check.GetEncryptedPassword(NewPassword.Text) //assigning the value of new password which is encrypted
                }
            };

            return ExecuteSP("SP_UserChangePasswordUsingCurrentPassword", paramList); //returning the true or false and executing the sql stroedprocedure
        }
    }
}