using NoshCart.CheckLogin;
using System;
using System.Data;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NoshCart
{
    public partial class Cart : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserIsNotLoggedInAndTryingToPlaceTheOrder"] = false; //making it false because the user is now on the cart page initially before placing the order
            btnshopping(); //displaying the cart items
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            Master.CartQuantityIDButton.Click += new EventHandler(btnshoppingClick); // Retrieve the master page associated with this content page using Master property and typecast to the actual master page and then reference the property. For Detailed Explanation See :- https://www.youtube.com/watch?v=JxRBUZrMb58
        }

        protected void btnshoppingClick(object sender, EventArgs e) //invoked when the databinding occurs of pnlmycart panel
        {
            btnshopping(); //calling the function to show cart items
        }

        protected void textproductquantity_TextChanged1(object sender, EventArgs e) //invoked when the user changes the quantity of the product which are available in the cart
        {
            TextBox txtQuantity = (sender as TextBox); //getting the current quantity from the sender object as the textbox item
            DataListItem currentitem = (sender as TextBox).NamingContainer as DataListItem; //getting the current item which has increased the quantity
            HiddenField ProductID = currentitem.FindControl("HfproductID") as HiddenField; //getting the productID of the particular item
            Label lblavailablestock = currentitem.FindControl("lblavailablestock") as Label; //getting the available stock

            if (txtQuantity.Text == string.Empty || txtQuantity.Text == "0" || txtQuantity.Text == "1") //checking the text of the textbox if its empty or its 0 or its 1 then change the value of the textbos to 1
            {
                txtQuantity.Text = "1"; //changing the value to 1
            }
            else
            {
                if (Session["MyCart"] != null) //checking th cart is null or not
                {
                    if (Convert.ToInt32(txtQuantity.Text) <= Convert.ToInt32(lblavailablestock.Text)) //checking the entered quantity amount is less than the available stock left
                    {
                        DataTable dt = (DataTable)Session["MyCart"]; //converting the cart to datatable and storing it in as dt datatable
                        DataRow[] rows = dt.Select("productid='" + ProductID.Value + "'"); //Assigning the value of the changed product with its ID from cart datatable and adding it as new row
                        int index = dt.Rows.IndexOf(rows[0]); //getting the index of the changed value in the cart datatable
                        dt.Rows[index]["productquantity"] = txtQuantity.Text; //setting the new quantity to the datatable at the selected product index
                        Session["MyCart"] = dt; //saving it in the session cart variable
                    }
                    else
                    {
                        lblavailablestockalert.Text = "Alert: Items should not be more than available stock"; //displaying the error message
                        txtQuantity.Text = "1"; //setting the quantity back to 1
                    }
                }
            }
            UpdateTotalBill(); //Now updating the total bill amount
        }

        private void UpdateTotalBill() //function invoked when updating the totalbill
        {
            long TotalPrice = 0; //initialising the value of totalprice
            long TotalProducts = 0; //initialising the value of totalproducts

            foreach (DataListItem item in Dlcartprod.Items) //using foreach loop to get the total product quantity and calculate all products total price of items available in the cart
            {
                long ProductPrice = Convert.ToInt64((item.FindControl("lblprice") as Label).Text) * Convert.ToInt64((item.FindControl("textproductquantity") as TextBox).Text); //calculating the total product price
                TotalPrice = TotalPrice + ProductPrice; //adding the total product price 
                TotalProducts += Convert.ToInt32((item.FindControl("textproductquantity") as TextBox).Text); //totaling the number of products
            }
            ttprice.Text = Convert.ToString(TotalPrice); //setting the total price of all the products in the cart
            ttproduct.Text = Convert.ToString(TotalProducts); //setting the total products available in the cart
        }

        public void UpdateCartQuantity(string text) //invoked whenever there is the need to update the cart quantity
        {
            Session["CartQuantity"] = text; //saving the new cart value in session
            Master.CartQuantityIDButton.Text = text; //directly assigning the value to the cart link button text control of master page
        }

        protected void PlaceTheOrder() //invoked when place order button is clicked
        {
            //storing these because we need to send these details to user via sms and email
            Session["ttprice"] = ttprice.Text; //Assigning the value of total price to session variable
            Session["ttproduct"] = ttproduct.Text; //Assigning the value of total products to session variable
            Session["PaymentMode"] = rblpaymentmothod.SelectedValue; //Assigning the value of payment method to session variable
            Session["PaymentModeName"] = rblpaymentmothod.SelectedItem.Text; //Assigning the value of payment mode name to session variable

            Session["CartQuantity"] = "0"; //setting the value 0 to the cart variable because the Order is completed successfully
            ttprice.Text = "0"; //setting the value 0 to the total price textbox because the Order is completed successfully
            ttproduct.Text = "0"; //setting the value 0 to the total products textbox because the Order is completed successfully

            Check.GenerateOrderID(); //generating the OrderID

            Session["IsFirstTime"] = true; //setting the value true to the session variable..i have done this so that when the user is on the thankyou page and if he trys to open that thankyou page again then this will prevent doing it
            Response.Redirect("ThankYou?OrderID=" + Session["OrderID"] + "&Status=success"); //redirecting user to thankyou page with two querystrings(1) sending the orderID and (2) sending the status message
        }

        public void btnshopping() //method to display cart and its contents
        {
            GetMyCart(); //calling this function to display the cart items
            lblcategoryname.Text = "Current Food Items In Cart"; //labeling the title
            lblproducts.Text = "Details"; //labeling the title
        }

        private void GetMyCart() //this function is invoked when cart items to be shown
        {
            DataTable dtProducts = Session["MyCart"] != null ? (DataTable)Session["MyCart"] : new DataTable(); //creating variable of type datatable and checking if mycart is null or not and then if its not null then converting the session to datatable and saving it to dtproducts else creating new datatable

            if (dtProducts.Rows.Count > 0) //checking the number of rows greater than 0
            {
                ttproduct.Text = dtProducts.Rows.Count.ToString(); //showing total products in cart

                UpdateCartQuantity(dtProducts.Rows.Count.ToString()); //updating the cart quantity according to the available products in the cart

                Dlcartprod.DataSource = dtProducts; //setting the datasource of cartproducts Datalist to datatable
                Dlcartprod.DataBind(); //binding the data to the datalist
                UpdateTotalBill(); //update the totalbill

                pnlmycart.Visible = true; //making cart panel visible
                pnlcheckout.Visible = true; //making checkout panel visible
                pnlemptycart.Visible = false; //making empty cart panel invisible
            }
            else
            {
                pnlemptycart.Visible = true; //making empty cart panel visible
                pnlmycart.Visible = false; //making cart panel invisible
                pnlcheckout.Visible = false; //making checkout panel invisible

                Dlcartprod.DataSource = null; //setting the datasource of datalist cartproduct to null
                Dlcartprod.DataBind(); //binding the null data to the datalist

                ttproduct.Text = "0"; //setting the total product text
                ttprice.Text = "0"; //setting the total price text

                UpdateCartQuantity("0"); //updating the cart quantity
            }
        }

        protected void btnremovefromcart_Click(object sender, EventArgs e) //function to remove item from cart..invoked when user clicks on remove from cart button
        {
            string ProductID = Convert.ToInt16((((Button)sender).CommandArgument)).ToString(); //getting the product ID
            if (Session["MyCart"] != null) //checking the cart is null or not
            {
                DataTable dt = (DataTable)Session["MyCart"]; //converting session into datatable
                DataRow drr = dt.Select("productid=" + ProductID + "").FirstOrDefault(); //selecting the particular product to remove
                if (drr != null) //checking the row selected is null or not
                    dt.Rows.Remove(drr); //removing the row from datatable
                Session["MyCart"] = dt; //transfering the datatable to session object storing it in MyCart variable
            }
            GetMyCart(); //invoking GetMyCart function
        }

        protected void ButtonPlaceOrder_Click(object sender, EventArgs e) //invoked when the user clicks place order button in the cart
        {
            if ((bool)Session["IsAuthenticated"] == true) //checking if the user Is Authenticated or not
            {
                PlaceTheOrder(); //calling the function to place the order
            }
            else
            {
                Session["UserIsNotLoggedInAndTryingToPlaceTheOrder"] = true; //making it true because the user is NOT logged in and has clickd on the place order button...using this because as soon as the user is logged in then he will be redirected to the cart page only
                Session["prepage"] = Path.GetFileNameWithoutExtension(Request.Url.AbsoluteUri).Substring(0, 4); //getting the current page name
                Response.Redirect("~/Account/Login"); //redirecting the user to the login page
            }
        }
    }
}