<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="NoshCart.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="CSS/about.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 486px;
            height: 288px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div>
                <img src="Image/about.png" class="auto-style1" />

                <div id="content">
                    Nosh will bring comfort, home style and delicious food on demand to its users. 
                    Remember the time when you’d tell Mom you’re hungry and a hot, fresh, 
                    delicious meal came to you super quick. 
                    We intend to bring back the same experience to everyday dining; 
                    using the power of tech, food science and a sophisticated supply chain. 
                    We are launching in Delhi very soon.
                </div>
            </div>
        
    </div>
</asp:Content>
