<%@ Page Language="C#" MasterPageFile="~/Admin_Panel.Master" AutoEventWireup="true" CodeBehind="Admin_Faculty_Delete.aspx.cs" Inherits="Communique.Admin_Faculty_Delete" %>

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
    <link rel="stylesheet" type="text/css" href="Admin_Faculty_Delete_Style.css" />
    <script>
        function confirmClear() {
            return confirm("Are you sure you want delete every faculty record? \n[NOTE: Once done, you won't be able to retrive the data back.]");
        }
    </script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="con">
        <div class="con2">
            <asp:ImageButton ID="btnClearAll" CausesValidation="false" runat="server" CssClass="clearAll" ImageUrl="Images/DeleteY.png" onmouseover="this.src='Images/Delete.png'" onmouseout="this.src='Images/DeleteY.png'" OnClientClick="if( ! confirmClear()) return false;" meta:resourcekey="btnClearAllResource1" OnClick="btnClearAll_Click" />
            <%-- Gap --%>
            <%--<asp:RequiredFieldValidator ID="rfEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter the email address of the respective faculty to continue." ForeColor="#ff66cc" style="font-size:0.9em; font-family:'Microsoft JhengHei UI'; margin-left:61.9em;" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revEmail" CssClass="valid" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter a valid email!" ForeColor="#ff66cc" style="font-size:0.9em; font-family:'Microsoft JhengHei UI'; margin-left:70.3em;" Display="Dynamic" runat="server"></asp:RegularExpressionValidator><br />--%>
            <asp:Label CssClass="lbl" ID="lblEmail" runat="server" Text="E-mail. : " style="margin-left:45em;"></asp:Label>
            <asp:DropDownList Width="20em" ID="ddlFac" runat="server" AutoCompleteType="Disabled" CausesValidation="true" CssClass="ddl" style="margin-top:1.5em;"></asp:DropDownList><br />
            <asp:Button CssClass="btn" ID="btnContinue" runat="server" Text="Okay" OnClick="btnContinue_Click" /><br /><br /><br />
        </div>
        <div>
            <asp:Label CssClass="lbl" ID="lblFName" runat="server" Text="First Name : " Visible="False" style="margin-left:5.435em;"></asp:Label>
            <asp:TextBox Width="20em" CssClass="txt" ID="txtFName" runat="server" AutoCompleteType="Disabled" CausesValidation="false" Visible="False" Enabled="False"></asp:TextBox><%--<br />--%>
            <asp:Label CssClass="lbl" ID="lblLName" runat="server" Text="Last Name : " Visible="False" style="margin-left:5.5em;"></asp:Label>
            <asp:TextBox Width="20em"  CssClass="txt" ID="txtLName" runat="server" AutoCompleteType="Disabled" CausesValidation="false" Visible="False" Enabled="False"></asp:TextBox><br />
            <asp:Label CssClass="lbl" ID="lblTechLeader" runat="server" Text="Technology Guide : " Visible="False"></asp:Label>
            <asp:TextBox Width="20em"  CssClass="txt" ID="txtTech" runat="server" AutoCompleteType="Disabled" CausesValidation="False" Visible="False" Enabled="False"></asp:TextBox>
            <asp:Label CssClass="lbl" ID="lblFacPassword" runat="server" Text="Password : " Visible="False" style="margin-left:5.92em;"></asp:Label>
            <asp:TextBox Width="20em"  CssClass="txt" ID="txtFacPassword" runat="server" AutoCompleteType="Disabled" CausesValidation="False" Visible="False" Enabled="False"></asp:TextBox><br /><br /><br />
            <asp:Button CssClass="btn2" ID="btnFacultyDelete" runat="server" Text="Delete this record" Visible="false" Enabled="true" OnClick="btnFacultyDelete_Click" />
            <asp:CheckBox CssClass="cb" ID="chkEditMode" runat="server" Text="Check this box to activate editing mode." AutoPostBack="true" Visible="false" />
        </div>
    </div>
</asp:Content>