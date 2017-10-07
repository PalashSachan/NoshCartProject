<%@ Page Title="Add or Edit Category" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="AddEditCategory.aspx.cs" Inherits="NoshCart.Admin.AddEditCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="text-align: center;">Add New Category</h3>
    <table align="center" style="width: 500px; height: 102px; box-shadow: 5px 5px 2px #4d4d4d; background-color: darkgrey; border-radius: 25px; text-align:center">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Category Name"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtcategoryname" runat="server" Width="200px"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="add" runat="server" Text="Add" OnClick="Button1_Click" Height="36px" Width="95px" Font-Bold="true" /></td>
        </tr>
    </table>
</asp:Content>
