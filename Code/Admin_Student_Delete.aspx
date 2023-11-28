<%@ Page Language="C#" MasterPageFile="~/Admin_Panel.Master" AutoEventWireup="true" CodeBehind="Admin_Student_Delete.aspx.cs" Inherits="Communique.Admin_Student_Delete" %>

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
    <link rel="stylesheet" type="text/css" href="Admin_Student_Delete_Style.css" />
    <script>
        function confirmClear() {
            return confirm("Are you sure you want delete every student record? \n[NOTE: Once done, you won't be able to retrive the data back.]");
        }
    </script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="con">
        <div class="con2">
            <asp:ImageButton ID="btnClearAll" CausesValidation="false" runat="server" CssClass="clearAll" ImageUrl="Images/DeleteY.png" onmouseover="this.src='Images/Delete.png'" onmouseout="this.src='Images/DeleteY.png'" OnClientClick="if( ! confirmClear()) return false;" meta:resourcekey="btnClearAllResource1" OnClick="btnClearAll_Click" />
            <%--<input type="image" src="Images/Delete.png" class="clearAll" />--%>
            <asp:RequiredFieldValidator ID="rfEnrollment" runat="server" ControlToValidate="txtEnrollment" ErrorMessage="Enter the enrollment number to continue." ForeColor="#ff66cc" style="font-size:0.9em; font-family:'Microsoft JhengHei UI'; margin-left:58.23em; position:absolute; float:left; top:8.3em;" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revEnrollment" runat="server" ControlToValidate="txtEnrollment" ErrorMessage="Invalid enrollment number." ForeColor="#ff66cc" ValidationExpression="^\d{12}$" style="font-size:0.9em; font-family:'Microsoft JhengHei UI'; margin-left:58.23em; position:absolute; float:left; top:8.3em;" Display="Dynamic"></asp:RegularExpressionValidator><br />
            <asp:Label CssClass="lbl" ID="lblEnrolment" runat="server" Text="Enrollment no. : " style="margin-left:42em;"></asp:Label>
            <asp:TextBox Width="20em" ID="txtEnrollment" runat="server" AutoCompleteType="Disabled" CausesValidation="true" CssClass="txt" ></asp:TextBox><br />
            <asp:Button CssClass="btn" ID="btnContinue" runat="server" Text="Okay" OnClick="btnContinue_Click" /><br /><br /><br />
        </div>
        <div>
            <asp:Label CssClass="lbl" ID="lblFName" runat="server" Text="First Name : " Visible="False"></asp:Label>
            <asp:TextBox Width="16em" CssClass="txt" ID="txtFName" runat="server" AutoCompleteType="Disabled" CausesValidation="false" Visible="False" Enabled="False"></asp:TextBox><%--<br />--%>
            <asp:Label CssClass="lbl" ID="lblLName" runat="server" Text="Last Name : " Visible="False"></asp:Label>
            <asp:TextBox Width="16em"  CssClass="txt" ID="txtLName" runat="server" AutoCompleteType="Disabled" CausesValidation="false" Visible="False" Enabled="False"></asp:TextBox>
            <asp:Label CssClass="lbl" ID="lblGroup" runat="server" Text="Group No. : " Visible="False"></asp:Label>
            <asp:TextBox Width="16em"  CssClass="txt" ID="txtGroup" runat="server" AutoCompleteType="Disabled" CausesValidation="false" Visible="False" Enabled="False"></asp:TextBox><br />
            <asp:Label CssClass="lbl" ID="lblEmail" runat="server" Text="Email - ID : " Visible="False"></asp:Label>
            <asp:TextBox Width="16em"  CssClass="txt" ID="txtEmail" runat="server" AutoCompleteType="Disabled" CausesValidation="False" Visible="False" Enabled="False"></asp:TextBox><%--<br />--%>
            <asp:Label CssClass="lbl" ID="lblProjectName" runat="server" Text="Project Title : " Visible="False"></asp:Label>
            <asp:TextBox Width="16em"  CssClass="txt" ID="txtProjectName" runat="server" AutoCompleteType="Disabled" CausesValidation="false" Visible="False" Enabled="False"></asp:TextBox>
            <asp:Label CssClass="lbl" ID="lblBatch" runat="server" Text="Batch : " Visible="False" style="margin-left:4.25em;"></asp:Label>
            <asp:TextBox Width="16em"  CssClass="txt" ID="txtBatch" runat="server" AutoCompleteType="Disabled" CausesValidation="false" Visible="False" Enabled="False"></asp:TextBox><br />
            <asp:Label CssClass="lbl" ID="lblTechnology" runat="server" Text="Technology : " Visible="False"></asp:Label>
            <asp:TextBox Width="16em" ID="txtTech" CssClass="txt" runat="server" Visible="false" Enabled="false"></asp:TextBox>
            <%--<asp:DropDownList CssClass="ddl" ID="ddlTech" runat="server" Visible="False" Enabled="False">
                <asp:ListItem Text=".NET"></asp:ListItem>
                <asp:ListItem Text="PHP"></asp:ListItem>
                <asp:ListItem Text="Python"></asp:ListItem>
                <asp:ListItem Text="Android"></asp:ListItem>
                <asp:ListItem Text="IOS"></asp:ListItem>
            </asp:DropDownList>--%>
            <asp:Label CssClass="lbl" ID="lblPassword" runat="server" Text="Password : " Visible="False"></asp:Label>
            <asp:TextBox Width="16em"  CssClass="txt" ID="txtPassword" runat="server" AutoCompleteType="Disabled" CausesValidation="false" Visible="False" Enabled="False"></asp:TextBox>
            <asp:Button ID="btnStudentDelete" runat="server" CssClass="btn2" Text="Delete this record" Visible="false" Enabled="true" OnClick="btnStudentDelete_Click" />
            
        </div>
    </div>
</asp:Content>