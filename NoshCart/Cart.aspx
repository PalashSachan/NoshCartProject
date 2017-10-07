<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="NoshCart.Cart" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 102px;
            height: 25px;
        }

        .auto-style5 {
            height: 29px;
            width: 300px;
        }

        .auto-style6 {
            height: 10px;
            width: 326px;
        }

        .auto-style8 {
            width: 186px;
        }

        .auto-style9 {
            width: 123px;
        }

        .auto-style11 {
            width: 238px;
        }

        .auto-style12 {
            height: 23px;
        }

        .auto-style13 {
            height: 27px;
        }

        #t_design {
            box-shadow: 5px 5px 2px #4d4d4d;
            background-color: white;
            border-radius: 25px;
            text-align: center;
        }

        .auto-style16 {
            height: 48px;
            width: 100px;
            margin-left: 0px;
        }

        .auto-style18 {
            height: 114px;
            width: 179px;
        }

        #t_design0 {
            box-shadow: 5px 5px 2px #4d4d4d;
            background-color: white;
            border-radius: 25px;
            text-align: center;
        }

        .auto-style20 {
            width: 943px;
        }

        .auto-style21 {
            width: 258px;
            height: 498px;
        }

        #overlay {
            position: fixed;
            z-index: 99;
            top: 0px;
            left: 0px;
            width: 100%;
            height: 100%;
            background-color: #ffffff;
            opacity: 0.80;
            filter: Alpha(Opacity=80);
        }

        #progress {
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -11px 0 0 -55px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>
            <table align="center">
                <tr>
                    <td class="auto-style6" style="text-align: center; background-color: saddlebrown">
                        <asp:Label ID="lblcategoryname" runat="server" Font-Bold="true" ForeColor="White" Text="Label"></asp:Label>
                    </td>
                    <td class="auto-style4" style="text-align: center; background-color: saddlebrown">
                        <asp:Label ID="lblproducts" runat="server" Font-Bold="true" ForeColor="White" Text="Label"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style9" align="top">
                        <asp:Panel ID="pnlmycart" runat="server" ScrollBars="Auto" Height="500px"
                            BorderColor="Black" BorderStyle="Inset" BorderWidth="1px" Width="671px" OnDataBinding="btnshoppingClick" Visible="false">

                            <div class="BlurBackground">
                                <table align="center" cellspacing="1">
                                    <tr>
                                        <td align="center">
                                            <asp:Label ID="lblavailablestockalert" runat="server" ForeColor="Red" Font-Bold="true" />
                                            <asp:DataList ID="Dlcartprod" runat="server" RepeatColumns="3"
                                                Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
                                                <ItemTemplate>
                                                    <div align="left">
                                                        <table id="t_design" cellspacing="1" style="border: 1px ridge black" class="auto-style8">
                                                            <tr>
                                                                <td style="border-bottom-style: ridge; border-width: 1px; border-color: black">
                                                                    <asp:Label ID="lblproductname" runat="server" Text='<%# Eval("name")%>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <img alt="" src='<%# Eval("imageurl")%>' runat="server" id="imgProductPhoto" style="border: ridge 1px black; width: 173px; height: 160px;" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Stock:
                                                                    <asp:Label ID="lblavailablestock" runat="server" Text='<%# Eval("availablestock")%>' ToolTip="Available Stock"
                                                                        ForeColor="Red" Font-Bold="true"></asp:Label><!--Available stock is been calculated from stored procedure --><br />
                                                                    Price:<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>'></asp:Label>QT:<asp:TextBox ID="textproductquantity" runat="server" Height="16px" Width="16px" MaxLength="1"
                                                                        AutoPostBack="true" Text='<%# Eval("productquantity")%>' OnTextChanged="textproductquantity_TextChanged1"></asp:TextBox><asp:HiddenField ID="HfproductID" runat="server" Value='<%# Eval("productid")%>' />
                                                                    <!-- hideen filed is used so that the user can know which product is removed  and what new quantaty is added-->
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <hr />
                                                                    <asp:Button ID="btnremovefromcart" CssClass="btn btn-default" runat="server" CommandArgument='<%# Eval("productid") %>' Text="Remove from Cart"
                                                                        Width="100%" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px" CausesValidation="false" OnClick="btnremovefromcart_Click" />
                                                                    <!-- cause validation is used false so that the user can remove product from cart-->
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:Panel>
                    </td>

                    <td align="top" align="center" style="text-align: center" class="auto-style11">
                        <asp:Panel ID="pnlcheckout" runat="server" ScrollBars="Auto" Height="500px"
                            BorderColor="Black" BorderStyle="Inset" BorderWidth="1px" Visible="false">
                            <table class="auto-style21">
                                <tr>
                                    <td>Total Product </td>
                                    <tr>
                                        <td align="centre">
                                            <asp:TextBox ID="ttproduct" CssClass="form-control" runat="server" ReadOnly="true" Width="231px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ttproduct" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                                        </td>
                                        <tr>
                                            <td>Total Price </td>
                                        </tr>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="ttprice" CssClass="form-control" runat="server" ReadOnly="true" Width="231px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:RadioButtonList ID="rblpaymentmothod" runat="server">
                                                <asp:ListItem Value="1" Selected="True">Cash On Delivery</asp:ListItem>
                                                <asp:ListItem Value="2">Credit/Debit Card/Net Banking</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="ButtonPlaceOrder" runat="server" CssClass="btn btn-default btn-lg ButtonEffect" OnClientClick="this.disabled = true; this.value = 'Placing Order...';" UseSubmitBehavior="false" OnClick="ButtonPlaceOrder_Click" Text="Place Order" />
                                        </td>
                                    </tr>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>


                <tr>
                    <td colspan="2">
                        <asp:Panel ID="pnlemptycart" runat="server" Visible="true">
                            <div style="text-align: center">
                                <br />
                                <br />
                                <br />
                                <h1>Cart is Empty</h1>
                                <br />
                            </div>
                            <tr>
                                <td colspan="2" class="auto-style12">
                                    <a href="TrackYourOrder.aspx" target="_blank">Track Order</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="lbadmin" runat="server" PostBackUrl="~/Admin/AdminLogin.aspx">
                                            Admin
                                        </asp:LinkButton>

                                </td>
                            </tr>
                        </asp:Panel>
                    </td>
                </tr>

            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="updateprogress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div id="overlay">
                <div id="progress">
                    <asp:Image ImageUrl="~/Image/loading.gif" Width="100px" Height="100px" runat="server" />
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
