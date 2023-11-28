<%@ Page Language="C#" MasterPageFile="~/Admin_Panel.Master" AutoEventWireup="true" CodeBehind="Admin_Faculty_Select.aspx.cs" Inherits="Communique.Admin" %>

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
    <link rel="stylesheet" type="text/css" href="Admin_Faculty_Select_Style.css" />
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="con">
        <div>
            <%--<asp:RequiredFieldValidator ID="rfEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter the email address of the respective faculty to continue." ForeColor="#ff66cc" style="font-size:0.9em; font-family:'Microsoft JhengHei UI'; margin-left:61.9em;" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revEmail" CssClass="valid" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter a valid email!" ForeColor="#ff66cc" style="font-size:0.9em; font-family:'Microsoft JhengHei UI'; margin-left:70.3em;" Display="Dynamic" runat="server"></asp:RegularExpressionValidator><br />--%>
            <asp:Label CssClass="lbl" ID="lblFac" runat="server" Text="Choose Faculty : " style="margin-left:54em;"></asp:Label>
            <asp:DropDownList Width="20em" ID="ddlFac" runat="server" AutoCompleteType="Disabled" CausesValidation="true" CssClass="ddl" style="margin-top:1.5em;"></asp:DropDownList><br />
            <asp:Button CssClass="btn" ID="btnContinue" runat="server" Text="Okay" OnClick="btnContinue_Click" /><br /><br /><br />
        </div>
        <div>
            <asp:Label CssClass="lbl" ID="lblFName" runat="server" Text="First Name : " Visible="False" style="margin-left:5.435em;"></asp:Label>
            <asp:TextBox Width="20em" CssClass="txt" ID="txtFName" runat="server" AutoCompleteType="Disabled" CausesValidation="false" Visible="False" Enabled="False"></asp:TextBox><%--<br />--%>
            <asp:Label CssClass="lbl" ID="lblLName" runat="server" Text="Last Name : " Visible="False" style="margin-left:5.5em;"></asp:Label>
            <asp:TextBox Width="20em"  CssClass="txt" ID="txtLName" runat="server" AutoCompleteType="Disabled" CausesValidation="false" Visible="False" Enabled="False"></asp:TextBox><br />
            <asp:Label CssClass="lbl" ID="lblTechLeader" runat="server" Text="Technology Guide : " Visible="False" style="margin-left:5.5em;"></asp:Label>
            <asp:DropDownList CssClass="ddl" ID="ddlTechLeader" runat="server" Visible="false" Enabled="false" >

            </asp:DropDownList><%--13.4em--%>
            <asp:Label CssClass="lbl" ID="lblFacPassword" runat="server" Text="Password : " Visible="False" style="margin-left:9.9em;"></asp:Label>
            <asp:TextBox Width="20em"  CssClass="txt" ID="txtFacPassword" runat="server" AutoCompleteType="Disabled" CausesValidation="False" Visible="False" Enabled="False"></asp:TextBox><br />
            <asp:Button CssClass="btn2" ID="btnFacultyUpdate" runat="server" Text="Update" Visible="false" Enabled="true" OnClick="btnFacultyUpdate_Click" />
            <br />
            <asp:CheckBox CssClass="cb" ID="chkEditMode" runat="server" Text="Check this box to activate editing mode." AutoPostBack="true" Visible="false" OnCheckedChanged="chkEditMode_CheckedChanged" />
        </div>
    </div>
</asp:Content>