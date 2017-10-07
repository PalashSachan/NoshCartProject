<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="NoshCart.Admin.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        table.center {
            width: 400px;
            height: auto;
            text-align: center;
            margin-top: 150px;
            align-content: center;
            margin-left: auto;
            margin-right: auto;
            box-shadow: 5px 5px 2px #4d4d4d;
            background-color: darkgrey;
            border-radius: 25px;
        }

        #loginn {
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">

        <table class="center" id="loginn">
            <tr style="">
                <td colspan="2">
                    <h2>Admin Login</h2>
                </td>

            </tr>
            <tr>
                <td>
                    <b>
                        <asp:Label ID="Label1" runat="server" Text="Login ID"></asp:Label>
                    </b>
                </td>
                <td>
                    <asp:TextBox ID="txtloginid" runat="server" Height="20px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <b>
                        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>

                    </b>
                </td>
                <td>

                    <asp:TextBox ID="txtpassword" runat="server" Height="20px" Width="150px" TextMode="Password"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="login" runat="server" Text="Login" OnClick="Button1_Click" Font-Bold="true" Height="30px" Width="91px" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblalert" runat="server" ForeColor="red" Font-Bold="true"></asp:Label>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
