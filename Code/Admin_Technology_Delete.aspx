<%@ Page Language="C#" MasterPageFile="~/Admin_Panel.Master" AutoEventWireup="true" CodeBehind="Admin_Technology_Delete.aspx.cs" Inherits="Communique.Admin_Technology_Delete1" %>

<asp:Content ID="From1" runat="server" ContentPlaceHolderID="head">
    <link rel="stylesheet" type="text/css" href="Admin_Technology_Delete_Style.css" />
</asp:Content>
<asp:Content ID="ContentChangePassword" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="con">
        <table class="tbl">
            <tr>
                <td><asp:Label ID="lblTechnologies" runat="server" Text="Technologies" CssClass="lbl"></asp:Label></td>
                <td><asp:Label ID="Label1" runat="server" Text=" : " CssClass="lbl"></asp:Label></td>
                <td><asp:DropDownList ID="ddlTech" runat="server" CssClass="ddl"></asp:DropDownList> </td>
            </tr>
            <tr>
                <td><br /></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="btnDelete" runat="server" Text="Remove" CssClass="btn" OnClick="btnDelete_Click" /></td>
            </tr>
        </table>
    </div>
</asp:Content>