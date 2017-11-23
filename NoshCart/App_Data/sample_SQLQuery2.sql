declare @custid [bigint] = 2;
declare @orderid [bigint] = 40;

SELECT customerproducts.OrderID,customerproducts.CustomerId, SubOrderID,TotalProducts,price,TotalPrice,products.productid,categoryid,
	name,description,imageurl,PaymentMethod,customerproducts.OrderDateTime,Username, Email,PhoneNumber,Address,City,State FROM customerproducts

INNER JOIN products
ON customerproducts.prodid = products.productid 
INNER JOIN CustomerDetails
ON customerproducts.OrderID = CustomerDetails.OrderID 
INNER JOIN UserLoginData
ON customerproducts.CustomerId = UserLoginData.Id
WHERE customerproducts.OrderID = @orderid and customerproducts.CustomerId = @custid and CustomerDetails.Id = @custid and 
	CustomerDetails.OrderID = @orderid
ORDER BY customerproducts.OrderDateTime

SELECT customerproducts.OrderID,customerproducts.CustomerId, SubOrderID,TotalProducts,price,TotalPrice,products.productid,categoryid,
	name,description,imageurl,PaymentMethod,customerproducts.OrderDateTime,Username, Email,PhoneNumber,Address,City,State 
	FROM customerproducts, products,UserLoginData, CustomerDetails

WHERE customerproducts.OrderID = @orderid and customerproducts.CustomerId = @custid and CustomerDetails.Id = @custid and 
	CustomerDetails.OrderID = @orderid and UserLoginData.Id = @custid and customerproducts.prodid = products.productid 
ORDER BY customerproducts.OrderDateTime