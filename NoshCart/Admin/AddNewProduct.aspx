<%@ Page Title="Add New Product" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="AddNewProduct.aspx.cs" Inherits="NoshCart.Admin.AddNewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="text-align: center">Add New Product</h3>
    <table align="center" style="width: 550px; height: 230px; box-shadow: 5px 5px 2px #4d4d4d; background-color: darkgrey; border-radius: 25px;">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtname" runat="server" Width="225px"></asp:TextBox></td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="category"></asp:Label></td>
            <td>
                <asp:DropDownList ID="Dddlcategory" runat="server" Height="16px" Width="225px"></asp:DropDownList></td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Discription"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtproductdiscription" runat="server" Height="44px" Width="225px"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Image"></asp:Label></td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" Width="225px" Height="20px" />
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Price"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtprice" runat="server" Width="225px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Quantity"></asp:Label>

            </td>
            <td>
                <asp:TextBox ID="txtquantity" runat="server" Width="225px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" Height="35px" Width="85px" />
            </td>
        </tr>
    </table>
</asp:Content>
