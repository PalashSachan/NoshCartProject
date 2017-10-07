using System;
using System.Web.UI;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Data;
using NoshCart.DataLayer;
using System.Text;

namespace NoshCart.Account
{
    public partial class ForgotPassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if ((bool)Session["IsAuthenticated"] == true) //checking the user is Authenticated or not
            //{
            //    Response.Redirect("~/Menu"); //redirecting the user to menu page
            //}
            Form.DefaultButton = "SubmitButton";
        }

        protected void Forgot(object sender, EventArgs e) //invoked when user clicks on the forgot button
        {
            //if (IsValid) //checking the page validation is valid or not
            //{
                using (SqlConnection con = new SqlConnection(DataAccess.ConnectionString)) //creating the sql connection object and passing the connection string object for the connection with database
                {
                    SqlCommand cmd = new SqlCommand("SP_UserResetPassword", con); //creating the sqlcommand object and passing the parameters as storedprocedures name and sqlconnection
                    cmd.CommandType = CommandType.StoredProcedure; //setting the value of command type to be treated as the stroedprocedures

                    SqlParameter paramUsername = new SqlParameter("@UserName", TextBoxUsername.Text); //creating the object of sqlparameter and adding the parameter name and value

                    cmd.Parameters.Add(paramUsername); //adding the parameter to the list

                    con.Open(); //opening the sqlconnection database connection
                    SqlDataReader rdr = cmd.ExecuteReader(); //executing the command and getting the values stored in the sqldatareader

                    while (rdr.Read()) //checking if there are any next values in the sqldatareader
                    {
                        if (Convert.ToBoolean(rdr["ReturnCode"])) //checking the returncode value
                        {
                            ErrorMessage.Visible = false; //hiding the error message
                            SendPasswordResetEmail(rdr["Email"].ToString(), TextBoxUsername.Text, rdr["UniqueId"].ToString()); //sending the password reset email with uniqueID
                            DisplayMessage.Visible = true; //displaying the success message
                        }
                        else
                        {
                            ErrorMessage.Visible = true; //displaying the error message
                            FailureText.Text = "Username not found!"; //setting the error message text
                            DisplayMessage.Visible = false; //hiding the success label message
                        }
                    }
                }
            //}
        }

        private void SendPasswordResetEmail(string ToEmail, string UserName, string UniqueId) //invoked when the user wants the reset link to send to email
        {
            MailMessage mailMessage = new MailMessage("palashsachantesting@gmail.com", ToEmail); //creating the object of the mail message class and assiging the parameters the values to whome to send the email

            StringBuilder sbEmailBody = new StringBuilder(); //creating the string builder class

            //Now writting the message to the user with the reset link

            sbEmailBody.Append("Dear " + UserName + ",<br/><br/>"); 
            sbEmailBody.Append("Please click on the following link to reset your password");
            sbEmailBody.Append("<br/>");
            sbEmailBody.Append("http://noshcart.somee.com/Account/ChangePassword?uid=" + UniqueId);
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("<b>© " + DateTime.Now.Year + " - NoshCart.com</b>");

            mailMessage.IsBodyHtml = true; //marking the mailmessage class as the html type content

            mailMessage.Body = sbEmailBody.ToString(); //converting the mail message to string to store it in the body content
            mailMessage.Subject = "Reset Your Password - NoshCart.com"; //setting the subject of the email
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587); //setting the smtp client port number and server name

            smtpClient.Credentials = new System.Net.NetworkCredential() //creating the class object to add the user credentials from which the email will be sent to the user
            {
                UserName = "palashsachantesting@gmail.com", //adding the username or emailID of the account
                Password = "91@PalashTesting" //adding the password of the account
            };

            smtpClient.EnableSsl = false; //use the SSL to encrypt connection
            smtpClient.Send(mailMessage); //send the email
        }
    }
}