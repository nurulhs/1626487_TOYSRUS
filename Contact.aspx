<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="J39758_CO5027_ASG1.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .auto-style1 {font-size: large;}
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Label ID="lblName" runat="server" Text="Name:" class="style-label" AssociatedControlID="textName"></asp:Label>
            <p><asp:RequiredFieldValidator ID="reqNameValidator" runat="server" ErrorMessage="*Required" ControlToValidate="textName" class="validation" ValidationGroup="validatedControls" ></asp:RequiredFieldValidator>
            <asp:TextBox ID="textName" runat="server" placeholder="Name is required" class="style-input" TabIndex="1"></asp:TextBox>
            </p>
                <p><asp:Label ID="lblEmail" runat="server" Text="Email:" class="style-label" AssociatedControlID="textEmail"></asp:Label>
            <asp:RequiredFieldValidator ID="reqEmailValidator" runat="server" ErrorMessage="*Required" ControlToValidate="textEmail" class="validation" ValidationGroup="validatedControls"></asp:RequiredFieldValidator>
            
                    <asp:TextBox ID="textEmail" runat="server" placeholder="Email Address is required" class="style-input" TabIndex="2"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regExprChkEmail" runat="server" ControlToValidate="textEmail" ErrorMessage="*e.g. someone@example.com" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" class="validation" ValidationGroup="validatedControls"></asp:RegularExpressionValidator>
            </p>
                    <p><asp:Label ID="lblSubject" runat="server" Text="Subject:" class="style-label" AssociatedControlID="textSubject"></asp:Label><asp:RequiredFieldValidator ID="reqSubjectValidator" runat="server" ErrorMessage="*Required" ControlToValidate="textSubject" class="validation" ValidationGroup="validatedControls"></asp:RequiredFieldValidator>
            <asp:TextBox ID="textSubject" runat="server" placeholder="Subject is required" class="style-input" TabIndex="3"></asp:TextBox>
            </p>
                        <p><asp:Label ID="lblMessage" runat="server" Text="Message:" class="style-label" AssociatedControlID="textMessage"></asp:Label><asp:RequiredFieldValidator ID="reqMessageValidator" runat="server" ErrorMessage="*Required" ControlToValidate="textMessage" class="validation" ValidationGroup="validatedControls"></asp:RequiredFieldValidator>
            <asp:TextBox ID="textMessage" runat="server" placeholder="Message is required" class="style-input" TextMode="MultiLine" TabIndex="4"></asp:TextBox>
            <asp:Button ID="btnSendEmail" runat="server" Text="Send" title="Submit" class="style-button" ValidationGroup="validatedControls" OnClick="btnSendEmail_Click1"  />
            </p><span class="literal">
                <asp:Literal ID="litResult" runat="server"></asp:Literal></span>	
									  
		
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="GoogleMap">
    

</asp:Content>
