<%@ Page Title="Edit Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="NoshCart.Account.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript">
        function UploadFile(fileUpload) {
            if (fileUpload.value != '') {
                document.getElementById("<%=btnUpload.ClientID %>").click();
            }
        }
    </script>
    <style type="text/css">
    
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel runat="server" DefaultButton="ButtonSaveAll">
        <div class="panel-body">

            <div class="row">

                <div class="col-md-2 col-lg-3 " align="center">
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <asp:Image runat="server" ID="UserProfileImage" class="img-circle img-responsive" />

                    <asp:FileUpload runat="server" accept="image/*" multiple="false" ID="FileUploadBrowseImage" CssClass="btn btn-default pull-left" Width="120px" />

                    <br />

                    <br />

                    <asp:Label runat="server" ID="LabelUploadImageMessage" Visible="false"></asp:Label>
                    <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="btnUpload_Click" Style="display: none" />

                </div>

                <div class=" col-md-9 col-lg-9 ">
                    <table class="table table-user-information">
                        <tbody>
                            <tr>
                                <td>Email:</td>
                                <td>
                                    <asp:TextBox runat="server" ID="TextBoxEmail" CssClass="form-control" ReadOnly="true" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxEmail"
                                        CssClass="text-danger" ErrorMessage="The Email field is required." />
                                </td>
                            </tr>

                            <tr>
                                <td>Address</td>
                                <td>
                                    <asp:TextBox runat="server" ID="TextBoxAddress" CssClass="form-control" placeholder="Enter Your Address" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxAddress"
                                        CssClass="text-danger" ErrorMessage="The Address field is required." />
                                </td>
                            </tr>

                            <tr>
                                <td>City</td>
                                <td>
                                    <asp:TextBox runat="server" ID="TextBoxCity" CssClass="form-control" placeholder="Enter Your City" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxCity"
                                        CssClass="text-danger" ErrorMessage="The City field is required." />
                                </td>
                            </tr>

                            <tr>
                                <td>State</td>
                                <td>
                                    <asp:TextBox runat="server" ID="TextBoxState" CssClass="form-control" placeholder="Enter Your State" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxState"
                                        CssClass="text-danger" ErrorMessage="The State field is required." />
                                </td>
                            </tr>

                            <tr>
                                <td>Phone Number</td>
                                <td>
                                    <asp:TextBox runat="server" ID="TextBoxPhoneNumber" CssClass="form-control" placeholder="Enter Your Phone Number" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxPhoneNumber"
                                        CssClass="text-danger" ErrorMessage="The Phone Number field is required." />
                                </td>
                            </tr>

                            <tr>
                                <td>Gender</td>
                                <td>
                                    <asp:RadioButtonList runat="server" ID="RadioButtonGender">
                                        <asp:ListItem Value="1" Selected="True" Text="Male"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Female"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="panel-footer">
            <asp:Button runat="server" ID="ButtonSaveAll" CssClass="btn btn-success ButtonEffect" Text="Save" OnClick="ButtonSaveAll_Click" Width="150px" />
            &nbsp;
            <asp:Button runat="server" ID="ButtonCancel" CssClass="btn btn-danger ButtonEffect" PostBackUrl="~/Account/Profile" Text="Cancel" />
            <br />
            <asp:Label ID="LabelChangesSaved" runat="server" Visible="false" CssClass="text-success"></asp:Label>
        </div>
    </asp:Panel>
</asp:Content>
