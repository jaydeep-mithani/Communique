<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Faculty_Panel_ProjectBrowse.aspx.cs" Inherits="Communique.Faculty_Panel_ProjectBrowse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Projects Details</title>
    <link rel="stylesheet" type="text/css" href="Faculty_Panel_ProjectBrowse_Style.css" />
    <%--<script src="xhttps://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
</head>
<body>
    <form id="frmFacultyProjectsBrowse" runat="server">
        <div>
            <header>
                <h1><asp:Label ID="lblFTitle" runat="server" Text="Communique"></asp:Label><asp:Button ID="btnUpdates" CssClass="bt" runat="server" Text="Project Updates" OnClick="btnUpdates_Click" /></h1>
            </header>
            <div>
                <%--<div id="prolist">--%>
                    <div id="projects" >
                        <asp:GridView ID="viewProjects" ShowHeaderWhenEmpty="false" CssClass="projectGrid" runat="server" AutoGenerateColumns="False" AlternatingRowStyle-CssClass="alt" Font-Strikeout="False" OnSelectedIndexChanged="viewProjects_SelectedIndexChanged" OnRowCommand="viewProjects_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="StudentProjectname" HeaderText="Projects Under Your Guidance" HeaderStyle-BackColor="#00ffe0" HeaderStyle-BorderColor="#00ffe0" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Black" ItemStyle-HorizontalAlign="Center" HeaderStyle-Height="4em"  ItemStyle-Height="2em" />
                                <asp:ButtonField ButtonType="Image" ImageUrl="Images/Eye04.png" Text="More Info" CommandName="Select" ItemStyle-CssClass="eyes" HeaderStyle-BackColor="#00ffe0" HeaderStyle-BorderColor="#00ffe0" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Black" ItemStyle-HorizontalAlign="Center" HeaderStyle-Height="4em"  ItemStyle-Height="2em" />
                            </Columns>
                        </asp:GridView>
                    </div>
                    <asp:GridView CssClass="moreDetails" ID="projectDetails" Visible="false" ShowHeaderWhenEmpty="false" runat="server" AutoGenerateColumns="False" AlternatingRowStyle-CssClass="alt" Font-Strikeout="False" OnSelectedIndexChanged="viewProjects_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="StudentEnrollment" HeaderText="Enrollment No." HeaderStyle-BackColor="#00ffe0" HeaderStyle-BorderColor="#00ffe0" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Black" ItemStyle-HorizontalAlign="Center" HeaderStyle-Height="4em"  ItemStyle-Height="3.3em" />
                            <asp:BoundField DataField="StudentFirstname" HeaderText="First Name" HeaderStyle-BackColor="#00ffe0" HeaderStyle-BorderColor="#00ffe0" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Black" ItemStyle-HorizontalAlign="Center" HeaderStyle-Height="4em"  ItemStyle-Height="2em" />
                            <asp:BoundField DataField="StudentLastname" HeaderText="Last Name" HeaderStyle-BackColor="#00ffe0" HeaderStyle-BorderColor="#00ffe0" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Black" ItemStyle-HorizontalAlign="Center" HeaderStyle-Height="4em"  ItemStyle-Height="2em" />
                            <asp:BoundField DataField="StudentEmail" HeaderText="Email ID" HeaderStyle-BackColor="#00ffe0" HeaderStyle-BorderColor="#00ffe0" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Black" ItemStyle-HorizontalAlign="Center" HeaderStyle-Height="4em"  ItemStyle-Height="2em" />
                            <asp:BoundField DataField="StudentGroup" HeaderText="Group" HeaderStyle-BackColor="#00ffe0" HeaderStyle-BorderColor="#00ffe0" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Black" ItemStyle-HorizontalAlign="Center" HeaderStyle-Height="4em"  ItemStyle-Height="2em" />
                            <asp:BoundField DataField="StudentBatch" HeaderText="Batch" HeaderStyle-BackColor="#00ffe0" HeaderStyle-BorderColor="#00ffe0" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Black" ItemStyle-HorizontalAlign="Center" HeaderStyle-Height="4em"  ItemStyle-Height="2em" />
                        </Columns>
                    </asp:GridView>
                <%--</div>--%>
            </div>
            <footer>
                <%--<div>--%>
                    <asp:Button id="btnLogout" CssClass="btnx" runat="server" Text="Logout" OnClick="btnLogout_Click" />
                    <asp:Label Text="© Copyright 2020 Communique" ID="lblFCopyright" runat="server"></asp:Label>
                <%--</div>--%>
            </footer>
        </div>
    </form>
</body>
</html>
