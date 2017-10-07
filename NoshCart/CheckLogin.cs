using System;
using System.IO;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;
using NoshCart.DataLayer;
using System.Security.Cryptography;
using System.Text;

namespace NoshCart.CheckLogin
{
    public class Check
    {
        public static void PurchasedProductsToArray() //invoked when to convert the datatable to array
        {
            DataTable data = (DataTable)HttpContext.Current.Session["MyCart"]; //getting the data of the datatable

            //Declare 2D-String array
            string[,] arrString =
                new string[data.Rows.Count + 1, data.Columns.Count];
            int index = 0;
            //Save ColumnName in 1st row of the array
            foreach (DataColumn dc in data.Columns)
            {
                arrString[0, index] =
                    Convert.ToString(dc.ColumnName);
                index++;
            }
            //Reset Index
            index = 0;
            //Now save DataTable values in array,
            //here we start from second row as ColumnNames are stored in first row
            for (int row = 1; row < data.Rows.Count + 1; row++)
            {
                for (int col = 0; col < data.Columns.Count; col++)
                {
                    arrString[row, col] =
                        Convert.ToString(data.Rows[row - 1][col]);
                }
            }
            //Return 2D-String Array

            HttpContext.Current.Session["MyCart"] = arrString; //copying the 2Darray into session variable
            RemoveFirstRow(); //calling function to remove the first row of 2Darray
        }

        private static void RemoveFirstRow() //invoked when it is called to remove the first row of 2D array
        {
            int rowToRemove = 0; //initialising the variable
            int rowsToKeep = ((string[,])(HttpContext.Current.Session["MyCart"])).GetLength(0) - 1; //getting the number of rows to be kept
            string[,] newArr2d = new string[rowsToKeep, ((string[,])(HttpContext.Current.Session["MyCart"])).GetLength(1)]; //creating the new 2D array variable of reduced size
            int currentRow = 0; //initialising the variable

            //swapping and moving of the contents of 2D array
            for (int i = 0; i < ((string[,])(HttpContext.Current.Session["MyCart"])).GetLength(0); i++)
            {
                if (i != rowToRemove)
                {
                    for (int j = 0; j < ((string[,])(HttpContext.Current.Session["MyCart"])).GetLength(1); j++)
                    {
                        newArr2d[currentRow, j] = ((string[,])(HttpContext.Current.Session["MyCart"]))[i, j];
                    }
                    currentRow++;
                }
            }

            HttpContext.Current.Session["MyCart"] = newArr2d; //saving the 2D array into session
        }

        public static void GetAuthenticatedUserAllInfo() //invoked when to get the all user info
        {
            DataTable DataTableOfAuthenticatedUser = new DataTable(); //creating the datatable
            DataTableOfAuthenticatedUser = RunSQLQuery("Select * from UserLoginData where Username = '" + HttpContext.Current.Session["Username"].ToString()
                + "'  COLLATE SQL_Latin1_General_CP1_CS_AS"); //calling the function to runSQL query and store the result into the datatable

            HttpContext.Current.Session["Id"] = (long)DataTableOfAuthenticatedUser.Rows[0]["Id"]; //storing the current user value into session variable
            HttpContext.Current.Session["Username"] = DataTableOfAuthenticatedUser.Rows[0]["Username"].ToString(); //storing the current user value into session variable
            HttpContext.Current.Session["Gender"] = DataTableOfAuthenticatedUser.Rows[0]["Gender"].ToString(); //storing the current user value into session variable
            HttpContext.Current.Session["Email"] = DataTableOfAuthenticatedUser.Rows[0]["Email"].ToString(); //storing the current user value into session variable
            HttpContext.Current.Session["PhoneNumber"] = DataTableOfAuthenticatedUser.Rows[0]["PhoneNumber"].ToString(); //storing the current user value into session variable
            HttpContext.Current.Session["Address"] = DataTableOfAuthenticatedUser.Rows[0]["Address"].ToString(); //storing the current user value into session variable
            HttpContext.Current.Session["City"] = DataTableOfAuthenticatedUser.Rows[0]["City"].ToString(); //storing the current user value into session variable
            HttpContext.Current.Session["State"] = DataTableOfAuthenticatedUser.Rows[0]["State"].ToString(); //storing the current user value into session variable
            HttpContext.Current.Session["Password"] = DataTableOfAuthenticatedUser.Rows[0]["Password"].ToString(); //storing the current user value into session variable

            DataTableOfAuthenticatedUser.Clear(); //clearing the datatable
        }

        public static bool AuthenticateUser(string username, string password) //invoked when to Authenticate the User
        {
            using (SqlConnection con = new SqlConnection(DataAccess.ConnectionString)) //creating the sql connection
            {
                SqlCommand cmd = new SqlCommand("SP_UserLoginCheck", con); //creatin the sql command and passing the stored procedure name and sql connection
                cmd.CommandType = CommandType.StoredProcedure; //setting the type of sql command as Stored Procedure

                //assigning the value to sql parameter
                SqlParameter SQLParamUserName = new SqlParameter("@CustomerUserName", username);
                SqlParameter SQLParamPassword = new SqlParameter("@CustomerPassword", GetEncryptedPassword(password));

                //adding the parameter to sql command
                cmd.Parameters.Add(SQLParamUserName);
                cmd.Parameters.Add(SQLParamPassword);

                con.Open(); //opening the sql connection

                int ReturnCode = (int)cmd.ExecuteScalar(); //executing the sql command and getting the return code

                return ReturnCode == 1; //returning the returncode
            }
        }

        private static DataTable RunSQLQuery(string query) //invoked to run any SQL query
        {
            using (SqlConnection con = new SqlConnection(DataAccess.ConnectionString)) //creating the sql connection
            {
                SqlDataAdapter sda = new SqlDataAdapter(query, con); //sql command execution
                DataTable dt = new DataTable(); //creating the datatable
                sda.Fill(dt); //filling the datatable
                return dt; //returning the datatable
            }
        }

        public static void IsUserImageAvailableAndGetOldImageURL() //invoked when to check the user profile image is available or not
        {
            using (SqlConnection con = new SqlConnection(DataAccess.ConnectionString)) //creating the sql connection
            {
                string query = "Select ImageURL from UserProfileImageData where Id = '" + HttpContext.Current.Session["Id"].ToString() + "'"; //query to run
                SqlCommand cmd = new SqlCommand(query, con); //passing the sqql query and connectiong to run the query
                cmd.CommandType = CommandType.Text; //setting the command type as the text query

                con.Open(); //opening the sql connection

                var imageURL = cmd.ExecuteScalar(); //executing the command and storing the image URL

                if (imageURL == null) //checking for null
                {
                    HttpContext.Current.Session["UserImageAvailable"] = false; //setting the image is not available
                }
                else
                {
                    HttpContext.Current.Session["UserImageAvailable"] = true; //setting the image is available
                    HttpContext.Current.Session["OldImageURL"] = imageURL.ToString(); //saving the image URL into session variable
                }
            }
        }

        public static void GenerateOrderID() //invoked when the user places the order and here we generate the OrderID
        {
            using (SqlConnection con = new SqlConnection(DataAccess.ConnectionString)) //creating the sql connection
            {
                SqlCommand cmd = new SqlCommand("SP_GetOrderID", con); //passing the stored procedure name and connecting string
                cmd.CommandType = CommandType.StoredProcedure; //setting the command type as stored procedure

                SqlParameter SQLParamUserID = new SqlParameter("@UserID", Convert.ToInt64(HttpContext.Current.Session["Id"])); //assigning the value to sql parameter

                cmd.Parameters.Add(SQLParamUserID); //adding the parameteres

                con.Open(); //opening the sql connection

                var OrderID = cmd.ExecuteScalar(); //executing the command and getting the order ID
                HttpContext.Current.Session["OrderID"] = Convert.ToInt64(OrderID.ToString()); //saving the order ID into session variable
            }
        }

        public static string ImageInsertOrUpdate(HttpPostedFile postedFile, string url) //invoked when the user insert or update the profile image
        {
            string fileName = Path.GetFileName(postedFile.FileName); //getting the filename of the file
            int fileSize = postedFile.ContentLength; //getting the file size

            using (SqlConnection con = new SqlConnection(DataAccess.ConnectionString)) //creating the sql connection
            {
                SqlCommand cmd = new SqlCommand("SP_UserProfileImageInsertUpdate", con); //passing the stored procedure name and connecting string
                cmd.CommandType = CommandType.StoredProcedure; //setting the command type as stored procedure

                //adding the parameters into sql command
                SqlParameter paramId = new SqlParameter()
                {
                    ParameterName = "@Id",
                    Value = Convert.ToInt64(HttpContext.Current.Session["Id"])
                };
                cmd.Parameters.Add(paramId);

                SqlParameter paramName = new SqlParameter()
                {
                    ParameterName = "@Name",
                    Value = fileName
                };
                cmd.Parameters.Add(paramName);

                SqlParameter paramSize = new SqlParameter()
                {
                    ParameterName = "@Size",
                    Value = fileSize
                };
                cmd.Parameters.Add(paramSize);

                SqlParameter paramImageURL = new SqlParameter()
                {
                    ParameterName = "@ImageURL",
                    Value = url
                };
                cmd.Parameters.Add(paramImageURL);


                con.Open(); //opening the sql connection
                var imageURL = cmd.ExecuteScalar(); //executing the stored procedure and getting the image URL

                HttpContext.Current.Session["NewImageURL"] = imageURL.ToString(); //saving the calue into session variable

                return imageURL.ToString(); //returning the image URL
            }
        }

        public static string GetEncryptedPassword(string Password) //invoked when to encrypt password
        {
            using (SHA1Managed sha1 = new SHA1Managed()) //creating the SHA1Managed class object
            {
                var hash = sha1.ComputeHash(Encoding.UTF8.GetBytes(Password)); //computing and storing the hash into variable
                var sb = new StringBuilder(hash.Length * 2); //declaring the stringbuilder variable

                //storing each character in hash into stringbuilder
                foreach (byte b in hash)
                {
                    sb.Append(b.ToString("X2"));
                }

                return sb.ToString(); //returning the hash value
            }
        }

        public static void DoLogin(string username, string password) //invoked when to do the login after the user registeration
        {
            if (AuthenticateUser(username, password)) //authenticating the user with username password
            {
                HttpContext.Current.Session["IsAuthenticated"] = true; //setting it true

                HttpContext.Current.Session["UserName"] = username; //setting the username

                GetAuthenticatedUserAllInfo(); //calling the method to get all the user info
                
                HttpContext.Current.Session["prepage"] = "Register"; //setting the previous page to register

                //HttpContext.Current.Session["UserIsNotLoggedInAndTryingToPlaceTheOrder"] = false; //making it false because the user is now on the cart page initially before placing the order

                FormsAuthentication.RedirectFromLoginPage(username, true); //signing IN and redirecting the user
            }
        }
    }
}