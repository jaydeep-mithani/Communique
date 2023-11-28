<%@ Page Language="C#" MasterPageFile="~/Admin_Panel.Master" AutoEventWireup="true" CodeBehind="Admin_Faculty_Insert.aspx.cs" Inherits="Communique.Admin_Faculy_Insert" %>

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

<asp:Content ID="frmStartup" runat="server" ContentPlaceHolderID="head">
    <link rel="stylesheet" type="text/css" href="Admin_Faculty_Insert_Style.css" />
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="con">
        <table id="tblStudentSignup" class="tab">
            <tr>
                <td>
                    <asp:Label ID="lblFirstName" CssClass="label" runat="server" Text="First Name "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblFirstNameSeperator" CssClass="label" runat="server" Text=": "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFirstName" placeholder="Enter your first name here" AutoCompleteType="Disabled" CssClass="text" runat="server" Width="270px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfFName" CssClass="valid" ControlToValidate="txtFirstName" ErrorMessage="Your first name cannot be empty!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revFName" CssClass="valid" ControlToValidate="txtFirstName" ValidationExpression="^[\s\S]{3,}$" ErrorMessage="Your name should be of 3 characters minimum!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>
                </td>
            
                <td><asp:Label ID="lblSP1" runat="server" Text=" "></asp:Label></td>
            
                <td>
                   <asp:Label ID="lblLastName" CssClass="label2" runat="server" Text="Last Name "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLastNameSeperator" CssClass="label" runat="server" Text=": "></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtLastName" placeholder="Enter your last name here" AutoCompleteType="Disabled" CssClass="text" runat="server" Width="270px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfLName" CssClass="valid" ControlToValidate="txtLastName" ErrorMessage="Your last name cannot be empty!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>
                   <asp:Label ID="lblEmail" CssClass="label" runat="server" Text="E-mail Address  "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEmailSeperator" CssClass="label" runat="server" Text=": "></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtEmail" AutoCompleteType="Disabled" placeholder="Enter the email address" CssClass="text" runat="server" Width="270px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfEmail" CssClass="valid" ControlToValidate="txtEmail" ErrorMessage="Please enter an email address here!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" CssClass="valid" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="This email address in invalid!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>
                </td>

                <td><asp:Label ID="lblSP2" runat="server" Text=" "></asp:Label></td>
            
                <td>
                   <asp:Label ID="lblNewPassword" CssClass="label2" runat="server" Text="New Password "></asp:Label>
                </td>
                <td>
                   <asp:Label ID="lblNewPasswordSeperator" CssClass="label" runat="server" Text=": "></asp:Label>
                </td>
                <td>
                   <asp:TextBox ID="txtNewPassword" placeholder="Create a new password" AutoCompleteType="Disabled" CssClass="text" runat="server" Width="270px" TextMode="Password"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfPassword" CssClass="valid" ControlToValidate="txtNewPassword" ErrorMessage="Please enter the password here!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPassword" CssClass="valid" ControlToValidate="txtNewPassword" ValidationExpression="^[\s\S]{8,}$" ErrorMessage="Password should contain minimum 8 characters!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>
                </td>
            </tr>

            <tr>
                <td>
                   <asp:Label ID="lblConfirmPassword" CssClass="label" runat="server" Text="Confirm Passoword "></asp:Label>
                </td>
                <td>
                   <asp:Label ID="lblConfirmPasswordSeperator" CssClass="label" runat="server" Text=": "></asp:Label>
                </td>
                <td>
                   <asp:TextBox ID="txtConfirmPassword" placeholder="Enter the above password again" AutoCompleteType="Disabled" CssClass="text" runat="server" Width="270px" TextMode="Password"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfConfirmPassword" CssClass="valid" ControlToValidate="txtConfirmPassword" ErrorMessage="Please enter the password here!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvConfirmPassword" CssClass="valid" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="The password doesn't match the above password." ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:CompareValidator>
                </td>

                <td><asp:Label ID="lblSP3" runat="server" Text=" "></asp:Label></td>
            
                <td>
                   <asp:Label ID="lblTechLeader" CssClass="label2" runat="server" Text="Technology Leader "></asp:Label>
                </td>
                <td>
                   <asp:Label ID="lbltechLeaderSepertor" CssClass="label" runat="server" Text=": "></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlTechnology" CssClass="ddl" runat="server">

                   </asp:DropDownList>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Button ID="btnFaculty" CssClass="btn" runat="server" Text="Add Faculty" OnClick="btnFaculty_Click" />
   </div>
</asp:Content>