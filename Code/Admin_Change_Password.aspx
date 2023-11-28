<%@ Page Language="C#" MasterPageFile="~/Admin_Panel.Master" AutoEventWireup="true" CodeBehind="Admin_Change_Password.aspx.cs" Inherits="Communique.Change_Password_Admin" %>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>--%>

<asp:Content ID="From1" runat="server" ContentPlaceHolderID="head">
    <link rel="stylesheet" type="text/css" href="Admin_Change_Password_Style.css" />
</asp:Content>
<asp:Content ID="ContentChangePassword" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="con">
        <table class="tbl">
            <tr>
                <td><asp:Label ID="lblUsername" runat="server" Text="Userame" CssClass="lbl"></asp:Label></td>
                <td><asp:Label ID="Label1" runat="server" Text=" : " CssClass="lbl"></asp:Label></td>
                <td><asp:TextBox ID="txtUsername" runat="server" CssClass="txt" Width="20em" ></asp:TextBox></td>
                <td><asp:requiredfieldvalidator ID="rfUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is missing!" CssClass="val"  ForeColor="#ff66cc" Display="Dynamic"></asp:requiredfieldvalidator></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblOldPassword" runat="server" Text="Old Password" CssClass="lbl" ></asp:Label></td>
                <td><asp:Label ID="Label2" runat="server" Text=" : " CssClass="lbl"></asp:Label></td>
                <td><asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password" CssClass="txt" Width="20em" ></asp:TextBox></td>
                <td><asp:requiredfieldvalidator ID="rfOldPassword" runat="server" ControlToValidate="txtOldPassword" ErrorMessage="Old Password is required!" CssClass="val"  ForeColor="#ff66cc" Display="Dynamic"></asp:requiredfieldvalidator>
                <asp:RegularExpressionValidator ID="reOldPassword" runat="server" ControlToValidate="txtOldPassword" ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&+=]).*$" ErrorMessage="The password must contain of minimum 8 characters an uppercase character, lowercase character, a number and a special character!" Display="Dynamic" CssClass="val"  ForeColor="#ff66cc"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblNewPassword" runat="server" Text="New Password" CssClass="lbl" ></asp:Label></td>
                <td><asp:Label ID="Label3" runat="server" Text=" : " CssClass="lbl"></asp:Label></td>
                <td><asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="txt" Width="20em" ></asp:TextBox></td>
                <td><asp:requiredfieldvalidator ID="rfNewPassword" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="New password is missing!" CssClass="val"  ForeColor="#ff66cc" Display="Dynamic"></asp:requiredfieldvalidator>
                <asp:RegularExpressionValidator ID="reNewpassword" runat="server" ControlToValidate="txtNewPassword" ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&+=]).*$" ErrorMessage="The password must contain of minimum 8 characters an uppercase character, lowercase character, a number and a special character!" Display="Dynamic" CssClass="val"  ForeColor="#ff66cc"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password" CssClass="lbl" ></asp:Label></td>
                <td><asp:Label ID="Label4" runat="server" Text=" : " CssClass="lbl"></asp:Label></td>
                <td><asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="txt" Width="20em" ></asp:TextBox></td>
                <td><asp:requiredfieldvalidator ID="rfConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Please reenter the new password here!" CssClass="val"  ForeColor="#ff66cc" Display="Dynamic"></asp:requiredfieldvalidator>
                <asp:CompareValidator ID="cmpConfirmPassword" runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="The password does not match the abovefield!" Display="Dynamic" CssClass="val"  ForeColor="#ff66cc"></asp:CompareValidator></td>
            </tr>
            <tr>
                <td><br /></td>
            </tr>
            <tr>
                <td colspan="3"><asp:Button ID="btnChange" runat="server" Text="Change Password" CssClass="btn" OnClick="btnChange_Click"/></td>
            </tr>
        </table>
    </div>
</asp:Content>
