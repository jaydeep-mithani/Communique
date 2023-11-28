<%@ Page Language="C#" MasterPageFile="~/Admin_Panel.Master" AutoEventWireup="true" CodeBehind="Admin_Student_Insert.aspx.cs" Inherits="Communique.WebForm1" %>

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
    <link rel="stylesheet" type="text/css" href="Admin_Student_Insert_Style.css" />
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
                    <asp:TextBox ID="txtFirstName" TextMode="Phone" placeholder="Enter the first name here" AutoCompleteType="Disabled" CssClass="text" runat="server" Width="270px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfFName" CssClass="valid" ControlToValidate="txtFirstName" ErrorMessage="The first name cannot be empty!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revFName" CssClass="valid" ControlToValidate="txtFirstName" ValidationExpression="^[\s\S]{3,}$" ErrorMessage="The name should be of 3 characters minimum!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>
                </td>
            
                <td><asp:Label ID="lblSP1" runat="server" Text=" "></asp:Label></td>
            
                <td>
                   <asp:Label ID="lblLastName" CssClass="label2" runat="server" Text="Last Name "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLastNameSeperator" CssClass="label" runat="server" Text=": "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLastName" placeholder="Enter the last name here" AutoCompleteType="Disabled" CssClass="text" runat="server" Width="270px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfLName" CssClass="valid" ControlToValidate="txtLastName" ErrorMessage="The last name cannot be empty!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>
                   <asp:Label ID="lblEnrollment" CssClass="label" runat="server" Text="Enrollment No. "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEnrollmentSeperator" CssClass="label" runat="server" Text=": "></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtEnrollment" AutoCompleteType="Disabled" placeholder="Enter your current enrollment number here" CssClass="text" runat="server" Width="270px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfEnrollment" CssClass="valid" ControlToValidate="txtEnrollment" ErrorMessage="Please enter the enrollment no here!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEnrollment" CssClass="valid" ControlToValidate="txtEnrollment" ValidationExpression="^\d{12}$" ErrorMessage="Enrollment number is no appropriate!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>
                </td>

                <td><asp:Label ID="lblSP2" runat="server" Text=" "></asp:Label></td>
            
                <td>
                   <asp:Label ID="lblNewPassword" CssClass="label2" runat="server" Text="New Password " ></asp:Label>
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
                   <asp:Label ID="lblProjectName" CssClass="label2" runat="server" Text="Project Name " ></asp:Label>
                </td>
                <td>
                   <asp:Label ID="lblProjectNameSepertor" CssClass="label" runat="server" Text=": "></asp:Label>
                </td>
                <td>
                   <asp:TextBox ID="txtProjectName" placeholder="Pick and enter your project name" AutoCompleteType="Disabled" CssClass="text" runat="server" Width="270px"></asp:TextBox><br />
                   <asp:RequiredFieldValidator ID="rfProjectName" CssClass="valid" ControlToValidate="txtProjectName" ErrorMessage="Please enter a Project name here!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>
                   <asp:Label ID="lblGroupNo" CssClass="label" runat="server" Text="Group Number "></asp:Label>
                </td>
                <td>
                   <asp:Label ID="lblGroupNoSeperator" CssClass="label" runat="server" Text=": "></asp:Label>
                </td>
                <td>
                   <asp:TextBox ID="txtGroupNo" placeholder="Enter respective group number" AutoCompleteType="Disabled" CssClass="text" runat="server" Width="270px" ></asp:TextBox><br />
                   <asp:RequiredFieldValidator ID="rfGroupNo" CssClass="valid" ControlToValidate="txtGroupNo" ErrorMessage="Please enter a group number here!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="valid" ControlToValidate="txtGroupNo" ErrorMessage="Group no. should be a letter and two numbers!(For eg. G01)" ForeColor="#ff66cc" Display="Dynamic" runat="server" ValidationExpression="^([a-zA-Z]\d{2}|\d[a-zA-Z]\d{2}|\d{2}[a-zA-Z]\d|\d{2}[a-zA-Z])$"></asp:RegularExpressionValidator>
                </td>

                <td><asp:Label ID="lblSP4" runat="server" Text=" "></asp:Label></td>
            
                <td>
                   <asp:Label ID="lblBatch" CssClass="label2" runat="server" Text="Batch " ></asp:Label>
                </td>
                <td>
                   <asp:Label ID="lblBatchSeperator" CssClass="label" runat="server" Text=": "></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlBatch" CssClass="ddl" runat="server">

                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>
                   <asp:Label ID="lblEmail" CssClass="label" runat="server" Text="E-mail "></asp:Label>
                </td>
                <td>
                   <asp:Label ID="lblEmailSeperator" CssClass="label" runat="server" Text=": "></asp:Label>
                </td>
                <td>
                   <asp:TextBox ID="txtEmail" placeholder="Enter your email address here" AutoCompleteType="Disabled" CssClass="text" runat="server" Width="270px"></asp:TextBox><br />
                   <asp:RequiredFieldValidator ID="rfEmail" CssClass="valid" ControlToValidate="txtEmail" ErrorMessage="Please enter an email address here!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="revEmail" CssClass="valid" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter a valid email!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>
                </td>

                <td><asp:Label ID="lblSP5" runat="server" Text=" "></asp:Label></td>
            
                <td>
                   <asp:Label ID="lblTechnology" CssClass="label2" runat="server" Text="Technology "></asp:Label>
                </td>
                <td>
                   <asp:Label ID="lblTechnologySeperator" CssClass="label" runat="server" Text=": "></asp:Label>
                </td>
                <td>
                   <asp:DropDownList ID="ddlTechnology" CssClass="ddl" runat="server">
                       
                   </asp:DropDownList>
                </td>
            </tr>
        </table>
        <br />
<%--        <br />--%>
        <asp:Button ID="btnStudent" CssClass="btn" runat="server" Text="Add student" OnClick="btnStudent_Click" />
   </div>
</asp:Content>