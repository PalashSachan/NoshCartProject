<%@ Page Title="My Orders - NoshCart.com" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="NoshCart.Account.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<link href="../Content/bootstrap.css" rel="stylesheet" />
	<link href="../Content/bootstrap.min.css" rel="stylesheet" />
	<script src="../Scripts/jquery-3.1.1.min.js"></script>
	<script src="../Scripts/bootstrap.min.js"></script>
	<link href="../CSS/orders_details.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div>
		<h2>My Orders</h2>

		<asp:Label ID="LabelDataNotFound" CssClass="auto-style14" runat="server" Text="No Orders Found" Visible="false"></asp:Label>

		<asp:GridView ID="GridView1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Visible="false" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID" OnRowDataBound="FindGridAndBound" ShowHeader="false" GridLines="None">
			<Columns>
				<asp:TemplateField>
					<ItemTemplate>
						<div class="outerborder" style="text-align: left">

							<div class="rowfirst">
                                
								<asp:LinkButton ID="OrderIDButton" runat="server" CommandName="Select" Font-Underline="false" CssClass="myorderButton" Text='<%# NoshCart.CheckLogin.Check.GetOrderIDText((int)Eval("OrderId")) %>'></asp:LinkButton>

								<asp:LinkButton runat="server" Font-Underline="false" CssClass="trackbutton pull-right" PostBackUrl="~/Account/WebForm2.aspx">
								<span class="glyphicon glyphicon-map-marker" style="color:#2874f0"></span> Track
								</asp:LinkButton>
							</div>

							<asp:GridView runat="server" ID="GridViewNested" AutoGenerateColumns="False" GridLines="None" RowHeaderColumn="false" ShowHeader="false">

								<Columns>
									<asp:TemplateField>
										<ItemTemplate>

											<div class="rowsecond">
												<div class="imagediv">
													<asp:ImageButton runat="server" CssClass="imagecs" ImageUrl='<%# Eval("imageurl") %>' Width="75px" Height="75px" PostBackUrl="~/Account/WebForm2.aspx" />
												</div>

												<div class="auto-style3">
													<asp:HyperLink runat="server"><%# Eval("name") %></asp:HyperLink>
												</div>

												<div class="auto-style4">
													<asp:Label runat="server">Description : <%# Eval("description") %></asp:Label>
												</div>

												<div class="auto-style13">
													<asp:Label runat="server">Sub-Order ID : <%# Eval("SubOrderID") %></asp:Label>
												</div>

												<div class="auto-style6">
													<asp:Label runat="server">₹<%# Eval("price") %></asp:Label>
												</div>

												<div class="auto-style7">
													<asp:Label runat="server">Delivered on <%# NoshCart.CheckLogin.Check.GetDate((DateTime)Eval("OrderDateTime"),1) %></asp:Label>
												</div>

												<div class="auto-style8">
													<asp:Label runat="server">Your item has been delivered</asp:Label>
												</div>
											</div>

										</ItemTemplate>
									</asp:TemplateField>
								</Columns>

							</asp:GridView>

							<div class="rowthird">
								<div class="auto-style9">
									<span class="auto-style11">Ordered On
									</span>
									<%# Eval("OrderDateTime") %>
								</div>

								<div class="auto-style10">
									<span class="auto-style11">Order Total
									</span>
									₹<span class="auto-style12"><%# Eval("TotalPrice") %></span></div>
							</div>

						</div>
						<br />
						<br />
					</ItemTemplate>
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
	</div>
</asp:Content>
