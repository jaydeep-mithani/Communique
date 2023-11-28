<%@ Page Language="C#" MasterPageFile="~/Admin_Panel.Master" AutoEventWireup="true" CodeBehind="Admin_Technology_Insert.aspx.cs" Inherits="Communique.Admin_Technology_Delete" %>

<asp:Content ID="From1" runat="server" ContentPlaceHolderID="head">
    <link rel="stylesheet" type="text/css" href="Admin_Technology_Insert_Style.css" />
</asp:Content>
<asp:Content ID="ContentChangePassword" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="con">
        <table class="tbl">
            <tr>
                <td><asp:Label ID="lblTechnologyName" runat="server" Text="Technologie Name" CssClass="lbl"></asp:Label></td>
                <td><asp:Label ID="Label1" runat="server" Text=" : " CssClass="lbl"></asp:Label></td>
                <td><asp:TextBox ID="txtTechnologyName" runat="server" CssClass="txt" Width="20em" ></asp:TextBox></td>
                <td><asp:requiredfieldvalidator ID="rfTechnologyname" runat="server" ControlToValidate="txtTechnologyName" ErrorMessage="Technology name is missing!" CssClass="val"  ForeColor="#ff66cc" Display="Dynamic"></asp:requiredfieldvalidator></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblTechnologyInitial" runat="server" Text="Technology Initial" CssClass="lbl" ></asp:Label></td>
                <td><asp:Label ID="Label2" runat="server" Text=" : " CssClass="lbl"></asp:Label></td>
                <td><asp:TextBox ID="txtTechnologyInitial" runat="server" CssClass="txt" Width="20em" ></asp:TextBox></td>
                <td><asp:requiredfieldvalidator ID="rfTechnologyInitial" runat="server" ControlToValidate="txtTechnologyInitial" ErrorMessage="Old Password is required!" CssClass="val"  ForeColor="#ff66cc" Display="Dynamic"></asp:requiredfieldvalidator>
                <asp:RegularExpressionValidator ID="reTechnologyInitial" runat="server" ControlToValidate="txtTechnologyInitial" ValidationExpression="^[\s\S]{2,3}$" ErrorMessage="Initial should be of 2 - 3 characters only!" Display="Dynamic" CssClass="val"  ForeColor="#ff66cc"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td><br /></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn" OnClick="btnAdd_Click"/></td>
            </tr>
        </table>
    </div>
</asp:Content>
