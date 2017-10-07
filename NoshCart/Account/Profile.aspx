<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="NoshCart.Account.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style type="text/css">
        .user-row {
            margin-bottom: 14px;
        }

            .user-row:last-child {
                margin-bottom: 0;
            }

        .dropdown-user {
            margin: 13px 0;
            padding: 5px;
            height: 100%;
        }

            .dropdown-user:hover {
                cursor: pointer;
            }

        .table-user-information > tbody > tr {
            border-top: 1px solid rgb(221, 221, 221);
        }

            .table-user-information > tbody > tr:first-child {
                border-top: 0;
            }


            .table-user-information > tbody > tr > td {
                border-top: 0;
            }

        .toppad {
            margin-top: 20px;
        }

        .auto-style21 {
            margin-right: -15px;
            margin-left: -15px;
            height: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div class="row">
            <div class="col-xs-12">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="auto-style21">
                            <h5>
                                <asp:Label runat="server" CssClass="text-center" Font-Bold="true" ID="LabelCustomerUserName"></asp:Label>
                                <asp:Button runat="server" ID="ButtonEditProfile" CssClass="btn btn-primary pull-right ButtonEffect" Text="Edit Profile" Style="width: auto" PostBackUrl="~/Account/EditProfile.aspx" />
                            </h5>
                        </div>
                    </div>


                    <asp:UpdatePanel runat="server">

                        <ContentTemplate>
                            <asp:Panel runat="server" ID="PanelUserDetails" Visible="true">
                                <div class="panel-body">
                                    <div class="row">

                                        <div class="col-md-2 col-lg-3 " align="center">
                                            <asp:Image runat="server" ID="ImageUserDisplay" class="img-circle img-responsive" />
                                        </div>

                                        <div class=" col-md-9 col-lg-9 ">
                                            <table class="table table-user-information">
                                                <tbody>
                                                    <tr>
                                                        <td>Email:</td>
                                                        <td>
                                                            <asp:Label runat="server" ID="LabelEmail"></asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Address</td>
                                                        <td>
                                                            <asp:Label runat="server" ID="LabelAddress"></asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>City</td>
                                                        <td>
                                                            <asp:Label runat="server" ID="LabelCity"></asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>State</td>
                                                        <td>
                                                            <asp:Label runat="server" ID="LabelState"></asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Phone Number</td>
                                                        <td>
                                                            <asp:Label runat="server" ID="LabelPhoneNumber"></asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Gender</td>
                                                        <td>
                                                            <asp:Label runat="server" ID="LabelGender"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <asp:Panel runat="server" ID="PanelFooter" CssClass="panel-footer">
                                    <asp:HyperLink runat="server" CssClass="btn-link" Text="Change Password" NavigateUrl="~/Account/ChangePassword.aspx"></asp:HyperLink>
                                </asp:Panel>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
