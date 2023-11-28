<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Panel_Home.aspx.cs" Inherits="Communique.Student_Panel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Panel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="Student_Panel_Home_Style.css" />
    <%--<script>
        function getReason() {
            var ask = prompt("Please enter a reason to reject this entry.", "");
            if (ask != null && ask != "")
            {
                document.getElementById("<%=hndPromptForReason.ClientID%>").value = ask;
                return true;
            }
            else
                return false;
        }
    </script>--%>
</head>
<body>
    <form id="frmStudentPanel" runat="server">
        <div >
            <header>
                <h1><asp:Label ID="lblTitle" runat="server" Text="Communique"></asp:Label><asp:Button ID="btnHistory" CssClass="bt" runat="server" Text="History" OnClick="btnHistory_Click" /><asp:Button ID="btnViewInfo" CssClass="bt" runat="server" Text="View Info" style="margin-left:2em;" OnClick="btnViewInfo_Click" /></h1>
            </header>
            <div style="background-color:none;">
                <%--<div id="name">--%>
                    <asp:Label ID="lblWelcome" CssClass="label" runat="server" Text="WELCOME "></asp:Label>
                    &nbsp;<asp:Label ID="lblUser" CssClass="label" runat="server" Text="USER"></asp:Label>
                <%--</div>--%>
                <br /><br /><br /><br /><br /><br /><br /><br /><br />
                <br />
                <asp:Label ID="lblProgressDiscription" runat="server" Text="Enter your project progress details here : "></asp:Label>
                <br />
                <br /><asp:TextBox placeholder="Enter the detailed information about the updated to your project developement since the last entry." ID="txtProgressDicription" runat="server" TextMode="MultiLine"></asp:TextBox>
                <br />
                <br />
                <asp:LinkButton ID="btnConfirm" runat="server" OnClick="btnConfirm_Click"><i class="fa fa-paper-plane"></i> SEND</asp:LinkButton> 
            </div>
            <footer>
            <%-- <asp:Button ID="btnProfile" runat="server" Text="View profile" />--%>
                <div style="background-color:none;padding-top:0.6em;">
                    <asp:Button ID="btnLogout" CssClass="btnx" runat="server" Text="Logout" OnClick="btnLogout_Click" />
                    <asp:Label Text="© Copyright 2020 Communique" ID="lblCopyright" runat="server"></asp:Label>
                </div>
            </footer>
            <asp:HiddenField ID="hndPromptForReason" runat="server" />
        </div>
    </form>
</body>
</html>
