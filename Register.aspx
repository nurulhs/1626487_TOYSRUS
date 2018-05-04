<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="J39758_CO5027_ASG1.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div id="register" runat="server">

        <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
        <asp:TextBox ID="text_RegUsername12" runat="server"></asp:TextBox>
        
        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
        <asp:TextBox ID="text_RegistPassword" runat="server" TextMode="Password"></asp:TextBox>

        <p>
        <asp:Button ID="btnReg" runat="server" Text="Register" OnClick="Button1_Click" />
        </p>
        
        <asp:Literal ID="LiteralErrorMsg" runat="server"></asp:Literal>

    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="GoogleMap" runat="server">
</asp:Content>
