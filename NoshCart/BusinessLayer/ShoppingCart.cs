using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using NoshCart.CheckLogin;
using NoshCart.DataLayer;

namespace NoshCart.BusinessLayer
{
    public class ShoppingCart
    {
        //Declaring the public type variables

        public string categoryname;
        public int categoryid;
        public int ProductID;
        
        public string productname;
        public string productimage;
        public string productprice;
        public string productdiscription;

        public long sID;
        public long sOrderID;
        public long subOrderID;

        public string OrderStatus;
        public string OrderNo;

        public string PaymentMethod;

        public int TotalProducts;
        public int TotalPrice;
        public int StockType;
        public int Flag;

        public string username;
        public string emailid;
        public string password;
        
        public void addnewcategory() //invoked when admin adds the new category
        {
            //creating the sqlparameter object
            SqlParameter[] parameters = new SqlParameter[1];

            //adding the parameters
            parameters[0] = DataAccess.AddParameter("@CategoryName", categoryname, SqlDbType.VarChar, 200);

            //executing the Stored Procedure
            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_AddNewCategory", parameters);
        }

        public void addnewproduct() //invoked when admin adds the new product
        {
            //creating the sqlparameter object
            SqlParameter[] parameters = new SqlParameter[6];

            //adding the parameters
            parameters[0] = DataAccess.AddParameter("@ProductName", productname, SqlDbType.VarChar, 200);
            parameters[1] = DataAccess.AddParameter("@ProductImage", productimage, SqlDbType.VarChar, 500);
            parameters[2] = DataAccess.AddParameter("@ProductPrice", productprice, SqlDbType.Int, 100);
            parameters[3] = DataAccess.AddParameter("@ProductDiscription", productdiscription, SqlDbType.VarChar, 600);
            parameters[4] = DataAccess.AddParameter("@CategoryId", categoryid, SqlDbType.Int, 100);
            parameters[5] = DataAccess.AddParameter("@ProductQuantity", TotalProducts, SqlDbType.Int, 100);

            //executing the Stored Procedure
            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_AddNewProduct", parameters);
        }

        public DataTable GetCategories() //invoked when to get the list of all the categories
        {
            //creating the sqlparameter object
            SqlParameter[] parameters = new SqlParameter[0];

            //executing the Stored Procedure
            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_GetAllCategories", parameters);
            return dt; //return the datatable
        }

        public DataTable Getallproducts() //invoked when to get all the products
        {
            //creating the sqlparameter object
            SqlParameter[] parameters = new SqlParameter[1];

            //adding the parameters
            parameters[0] = DataAccess.AddParameter("@CategoryId", categoryid, SqlDbType.Int, 20);

            //executing the Stored Procedure
            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_GetAllProducts", parameters);
            return dt; //return the datatable
        }

        internal DataTable SaveCustomerDetails() //invoked when the user places the order to save the customer order details
        {
            //creating the sqlparameter object
            SqlParameter[] parameters = new SqlParameter[5];

            //adding the parameters
            parameters[0] = DataAccess.AddParameter("@Id", Convert.ToInt64(HttpContext.Current.Session["Id"]), SqlDbType.BigInt, 100);
            parameters[1] = DataAccess.AddParameter("@OrderID", Convert.ToInt64(HttpContext.Current.Session["OrderID"]).ToString(), SqlDbType.BigInt, 100);
            parameters[2] = DataAccess.AddParameter("@TotalProducts", TotalProducts, SqlDbType.Int,100);
            parameters[3] = DataAccess.AddParameter("@TotalPrice", TotalPrice, SqlDbType.Int, 100);
            parameters[4] = DataAccess.AddParameter("@PaymentMethod", PaymentMethod, SqlDbType.VarChar, 100);

            //executing the Stored Procedure
            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_SaveCustomerDetails", parameters);

            return dt; //return the datatable
        }

        internal void SaveCustomerProducts() //invoked when the user places the order to save the product details
        {
            //creating the sqlparameter object
            SqlParameter[] parameters = new SqlParameter[5];

            //adding the parameters
            parameters[0] = DataAccess.AddParameter("@Id", Convert.ToInt64(sID), SqlDbType.BigInt, 20);
            parameters[1] = DataAccess.AddParameter("@OrderID", Convert.ToInt64(sOrderID), SqlDbType.BigInt, 20);
            parameters[2] = DataAccess.AddParameter("@SubOrderID", Convert.ToInt64(subOrderID), SqlDbType.BigInt, 20);
            parameters[3] = DataAccess.AddParameter("@ProductID", ProductID, SqlDbType.Int, 20);
            parameters[4] = DataAccess.AddParameter("@TotalProducts", TotalProducts, SqlDbType.Int, 10);

            //executing the Stored Procedure
            DataTable dt = DataAccess.ExecuteDTByProcedure("SP_SaveCustomerProducts",parameters);
        }
    }
} 