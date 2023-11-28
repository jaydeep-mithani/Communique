<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Panel_Information.aspx.cs" Inherits="Communique.Student_Panel_Information" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <link rel="stylesheet" type="text/css" href="Student_Panel_Information_Style.css" />
                <h1><asp:Label ID="lblTitle" runat="server" Text="Communique"></asp:Label><asp:Button ID="btnHistory" CssClass="bt" runat="server" Text="History" OnClick="btnHistory_Click" /><asp:Button ID="btnHome" CssClass="bt" runat="server" Text="Home" style="margin-left:2em;" OnClick="btnHome_Click" /></h1>
            </header>
            <div >
                <br /><br /><br /><br /><br /><br /><br /><br />
                <asp:Label ID="lblGuide" CssClass="lbl3" runat="server" Text="Project Guide : "></asp:Label>
                <asp:Label ID="lblShowGuide" CssClass="lbl4" runat="server"></asp:Label><br /><br /><br /><br />
                <asp:Label ID="lblSName" CssClass="lbl" runat="server" Text="Name : "></asp:Label>
                <asp:Label ID="lblShowName" CssClass="lbl2" runat="server"></asp:Label><br /><br />
                <asp:Label ID="lblEnrollment" CssClass="lbl" runat="server" Text="Enrollment number : "></asp:Label>
                <asp:Label ID="lblShowEnrollment" CssClass="lbl2" runat="server"></asp:Label><br /><br />
                <asp:Label ID="lblSTech" CssClass="lbl" runat="server" Text="Technology : "></asp:Label>
                <asp:Label ID="lblShowTech" CssClass="lbl2" runat="server"></asp:Label><br /><br />
                <asp:Label ID="lblSProjectName" CssClass="lbl" runat="server" Text="Project name : "></asp:Label>
                <asp:Label ID="lblShowProjectName" CssClass="lbl2" runat="server"></asp:Label><br /><br />
                <asp:Label ID="lblSEmail" CssClass="lbl" runat="server" Text="Email address : "></asp:Label>
                <asp:Label ID="lblShowEmail" CssClass="lbl2" runat="server"></asp:Label><br /><br />
                <asp:Label ID="lblSGroup" CssClass="lbl" runat="server" Text="Group number : "></asp:Label>
                <asp:Label ID="lblShowGroup" CssClass="lbl2" runat="server"></asp:Label><br /><br />
                <asp:Label ID="lblSBatch" CssClass="lbl" runat="server" Text="Batch : "></asp:Label>
                <asp:Label ID="lblShowBatch" CssClass="lbl2" runat="server"></asp:Label><br /><br />
            </div>
            <footer>
                <%--<div style="background-color:none; margin-top:1.5em;">--%>
                    <asp:Button ID="btnLogout" CssClass="btnx" runat="server" Text="Logout" OnClick="btnLogout_Click" />
                    <asp:Label Text="© Copyright 2020 Communique" ID="lblCopyright" runat="server"></asp:Label>
                <%--</div>--%>
            </footer>
        </div>
    </form>
</body>
</html>
