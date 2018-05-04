<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="J39758_CO5027_ASG1.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">

    <HeaderTemplate> <div></HeaderTemplate>
            <ItemTemplate>
                <div class="RepeatProduct">
                    <a href="<%# Eval ("ProductId", "Product.aspx?Id={0}") %>">
                        <div>
                            <asp:Image ID="displayProductImage" runat="server" Height="200px" ImageUrl='<%# Eval("ProductImage") %>' Width="200px" AlternateText='<%# Eval("ProductName") %>' />

                        </div>
                        <div><%# Eval ("ProductName") %></div>
                        <div><asp:Label ID="lblProductPrice" runat="server" Text="$"></asp:Label><%# Eval ("ProductPrice") %></div>
                        <div><asp:Label ID="lblProductQty" runat="server" Text="Qty: "></asp:Label><%# Eval ("ProductQuantity") %></div>
                    </a>
                </div>
            </ItemTemplate>
            <FooterTemplate></div></FooterTemplate>


    </asp:Repeater>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_1626487_j39758_co5027_asg1ConnectionString %>" SelectCommand="SELECT * FROM [Table_product]"></asp:SqlDataSource>
</asp:Content>
