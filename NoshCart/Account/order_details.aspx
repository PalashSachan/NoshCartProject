<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="order_details.aspx.cs" Inherits="NoshCart.Account.order_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<link href="../Content/bootstrap.css" rel="stylesheet" />
	<link href="../Content/bootstrap.min.css" rel="stylesheet" />
	<script src="../Scripts/jquery-3.1.1.min.js"></script>
	<script src="../Scripts/bootstrap.min.js"></script>
	<link href="../CSS/orders_details.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div style="background-color: #F1F3F6; text-align: center; height: 100%;">
		<h2>Orders Details</h2>

		<asp:Label ID="LabelOrderIDNotFound" CssClass="auto-style15" runat="server" Visible="false" />

		<asp:GridView ID="GridView1" Visible="false" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID" OnRowDataBound="FindGridAndBound" ShowHeader="false" GridLines="None">
			<Columns>
				<asp:TemplateField>
					<ItemTemplate>
						<div class="ODrowfirst">
							<div class="auto-style17">

								<%--START OF ORDER DETAILS--%>
								<div class="auto-style21">
									<div class="mrgbtm20">
										<span class="brnCol upcs">Order Details</span>
									</div>

									<div class="mrgbtm5">
										<span class="brnCol mrgrt20">Order Id</span>
										<span style="margin-left: 30px"><%# Eval("OrderID") %> (<%# NoshCart.CheckLogin.Check.GetNumberOfItems((int)Eval("TotalProducts")) %>)</span>
									</div>

									<div class="mrgbtm5">
										<span class="brnCol mrgrt20">Date</span>
										<span style="margin-left: 50px"><%# NoshCart.CheckLogin.Check.GetDate((DateTime)Eval("OrderDateTime"),3) %></span>
									</div>

									<div class="mrgbtm5">
										<span class="brnCol mrgrt20">Total Amount</span>
										<span style="margin-left: -5px;font-size:small">₹<%# Eval("TotalPrice") %> through <%# Eval("PaymentMethod") %></span>
									</div>

								</div>
								<%--END OF ORDER DETAILS--%>

								<%--START OF ADDRESS--%>
								<div class="auto-style22">
									<div class="mrgbtm20">
										<span class="brnCol upcs mrglft10">Address</span>
									</div>

									<div class="mrgbtm5 mrglft10">
										<span class="blkColBld"><%# Eval("Username") %></span>
									</div>

									<div class="mrgbtm5 mrglft10">
										<span><%# Eval("Address") %> <%# Eval("City") %> <%# Eval("State") %></span>
									</div>

									<div class="mrgbtm5 mrglft10">
										<span class="blkColBld">Phone</span>
										<span class="mrglft10"><%# Eval("PhoneNumber") %>
										</span>
									</div>

								</div>
								<%--END OF ADDRESS--%>

								<%--START OF MANAGE ORDERS--%>
								<div class="auto-style23">
									<div class="mrgbtm20">
										<span class="brnCol upcs mrglft10">Manage Orders</span>
									</div>

									<div class="mrgbtm5 mrglft10">
										<asp:LinkButton runat="server" Font-Underline="false" CssClass="invoice" PostBackUrl="~/Account/WebForm2.aspx">
								<span><svg fill="#2874F1" height="16" viewBox="0 0 24 24" width="16" xmlns="http://www.w3.org/2000/svg"><path d="M0 0h24v24H0z" fill="none"></path><path d="M14 2H6c-1.1 0-1.99.9-1.99 2L4 20c0 1.1.89 2 1.99 2H18c1.1 0 2-.9 2-2V8l-6-6zm2 16H8v-2h8v2zm0-4H8v-2h8v2zm-3-5V3.5L18.5 9H13z"></path></svg></span> Get Invoice
										</asp:LinkButton>
									</div>

									<div class="mrgbtm5 mrglft10">
										<asp:LinkButton runat="server" Font-Underline="false" CssClass="help" PostBackUrl="~/Account/WebForm2.aspx">
								<span class="icon-live_help" style="fill:#2874F1"></span> Help
										</asp:LinkButton>
									</div>

								</div>
								<%--END OF MANAGE ORDERS--%>
							</div>
						</div>

						<asp:GridView runat="server" ID="GridViewNested" AutoGenerateColumns="False" GridLines="None" RowHeaderColumn="false" ShowHeader="false">
							<Columns>
								<asp:TemplateField>
									<ItemTemplate>
										<div class="ODrowsecond">
											<div class="auto-style24" style="border-bottom: 1px solid darkgray;">
												<div style="width: 440px">
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

													<div style="padding-top: 5%;">
														<span style="margin-left: 5px;">
															<svg fill="#2874F1" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
																<path d="M0 0h24v24H0z" fill="none" />
																<path d="M20 8h-3V4H3c-1.1 0-2 .9-2 2v11h2c0 1.66 1.34 3 3 3s3-1.34 3-3h6c0 1.66 1.34 3 3 3s3-1.34 3-3h2v-5l-3-4zM6 18.5c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5 1.5.67 1.5 1.5-.67 1.5-1.5 1.5zm13.5-9l1.96 2.5H17V9.5h2.5zm-1.5 9c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5 1.5.67 1.5 1.5-.67 1.5-1.5 1.5z" />
															</svg></span>
														<div style="margin-left: 35px; margin-top: -24px">
															Delivered on <%# NoshCart.CheckLogin.Check.GetDate((DateTime)Eval("OrderDateTime"),1) %>
														</div>
													</div>
												</div>
												<div class="prc" style="margin: -115px 0 0 0;">
													<asp:Label ID="Label1" runat="server">₹<%# Eval("price") %></asp:Label>
												</div>
											</div>
										</div>
									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
						</asp:GridView>
						<div class="ODrowthird">
							<div style="margin-top: 5px; margin-right: 5px; float: right; font-weight: 700;">₹<%# Eval("TotalPrice") %></div>
						</div>
					</ItemTemplate>
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
	</div>
</asp:Content>
