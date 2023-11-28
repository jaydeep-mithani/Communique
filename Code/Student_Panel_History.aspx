<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Panel_History.aspx.cs" Inherits="Communique.Student_Panel_History" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <link rel="stylesheet" type="text/css" href="Student_Panel_History_Style.css" />
                <h1><asp:Label ID="lblTitle" runat="server" Text="Communique"></asp:Label><asp:Button ID="btnHome" CssClass="bt" runat="server" Text="Home" OnClick="btnHome_Click" /><asp:Button ID="btnViewInfo" CssClass="bt" runat="server" Text="View Info" style="margin-left:2em;" OnClick="btnViewInfo_Click" /></h1>
            </header>
            <div id="histDisplay">
                <asp:GridView CssClass="view" ID="gvHistory" runat="server" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="false" HorizontalAlign="Justify"  ShowHeader="True" AllowSorting="True" CurrentSordDirection="DES">
                    <Columns>
                        <asp:BoundField DataField="DU" ItemStyle-Width="50em" HeaderText="Submitted Data" HeaderStyle-BackColor="#68ff00" HeaderStyle-BorderColor="#68ff00" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Gray" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="Reason" ItemStyle-Width="25em" HtmlEncode="false" HeaderText="Reasult Reason" HeaderStyle-BackColor="#68ff00" HeaderStyle-BorderColor="#68ff00" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Gray" ItemStyle-HorizontalAlign="Center" HeaderStyle-Height="4em"  ItemStyle-Height="3.5em" />
                        <%--<asp:BoundField DataField="Agree" HtmlEncode="false" HeaderText="True=[Accepted]<br /><br /> False=[Declined]" HeaderStyle-BackColor="#68ff00" HeaderStyle-BorderColor="#68ff00" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Gray" ItemStyle-HorizontalAlign="Center" HeaderStyle-Height="4em"  ItemStyle-Height="3.5em" />--%>
                        <asp:TemplateField HeaderText="Result" HeaderStyle-BackColor="#68ff00" HeaderStyle-BorderColor="#68ff00" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Gray" ItemStyle-HorizontalAlign="Center" HeaderStyle-Height="4em"  ItemStyle-Height="3.5em">
                            <ItemTemplate><%# (Boolean.Parse(Eval("Agree").ToString())) ? "Accepted" : "Declined" %></ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
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