<%@ Page Title="Thank You" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="NoshCart.ThankYou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .trackmyordermargin {
            margin-top: -10px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center">
        <br />
        <b>Thank You 
                                                <asp:Label ID="LabelUserName" runat="server" Font-Bold="True"></asp:Label>!</b><br />
        <br />
        Your Order (Order Id:-
                                                    <asp:Label ID="LabelOrderIdNumber" runat="server"></asp:Label>) has been placed successfully
                                            .<br />
        <br />
        Details are sent in
                                            <asp:Label ID="LabelEmailID" runat="server" />
        and
                                            <asp:Label ID="LabelPhoneNumber" runat="server" />
        <br />
        <br />
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Image/ThankYou.png" />
        <br />

        <br />
        <div>
            <asp:ImageButton runat="server" ID="ImageButtonTrackMyOrder" PostBackUrl="~/Account/Orders.aspx"
                ImageUrl="~/Image/track-my-order.jpg" CssClass="trackmyordermargin" Width="250px" Height="50px" />
            &nbsp;
            <asp:ImageButton runat="server" ID="ImageButtonContinueShopping" ImageUrl="~/Image/ContinueShoppingCart.png"
                PostBackUrl="~/Menu" />
            <br />
        </div>

        <br />
    </div>

    <%--<asp:Button runat="server" ID="HiddenButton" OnClick="HiddenButton_Click" Style="display: none" />
    <asp:PlaceHolder ID="PageReloadScript" runat="server">
        <script type="text/javascript">
            function SendSmsAndEmail() {
                document.getElementById('<%= HiddenButton.ClientID %>').click();
            }
            window.onload = SendSmsAndEmail;
        </script>
    </asp:PlaceHolder>--%>
</asp:Content>
