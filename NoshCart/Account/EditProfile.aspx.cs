using NoshCart.CheckLogin;
using NoshCart.DataLayer;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web;
using System.Web.UI;

namespace NoshCart.Account
{
    public partial class EditProfile : Page
    {
        protected void Page_PreLoad(object sender, EventArgs e)
        {
            if (Session["PrePage"] != null) //Checking if the variable is null or not
            {
                if (Session["PrePage"].ToString() != "Profile") //checking if the previous page was profile
                {
                    Response.Redirect("Profile"); //send back the user to profile page
                }
            }
            else
            {
                Session["PrePage"] = "EditProfile"; //setting the previous page to current page editprofile name
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //checking the postback
            {
                Check.IsUserImageAvailableAndGetOldImageURL(); //checking if the user image is available or not and if available then get the image URL also

                if ((bool)Session["UserImageAvailable"] == false) //checking the user image available or not
                {
                    SetDefaultImage(); //setting the default image accouding to gender
                }
                else
                {
                    if (File.Exists(Server.MapPath(Session["OldImageURL"].ToString()))) //checking if the URL of the file exist 
                    {
                        UserProfileImage.ImageUrl = Session["OldImageURL"].ToString(); //set the user image
                    }
                    else
                    {
                        Session["UserImageAvailable"] = false; //setting the user image is not available
                        SetDefaultImage(); //setting the default image
                    }
                }

                TextBoxEmail.Text = Session["Email"].ToString(); //assigning the value
                TextBoxAddress.Text = Session["Address"].ToString(); //assigning the value
                TextBoxCity.Text = Session["City"].ToString(); //assigning the value
                TextBoxState.Text = Session["State"].ToString(); //assigning the value
                TextBoxPhoneNumber.Text = Session["PhoneNumber"].ToString(); //assigning the value

                if (Session["Gender"].ToString() == "Male") //checking the gender
                {
                    RadioButtonGender.SelectedValue = "1"; //setting the value male to the Radio Button
                }
                else
                {
                    RadioButtonGender.SelectedValue = "2"; //setting the value female to the Radio Button
                }

                FileUploadBrowseImage.Attributes["onchange"] = "UploadFile(this)"; //adding the attributes to FileUpload web control
            }

            if (IsPostBack) //checking the postback
            {
                if (ClickedOnSaveDataUserDetails) //checking if the request came from the save button only
                {
                    SaveData(); //calling the method to save the the user details
                    ClickedOnSaveDataUserDetails = false; //setting the value to false
                }
            }
        }

        private void SetDefaultImage() //invoked when there is need to set the default image of user
        {
            if (Session["Gender"].ToString() == "Male") //checking the gender name
            {
                UserProfileImage.ImageUrl = "~/Image/User-Icon-Male-512x512.png"; //setting the image
            }
            else
            {
                UserProfileImage.ImageUrl = "~/Image/User-Icon-Female-512x512.png"; //setting the image
            }
        }

        public string NewImageURL; //declaring the variable to store the imageURL

        public bool ClickedOnSaveDataUserDetails { get; set; } = false; //declaring the bool type variable and setting the initial value to false

        private bool SaveData() //invoked when the user clicks save button to save user details data
        {
            using (SqlConnection con = new SqlConnection(DataAccess.ConnectionString)) //creating the sql connection object and passing the connection string object for the connection with database
            {
                SqlCommand cmd = new SqlCommand("SP_UserData", con); //creating the sqlcommand object and passing the parameters as storedprocedures name and sqlconnection
                cmd.CommandType = CommandType.StoredProcedure; //setting the value of command type to be treated as the stroedprocedures

                SqlParameter UserID = new SqlParameter("@UserID", Convert.ToInt64(Session["Id"])); //adding the new parameter with its values
                SqlParameter Pass = new SqlParameter("@CustomerPassword", Session["Password"].ToString()); //adding the new parameter with its values

                SqlParameter username = new SqlParameter("@CustomerUserName", Session["Username"].ToString()); //setting the name and its value
                SqlParameter email = new SqlParameter("@CustomerEmailID", TextBoxEmail.Text); //setting the name and its value
                SqlParameter address = new SqlParameter("@CustomerAddress", TextBoxAddress.Text); //setting the name and its value
                SqlParameter city = new SqlParameter("@CustomerCity", TextBoxCity.Text); //setting the name and its value
                SqlParameter state = new SqlParameter("@CustomerState", TextBoxState.Text); //setting the name and its value
                SqlParameter phonenumber = new SqlParameter("@CustomerPhoneNumber", TextBoxPhoneNumber.Text); //setting the name and its value
                SqlParameter gender = new SqlParameter("@Gender", RadioButtonGender.SelectedItem.Text); //setting the name and its value

                cmd.Parameters.Add(UserID); //adding the new parameter with its values
                cmd.Parameters.Add(Pass); //adding the new parameter with its values

                cmd.Parameters.Add(username); //adding the new parameter with its values
                cmd.Parameters.Add(email); //adding the new parameter with its values
                cmd.Parameters.Add(address); //adding the new parameter with its values
                cmd.Parameters.Add(city); //adding the new parameter with its values
                cmd.Parameters.Add(state); //adding the new parameter with its values
                cmd.Parameters.Add(phonenumber); //adding the new parameter with its values
                cmd.Parameters.Add(gender); //adding the new parameter with its values

                con.Open(); //opening the sqlconnection database connection
                int ReturnCode = (int)cmd.ExecuteScalar(); //executing the command amd getting the return code
                con.Close(); //closing the sqlconnection database connection

                if (ReturnCode == 3) //checking the value
                {
                    LabelChangesSaved.Visible = true; //displaying the message
                    LabelChangesSaved.Text = "Profile Updated Successfully with return code"; //setting the display message
                    return true; //return true
                }
                else
                {
                    ErrorMessage.Visible = true; //displaying the message
                    FailureText.Text = "Error occurred..Please Try Again Later"; //setting the display message
                    return false; //return false
                }
            }
        }

        private void SaveImage(HttpPostedFile postedFile) //invoked when the user clicks on the save button
        {
            int fileSize = postedFile.ContentLength; //getting the file size of the uploaded file

            if (fileSize <= 2048000) //checking the filesize in bytes
                {
                    Check.IsUserImageAvailableAndGetOldImageURL(); //checking if the user image is available or not and if available then get the image URL also

                    NewImageURL = Check.ImageInsertOrUpdate(postedFile, "~/Image/User_Profile/" + Session["Id"].ToString()+ "_" + Path.GetFileName(FileUploadBrowseImage.FileName)); //updating or inserting the image and getting the inserted or updated imageURL

                    UserProfileImage.ImageUrl = NewImageURL; //setting the new image URL to display the image

                    if(Session["OldImageURL"] as string != null) //checking is the oldimageURL is null
                    {
                        if (File.Exists(Server.MapPath(Session["OldImageURL"].ToString()))) //checking if the old file already exist
                        {
                            File.Delete(Server.MapPath(Session["OldImageURL"].ToString())); //deleting the old file from server
                        }
                    }
                    
                    FileUploadBrowseImage.SaveAs(Server.MapPath(NewImageURL)); //saving the new file

                    LabelUploadImageMessage.Visible = true; //displaying the upload image message
                    LabelUploadImageMessage.Text = "Image Saved Successfully"; //setting the message
                    LabelUploadImageMessage.ForeColor = Color.Green; //making the text green of the text message

                    Session["UserImageAvailable"] = true; //setting the value true as now the user image is available now
                }

                else
                {
                LabelUploadImageMessage.Visible = true; //displaying the message
                LabelUploadImageMessage.Text = "Only images with 2MB(2048 KB) size can be uploaded"; //setting the error message
                LabelUploadImageMessage.ForeColor = Color.Red; //making the text red of the text message
                Session["UserImageAvailable"] = false; //setting the value false as stille the user image is not available
            }
        }

        public string fileExtension { get; set; } //declaring the string type variable

        protected void ButtonSaveAll_Click(object sender, EventArgs e) //invoked when the user clicks the save button to save the user details
        {
            if(SaveData()) //saving the user details
            {
                ClickedOnSaveDataUserDetails = true; //setting it true
                Check.GetAuthenticatedUserAllInfo(); //updating the user details
                Response.Redirect("Profile"); //redirecting the user to profile page
            }
            else
            {
                ClickedOnSaveDataUserDetails = false; //setting it false
                ErrorMessage.Visible = true; //displaying the error message
                FailureText.Text = "Error occurred..Please Try Again Later"; //setting the text of error message
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e) //invoked when the user clicks the upload image button
        {
            SaveImage(FileUploadBrowseImage.PostedFile); //calling the saveimage method and saving the image
        }
    }
}