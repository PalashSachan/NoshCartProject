using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using NoshCart.BusinessLayer;
using System.Drawing;
using NoshCart.DataLayer;

namespace NoshCart
{
    public partial class Menu : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //checking the postback
            {
                if (Session["UserIsNotLoggedInAndTryingToPlaceTheOrder"] != null) //Checking if the variable is null or not
                {
                    if ((bool)Session["UserIsNotLoggedInAndTryingToPlaceTheOrder"] == true) //Simple Checking if the cart button is clicked OR last page was login or register then the user must be placing order 
                    {
                        Session["UserIsNotLoggedInAndTryingToPlaceTheOrder"] = false;  //making it false because the user is now on the menu page
                        Session["prepage"] = "Menu"; //assigning previous page as the menu page
                    }
                }

                lblcategoryname.Text = "Popular Available Food Items"; //setting label name
                lblproducts.Text = "Food Type"; //setting label name
                GetCategory(); //calling the function to get the list of categories available
                GetProduct(0); // get all product
                HighlightCartProducts(); //highlighting the cart products
            }
        }

        private void GetCategory() //function to get and set the categories
        {
            ShoppingCart k = new ShoppingCart(); //creating object of ShoppingCart Class
            dlcategories.DataSource = null; //setting datasource of categories to null
            dlcategories.DataSource = k.GetCategories(); //calling the GetCategories function available in shoppingcart class to get the list of available categories
            dlcategories.DataBind(); //setting the categories names to display it
        }

        private void GetProduct(int categoryid) //Get the available product names list according to the category ID in FoodType list items
        {
            ShoppingCart k = new ShoppingCart() //Creating object of ShoppingCart Class
            {
                categoryid = categoryid //Assigning the category ID to shoppingcart class local variable
            };

            Dlprod.DataSource = null; //setting datasource of categories to null
            Dlprod.DataSource = k.Getallproducts(); //calling the Getallproducts function available in shoppingcart class to get the list of all available products according to category ID
            Dlprod.DataBind(); //setting the categories names to display it
        }

        protected void LinkButton2_Click(object sender, EventArgs e) //this function is invoked when user clicks on the food type category list items
        {
            //pnlmycart.Visible = false; //hiding cart panel
            Pnlprod.Visible = true; //making visible product panel
            int categoryid = Convert.ToInt16((((LinkButton)sender).CommandArgument)); //getting the category id from the sender object
            GetProduct(categoryid); //getting the product names of the specified category ID with details and displaying it
            HighlightCartProducts(); //Highlighting cart products if they are added to the cart then it will be highlighted to green color
        }

        protected void btnaddtocart_Click(object sender, EventArgs e) //this function is invoked when user clicks on the add to cart button
        {
            string ProductID = Convert.ToInt16((((Button)sender).CommandArgument)).ToString(); //getting the product ID which is clicked by sender object
            string ProductQuantity = "1"; //setting the initial product quantity to 1(its temp..it can be changed further also)

            DataListItem currentitem = (sender as Button).NamingContainer as DataListItem; //getting the current current item as data list item
            Label lblavilablestock = currentitem.FindControl("lblavilablestock") as Label; //getting the available stock of the current item

            if (Session["MyCart"] != null) //checking if mycart variable in session object is null or not
            {
                DataTable dt = (DataTable)Session["MyCart"]; // converting entire session into data table
                var checkProduct = dt.AsEnumerable().Where(r => r.Field<string>("productid") == ProductID); //it checks wether the product is added or not if it is already added then it dont add again
                if (checkProduct.Count() == 0) // checks that if the product is added then it does not do anything else it increase the counter and the code is performed
                {
                    string query = "select * from products where productid=" + ProductID + ""; //sql query to get all products according to product ID
                    DataTable dtProducts = GetData(query); //calling function to execute this query which is passed as a parameter and then save it to datatable

                    DataRow dr = dt.NewRow(); //creating new row into dt datatable

                    dr["productid"] = ProductID; //adding "ProductID" to the column "productuid" in datatable
                    dr["name"] = Convert.ToString(dtProducts.Rows[0]["name"]); //adding name into table
                    dr["description"] = Convert.ToString(dtProducts.Rows[0]["description"]); //adding the description of the particular product
                    dr["price"] = Convert.ToString(dtProducts.Rows[0]["price"]); //adding the price of the particular product
                    dr["imageurl"] = Convert.ToString(dtProducts.Rows[0]["imageurl"]); //adding the imageURL of the product
                    dr["productquantity"] = ProductQuantity; //adding the product quantity
                    dr["availablestock"] = lblavilablestock.Text; //adding the available stock
                    dt.Rows.Add(dr); //adding the created new row into dt datatable

                    Session["MyCart"] = dt; //saving this dt datatable to MyCart variable of session object

                    UpdateCartQuantity(dt.Rows.Count.ToString()); //now finally updating or increasing the cart quantity

                }
            }
            else
            {
                string query = "select * from products where productid=" + ProductID + ""; //sql query to get all products according to product ID
                DataTable dtProducts = GetData(query); //calling function to execute this query which is passed as a parameter and then save it to datatable

                DataTable dt = new DataTable(); //creating new datatable dt
                dt.Columns.Add("productid", typeof(string)); //adding the new column of string type
                dt.Columns.Add("name", typeof(string)); //adding the new column of string type
                dt.Columns.Add("description", typeof(string)); //adding the new column of string type
                dt.Columns.Add("price", typeof(string)); //adding the new column of string type
                dt.Columns.Add("imageurl", typeof(string)); //adding the new column of string type
                dt.Columns.Add("productquantity", typeof(string)); //adding the new column of string type
                dt.Columns.Add("availablestock", typeof(string)); //adding the new column of string type

                DataRow dr = dt.NewRow(); //creating new row into dt datatable
                dr["productid"] = ProductID; //adding "ProductID" to the column "productuid" in datatable
                dr["name"] = Convert.ToString(dtProducts.Rows[0]["name"]); //adding name into table
                dr["description"] = Convert.ToString(dtProducts.Rows[0]["description"]); //adding the description of the particular product
                dr["price"] = Convert.ToString(dtProducts.Rows[0]["price"]); //adding the price of the particular product
                dr["imageurl"] = Convert.ToString(dtProducts.Rows[0]["imageurl"]); //adding the imageURL of the product
                dr["productquantity"] = ProductQuantity; //adding the product quantity
                dr["availablestock"] = lblavilablestock.Text; //adding the available stock

                dt.Rows.Add(dr); //adding the created new row into dt datatable

                Session["MyCart"] = dt; //saving this dt datatable to MyCart variable of session object

                UpdateCartQuantity(dt.Rows.Count.ToString()); //now finally updating or increasing the cart quantity
            }
            HighlightCartProducts(); //Now highlighting the added to cart products to green color
        } //add to cart button (video 12)

        private void HighlightCartProducts() //function to highlight cart products and change color from white to green.
        {
            if (Session["MyCart"] != null) //checking if mycart is null
            {
                DataTable dtProductsAddedtocart = (DataTable)Session["MyCart"]; //converting the session to datatable(By Type Casting it) and storing it in as new datatable
                if (dtProductsAddedtocart.Rows.Count > 0) //checking if there are any rows available in the datatable
                {
                    foreach (DataListItem item in Dlprod.Items) //using foreach loop to highlight all products in cart
                    {
                        HiddenField HfproductID = item.FindControl("HfproductID") as HiddenField; //getting the hiddenfield ID
                        if (dtProductsAddedtocart.AsEnumerable().Any(row => HfproductID.Value == row.Field<string>("productid"))) //checking hiddenfield id with the pproduct id..For More Info Please Visit :- https://www.youtube.com/watch?v=STad7hn4EEk
                        {
                            Button btnAddToCart = item.FindControl("btnAddToCart") as Button; //finding the button from the datalistitem and assigining it
                            btnAddToCart.BackColor = Color.Green; //changing the color of the button
                            btnAddToCart.Text = "Added To Cart"; //changing the text of the button
                            ButtonProceedToCheckout.Visible = true; //showing the buynow button visible
                        }
                    }
                }
            }
        }

        public DataTable GetData(string query)
        {
            DataTable dt = new DataTable(); //creating object of the datatable class
            string conn = DataAccess.ConnectionString; //getting the connection string
            SqlConnection con = new SqlConnection(conn); //creating the sql connection object and passing the connection string object for the connection with database
            con.Open(); //opening the sqlconnection database connection
            SqlDataAdapter da = new SqlDataAdapter(query, con); //creating the object of SqlDataAdapter and passing the query and sqlconnection object as parameters into it
            da.Fill(dt); //executing the query and adding the result table into the datatable
            con.Close(); //closing the sql connection
            return dt; //retuning the datatable
        }

        public void UpdateCartQuantity(string text) //invoked whenever there is the need to update the cart quantity
        {
            Session["CartQuantity"] = text; //saving the new cart value in session
            Master.CartQuantityIDButton.Text = text; //directly assigning the value to the cart link button text control of master page
        }
    }
}