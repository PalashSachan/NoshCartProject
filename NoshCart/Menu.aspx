<%@ Page Title="Menu" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="NoshCart.Menu" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
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
                    <td class="auto-style5" colspan="2">
                        <table>
                            <tr>
                                <td class="auto-style9" align="top">
                                    <asp:Panel ID="Pnlprod" runat="server" ScrollBars="Auto" Height="500px"
                                        BorderColor="Black" BorderStyle="Inset" BorderWidth="1px" Width="671px">
                                        <table align="center" cellspacing="1">
                                            <tr>
                                                <td align="center">
                                                    <asp:DataList ID="Dlprod" runat="server" RepeatColumns="3" Height="100%" Width="635px">
                                                        <ItemTemplate>
                                                            <div align="left">
                                                                <table id="t_design" style="border: 1px ridge black" class="auto-style8" cellspacing="1">
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
                                                                        <td>Price:<asp:Label ID="lblprice" runat="server" Text='<%# Eval("price") %>'></asp:Label>

                                                                            <br />
                                                                            Stock:
                                                                    <asp:Label ID="lblavilablestock" runat="server" Text='<%# Eval("availablestock") %>' ToolTip="Available Stock"
                                                                        ForeColor="Red" Font-Bold="True"></asp:Label>
                                                                            <asp:HiddenField ID="HfproductID" runat="server" Value='<%# Eval("productid")%>' />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="auto-style13">
                                                                            <asp:Button ID="btnAddToCart" CssClass="btn btn-default" runat="server" CommandArgument='<%# Eval("productid") %>'
                                                                                BorderColor="Black" BorderStyle="Inset" BorderWidth="1px" CausesValidation="False"
                                                                                Text="Add to Cart" OnClick="btnaddtocart_Click" Style="height: auto; width: auto;" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                                <td align="top" align="center" style="text-align: center" class="auto-style11">

                                    <asp:Panel ID="pnlcategories" runat="server" ScrollBars="Auto" Height="500px" BorderColor="black" Width="255px">
                                        <asp:DataList ID="dlcategories" runat="server" Width="252px">

                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton2" CssClass="list-group-item-text" runat="server" Text='<%# Eval("categoryname")%>'
                                                    OnClientClick="LinkButton2_Click" CommandArgument='<%# Eval("categoryid")%>' Font-Size="XX-Large" OnClick="LinkButton2_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:DataList>
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <asp:Button ID="ButtonProceedToCheckout" runat="server" PostBackUrl="~/Cart" CssClass="btn btn-default btn-lg ButtonEffect" Visible="false" Text="Buy Now" />

                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
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

