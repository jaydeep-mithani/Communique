<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Faculty_Panel_Home.aspx.cs" Inherits="Communique.Faculty_Panel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Panel</title>
    <link rel="stylesheet" type="text/css" href="Faculty_Panel_Home_Style.css" />
    <script>
        function getReason() {
            if (<%=lbsNoteBox.SelectedItem != null%>) {

                var ask = prompt("Please enter a reason to reject this entry.", "");
                if (ask != null && ask != "") {
                    document.getElementById("<%=hndPromptForReason.ClientID%>").value = ask;
                    return true;
                }
                else
                    return false;
            }
        }
    </script>
</head>
<body>
    <form id="frmFacultyPanel" runat="server">
        <header>
            <h1><asp:Label ID="lblFTitle" runat="server" Text="Communique"></asp:Label><asp:Button ID="btnProjects" CssClass="bt" runat="server" Text="View Current Projects" OnClick="btnProjects_Click" /></h1>
        </header>
        <div style="float:left;">
            <%--<br />--%>
            <asp:Label ID="lblWelcome" CssClass="label" runat="server" Text="WELCOME "></asp:Label>
            <asp:Label ID="lblUser" CssClass="label" runat="server" Text="USER"></asp:Label>
        </div>
        <%--<br /><br /><br />--%>
        <asp:Button ID="btnAcceptUpdate" CssClass="AD" runat="server" Text="Confirm" style="/*margin-left:0.8em;*/" OnClick="btnAcceptUpdate_Click" /><asp:Button ID="btnDecline" CssClass="AD" runat="server" Text="Reject" style="/*margin-left:2em; padding: 0em 1em*/" OnClick="btnDecline_Click" OnClientClick="return getReason();" /><%--<br /><br />--%>
        <div id="updates">
            <%--<asp:Textbox ID="txtDefault" runat="server" Text="Welcome to Communique." Enabled="false"></asp:Textbox>--%>
          <asp:ListBox ID="lbsNoteBox" CssClass="box" runat="server" Loaded="HookScrollViewer">
                <asp:ListItem Text="Welcome to Communique"></asp:ListItem>
          </asp:ListBox>
        </div>
        <footer>
                <asp:Button ID="btnLogout" CssClass="btnx" runat="server" Text="Logout" OnClick="btnLogout_Click" />
                <asp:Label Text="© Copyright 2020 Communique" ID="lblFCopyright" runat="server"></asp:Label>
                <asp:HiddenField ID="hndPromptForReason" runat="server" />
        </footer>
    </form>
</body>
</html>
