<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="NoshCart.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="CSS/Contact.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 72px;
            height: 66px;
        }

        .auto-style2 {
            width: 78px;
            height: 52px;
        }

        .auto-style3 {
            width: 805px;
            height: 284px;
        }
            
        .auto-style21 {
            width: 875px;
            height: 775px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div id="header">
            <div style="font-size: xx-large">
                <img class="auto-style3" src="Image/contact.jpg" />
            </div>
        </div>

        <div style="text-align: center; font-size: 30px;">
            <table align="center" style="box-shadow:5px 5px 2px #4d4d4d; background-color: darkgrey; border-radius: 25px;">
                <tr>
                    <td>
                         <img src="Image/text.png" class="auto-style1" />
                    </td>
                    <td>
                        +919956551996
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="Image/messag.png" class="auto-style2" />

                    </td>
                    <td>
                        mail@gmail.com
                    </td>
                </tr>
            </table>
        </div>
        </div>
</asp:Content>
