<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="NoshCart.Account.ChangePassword" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <div align="center">
        <h2><%: Title %></h2>
        <div class="form-horizontal">
            <section id="passwordForm">
                <div class="form-horizontal">
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="PlaceHolderChangePassword" Visible="true">
                        <hr />
                        <asp:ValidationSummary runat="server" CssClass="text-danger" />
                        <asp:PlaceHolder ID="PlaceHolderCurrentPassword" runat="server" Visible="true">
                            <div class="form-group">
                                <asp:Label runat="server" ID="CurrentPasswordLabel" AssociatedControlID="CurrentPassword" CssClass="col-md-2 control-label">Current password</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password" CssClass="form-control" Placeholder="Enter Current Password" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
                                        CssClass="text-danger" ErrorMessage="The current password field is required."
                                        ValidationGroup="ChangePassword" />
                                </div>
                            </div>
                        </asp:PlaceHolder>
                        <asp:PlaceHolder runat="server" ID="PlaceHolderNewPassword" Visible="true">
                            <div class="form-group">
                            <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword" CssClass="col-md-2 control-label">New password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" Placeholder="Enter New Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                                    CssClass="text-danger" ErrorMessage="The new password is required."
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword" CssClass="col-md-2 control-label">Confirm new password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" CssClass="form-control" Placeholder="Enter Confirm New Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Confirm new password is required."
                                    ValidationGroup="ChangePassword" />
                                <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The new password and confirmation password do not match."
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        </asp:PlaceHolder>
                        
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button runat="server" Text="Change Password" ValidationGroup="ChangePassword" OnClick="ChangePassword_Click" CssClass="btn btn-default ButtonEffect" />
                            </div>
                        </div>
                        <asp:Label ID="LabelPasswordChanged" runat="server" Visible="false" CssClass="text-success" Text="Password Changed Successfully"></asp:Label>
                    </asp:PlaceHolder>
                </div>
            </section>
        </div>
    </div>
</asp:Content>
