<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Signup.aspx.cs" Inherits="Communique.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Signup</title>
    <link type="text/css" rel="stylesheet" href="Student_Signup_Style.css" />
</head>
<body>
    <form id="frmStudentSignup" runat="server">
        <table id="tblStudentSignup">
            <tr>
                <td>
                    <asp:Label ID="lblFirstName" CssClass="label" runat="server" Text="First Name "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblFirstNameSeperator" CssClass="label" runat="server" Text=": "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFirstName" placeholder="Enter your first name here" AutoCompleteType="Disabled" CssClass="text" runat="server" Width="270px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfFName" CssClass="valid" ControlToValidate="txtFirstName" ErrorMessage="Your first name cannot be empty!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revFName" CssClass="valid" ControlToValidate="txtFirstName" ValidationExpression="^[\s\S]{3,}$" ErrorMessage="Your name should be of 3 characters minimum!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>
                </td>
                <%--<td>
                    <asp:RequiredFieldValidator ID="rfFName" CssClass="valid" ControlToValidate="txtFirstName" ErrorMessage="Your first name cannot be empty!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revFName" CssClass="valid" ControlToValidate="txtFirstName" ValidationExpression="^[\s\S]{3,}$" ErrorMessage="Your name should be of 3 characters minimum!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>
                </td>--%>
            </tr>
            
            <tr>
                <td>
                   <asp:Label ID="lblLastName" CssClass="label" runat="server" Text="Last Name "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLastNameSeperator" CssClass="label" runat="server" Text=": "></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtLastName" placeholder="Enter your last name here" AutoCompleteType="Disabled" CssClass="text" runat="server" Width="270px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfLName" CssClass="valid" ControlToValidate="txtLastName" ErrorMessage="Your last name cannot be empty!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                </td>
                <%--<td>
                    <asp:RequiredFieldValidator ID="rfLName" CssClass="valid" ControlToValidate="txtLastName" ErrorMessage="Your last name cannot be empty!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                </td>--%>
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
                    <asp:RequiredFieldValidator ID="rfEnrollment" CssClass="valid" ControlToValidate="txtEnrollment" ErrorMessage="Please enter your enrollment no here!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEnrollment" CssClass="valid" ControlToValidate="txtEnrollment" ValidationExpression="^\d+$" ErrorMessage="Enrollment number should be in digits!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>
                </td>
                <%--<td>
                    <asp:RequiredFieldValidator ID="rfEnrollment" CssClass="valid" ControlToValidate="txtEnrollment" ErrorMessage="Please enter your enrollment no here!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEnrollment" CssClass="valid" ControlToValidate="txtEnrollment" ValidationExpression="^\d+$" ErrorMessage="Enrollment number should be in digits!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>
                </td>--%>
            </tr>

            <tr>
                <td>
                   <asp:Label ID="lblNewPassword" CssClass="label" runat="server" Text="New Password "></asp:Label>
                </td>
                <td>
                   <asp:Label ID="lblNewPasswordSeperator" CssClass="label" runat="server" Text=": "></asp:Label>
                </td>
                <td>
                   <asp:TextBox ID="txtNewPassword" placeholder="Create a new password" AutoCompleteType="Disabled" CssClass="text" runat="server" Width="270px" TextMode="Password"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfPassword" CssClass="valid" ControlToValidate="txtNewPassword" ErrorMessage="Please enter the password here!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPassword" CssClass="valid" ControlToValidate="txtNewPassword" ValidationExpression="^[\s\S]{8,}$" ErrorMessage="Password should contain minimum 8 characters!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>
                </td>
                <%--<td>
                    <asp:RequiredFieldValidator ID="rfPassword" CssClass="valid" ControlToValidate="txtNewPassword" ErrorMessage="Please enter the password here!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPassword" CssClass="valid" ControlToValidate="txtNewPassword" ValidationExpression="^[\s\S]{8,}$" ErrorMessage="Password should contain minimum 8 characters!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>
                </td>--%>
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
                    <asp:RequiredFieldValidator ID="rfConfirmPassword" CssClass="valid" ControlToValidate="txtConfirmPassword" ErrorMessage="Please enter the password here!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvConfirmPassword" CssClass="valid" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="The password doesn't match the above password." ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:CompareValidator>
                </td>
                <%--<td>
                    <asp:RequiredFieldValidator ID="rfConfirmPassword" CssClass="valid" ControlToValidate="txtConfirmPassword" ErrorMessage="Please enter the password here!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvConfirmPassword" CssClass="valid" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="The password doesn't match the above password." ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:CompareValidator>
                </td>--%>
            </tr>

            <tr>
                <td>
                   <asp:Label ID="lblProjectName" CssClass="label" runat="server" Text="Project Name "></asp:Label>
                </td>
                <td>
                   <asp:Label ID="lblProjectNameSepertor" CssClass="label" runat="server" Text=": "></asp:Label>
                </td>
                <td>
                   <asp:TextBox ID="txtProjectName" placeholder="Pick and enter your project name" AutoCompleteType="Disabled" CssClass="text" runat="server" Width="270px"></asp:TextBox><br />
                   <asp:RequiredFieldValidator ID="rfProjectName" CssClass="valid" ControlToValidate="txtProjectName" ErrorMessage="Please enter a Project name here!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                </td>
                <%--<td>
                    <asp:RequiredFieldValidator ID="rfProjectName" CssClass="valid" ControlToValidate="txtProjectName" ErrorMessage="Please enter a Project name here!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                </td>--%>
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
                   <asp:RequiredFieldValidator ID="rfEmail" CssClass="valid" ControlToValidate="txtEmail" ErrorMessage="Please enter your email address here!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="revEmail" CssClass="valid" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter a valid email!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>
                </td>
                <%--<td>
                    <asp:RequiredFieldValidator ID="rfEmail" CssClass="valid" ControlToValidate="txtEmail" ErrorMessage="Please enter your email address here!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" CssClass="valid" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter a valid email!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>
                </td>--%>
            </tr>

            <tr>
                <td>
                   <asp:Label ID="lblTechnology" CssClass="label" runat="server" Text="Technology "></asp:Label>
                </td>
                <td>
                   <asp:Label ID="lblTechnologySeperator" CssClass="label" runat="server" Text=": "></asp:Label>
                </td>
                <td>
                   <asp:DropDownList   ID="ddlTechnology" runat="server">
                       <asp:ListItem>.NET</asp:ListItem>
                       <asp:ListItem>Python</asp:ListItem>
                       <asp:ListItem>Android</asp:ListItem>
                       <asp:ListItem>PHP</asp:ListItem>
                       <asp:ListItem>IOS</asp:ListItem>
                   </asp:DropDownList>
                   <%--<select id="ddlTechnology">
                       <option class="i">.NET</option>
                       <option class="i">Python</option>
                       <option class="i">Android</option>
                       <option class="i">PHP</option>
                       <option>IOS</option>
                   </select>--%>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Button ID="btnSignup" runat="server" OnClick="btnSignup_Click" Text="Sign Me Up" />
    </form>
</body>
</html>
