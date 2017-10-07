<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="NoshCart.Error.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1 style="color:red;">An Error Has Occurred!</h1>
        <h4>An unexpected unknown error occurred.</h4>
        <h4>The website admin has been notified about the error.</h4>
        
        <asp:Image ID="Image1" Height="350px" Width="350px" ImageAlign="AbsBottom" ImageUrl="~/Error/error-img.jpg" runat="server" />
        <br />
        <asp:ImageButton runat="server" PostBackUrl="~/Home" ImageUrl="~/Error/ReturnToHomePage.gif" />
    </div>
    </form>
</body>
</html>
