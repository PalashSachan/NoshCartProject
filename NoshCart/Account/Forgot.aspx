<%@ Page Title="Forgot Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" Inherits="NoshCart.Account.ForgotPassword" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <h2><%: Title %>.</h2>

    <div class="row">
        <div class="col-md-8">
            <asp:PlaceHolder id="loginForm" runat="server">
                <div class="form center-block">
                    <h4>Forgot your password?</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <form id="form1" runat="server" defaultbutton="SubmitButton">

                        
                        <asp:Label runat="server" AssociatedControlID="TextBoxUsername" CssClass="col-md-2 control-label">Username</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="TextBoxUsername" CssClass="form-control" Placeholder="Enter Your Username" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxUsername"
                                CssClass="text-danger" ErrorMessage="The Username field is required." />
                        </div>
                    
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button ID="SubmitButton" runat="server" OnClick="Forgot" Text="Reset Password" CssClass="btn btn-default ButtonEffect" />
                        </div>
                            </form>
                    </div>
                </div>
            </asp:PlaceHolder>
            <asp:PlaceHolder runat="server" ID="DisplayMessage" Visible="false">
                <p class="text-success">
                    Please check your email to reset your password.
                </p>
            </asp:PlaceHolder>
            <br />
        </div>
    </div>
</asp:Content>
