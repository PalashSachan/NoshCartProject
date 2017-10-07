<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="NoshCart.Account.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style type="text/css">
        .intl-tel-input {
            width: 100%;
        }

        table.mylist input {
            width: 25%;
            display: inline;
            float: left;
        }

        table.mylist label {
            /*width: 96%;
            display: block;
            float: left;
            padding-top: 4px;*/
            width: auto;
            display: inline;
        }
    </style>

    <link href="../build/css/demo.css" rel="stylesheet" />
    <link href="../build/css/intlTelInput.css" rel="stylesheet" />

    <script src="../build/js/jquery.min.js" type="text/javascript"></script>
    <script src="../build/js/intlTelInput.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            
        </ContentTemplate>
    </asp:UpdatePanel>--%>

    <div>
                <h2>Register</h2>
                <div class="form-horizontal">
                    <h4>Create a new account</h4>
                    <hr />

                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>

                    <div style="margin: 2px; border-color: white">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="TextBoxUserName" CssClass="col-md-2 control-label" Text="UserName" />
                            <div class="col-xs-9">
                                <asp:TextBox runat="server" ID="TextBoxUserName" CssClass="form-control" TextMode="SingleLine" Placeholder="Enter Your UserName Here" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxUserName"
                                    CssClass="text-danger" ErrorMessage="The Username field is required." />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="TextBoxEmail" CssClass="col-md-2 control-label" Text="Email" />
                            <div class="col-xs-9">
                                <asp:TextBox runat="server" ID="TextBoxEmail" CssClass="form-control" TextMode="Email" Placeholder="Enter Your Email ID Here" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxEmail"
                                    CssClass="text-danger" ErrorMessage="The email field is required." />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="TextBoxPassword" CssClass="col-md-2 control-label" Text="Password" />
                            <div class="col-xs-9">
                                <asp:TextBox runat="server" ID="TextBoxPassword" TextMode="Password" CssClass="form-control" Placeholder="Enter Your Password Here" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxPassword"
                                    CssClass="text-danger" ErrorMessage="The password field is required." />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="TextBoxConfirmPassword" CssClass="col-md-2 control-label" Text="Confirm Password" />
                            <div class="col-xs-9">
                                <asp:TextBox runat="server" ID="TextBoxConfirmPassword" TextMode="Password" CssClass="form-control" Placeholder="Enter Your Confirm Password Here" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxConfirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                                <br />
                                <asp:CompareValidator runat="server" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxConfirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="TextBoxAddress" CssClass="col-md-2 control-label" Text="Address" />
                            <div class="col-xs-9">
                                <asp:TextBox runat="server" ID="TextBoxAddress" TextMode="SingleLine" CssClass="form-control" Placeholder="Enter Your Address Here" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxAddress"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The Address field is required." />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="TextBoxCity" CssClass="col-md-2 control-label" Text="City" />
                            <div class="col-xs-9">
                                <asp:TextBox runat="server" ID="TextBoxCity" TextMode="SingleLine" CssClass="form-control" Placeholder="Enter Your City Here" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxCity"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The City field is required." />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="TextBoxState" CssClass="col-md-2 control-label" Text="State" Placeholder="Enter Your State" />
                            <div class="col-xs-9">
                                <asp:TextBox runat="server" ID="TextBoxState" TextMode="SingleLine" CssClass="form-control" Placeholder="Enter Your State Here" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxState"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The State field is required." />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="TextBoxNumber" Text="Phone Number" CssClass="col-md-2 control-label" />
                            <div class="col-md-9">
                                <asp:TextBox runat="server" ID="TextBoxNumber" ClientIDMode="Static" Width="100%" TextMode="Phone" MaxLength="10" Placeholder="9876-543210" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxNumber"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The Phone Number field is required." />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="RadioButtonGender" Text="Gender" CssClass="col-md-2 control-label" />
                            <div class="col-md-9">
                                <asp:RadioButtonList ID="RadioButtonGender" runat="server" RepeatLayout="Table" RepeatDirection="Vertical" RepeatColumns="1" CssClass="mylist" Width="75px">
                                    <asp:ListItem Value="1" Selected="True">Male</asp:ListItem>
                                    <asp:ListItem Value="2">Female</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="form-group col-md-7">
                            <asp:Button ID="RegisterButton" class="btn btn-default btn-sm ButtonEffect" runat="server" Text="Register" OnClick="CreateUser_Click" Width="175px" />
                        </div>

                        <br />
                        <br />
                        <hr />
                        <div id="AlreadyLoginForm">
                            <p>
                                <asp:HyperLink runat="server" Style="align-content: center" ID="RegisterHyperLink" NavigateUrl="~/Account/Login.aspx" Text="Already Registered?Sign In Here" />
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                $("#TextBoxNumber").intlTelInput({
                    allowDropdown: false,
                    //autoHideDialCode: false,
                    //autoPlaceholder: "polite",
                    //dropdownContainer: "body",
                    //excludeCountries: ["us"],
                    //formatOnDisplay: false,
                    // geoIpLookup: function(callback) {
                    //  $.get("http://ipinfo.io", function() {}, "jsonp").always(function(resp) {
                    //    var countryCode = (resp && resp.country) ? resp.country : "";
                    //    callback(countryCode);
                    //  });
                    //},
                    // initialCountry: "auto",
                    //nationalMode: true,
                    onlyCountries: ['in'],
                    //placeholderNumberType: "MOBILE",
                    //preferredCountries: ['in'],
                    separateDialCode: true,
                    utilsScript: "build/js/utils.js"
                });
  </script>

</asp:Content>
