<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NoshCart.Account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Login</h2>
        <div class="row">
            <div class="col-md-8">
                <section id="loginForm">
                    <asp:Panel runat="server" Visible="true" DefaultButton="LoginButton">
                        <div class="form-horizontal">
                        <hr />
                            
                        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                            <p class="text-danger">
                                <asp:Literal runat="server" ID="FailureText" />
                            </p>
                        </asp:PlaceHolder>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="TextBoxUsername" CssClass="col-md-2 control-label" Text="Username" />
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="TextBoxUsername" CssClass="form-control" TextMode="SingleLine" Placeholder="Enter Your UserName Here" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxUsername"
                                    CssClass="text-danger" ErrorMessage="The username field is required." />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="TextBoxPassword" CssClass="col-md-2 control-label">Password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="TextBoxPassword" TextMode="Password" CssClass="form-control" Placeholder="Enter Your Password Here" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxPassword" CssClass="text-danger" ErrorMessage="The password field is required." />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="checkbox">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:CheckBox CssClass="pull-left" runat="server" ID="RememberMe" Checked="false" />
                                    <asp:Label runat="server" CssClass="pull-left" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button ID="LoginButton" runat="server" Text="Log in" CssClass="btn btn-default pull-left ButtonEffect" OnClick="LoginButton_Click" />
                                
                            </div>
                        </div>
                    </div>
                    </asp:Panel>
                    <hr />
                </section>
            </div>
            <div class="col-md-4">
                <section id="socialLoginForm">
                    <p>
                        <asp:HyperLink runat="server" ID="RegisterHyperLink" NavigateUrl="~/Account/Register.aspx">Register as a new user</asp:HyperLink>
                    </p>
                    <p>
                        <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" NavigateUrl="~/Account/Forgot.aspx">Forgot your password?</asp:HyperLink>
                    </p>
                </section>
            </div>
        </div>
    </div>
</asp:Content> 
