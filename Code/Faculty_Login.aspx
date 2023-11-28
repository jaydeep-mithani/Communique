<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Faculty_Login.aspx.cs" Inherits="Communique.Faculty_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link type="text/css" rel="stylesheet" href="Faculty_Login_Style.css" />
</head>
<body>
    <form id="frmFacultyLogin" runat="server">
        <div>
            <h1 id="hFTitle">
                <asp:ImageButton CssClass="dl" ID="download" OnClientClick="popForDownload()" runat="server" ImageUrl="Images/Download_B.png" onmouseover="this.src='Images/PDF_B.png'" onmouseout="this.src='Images/Download_B.png'" />
                <span id="ti">Communique</span>
                <asp:Button ID="btnFAdminLogin" CausesValidation="false" CssClass="btns" runat="server" Text="Login as Admin" OnClick="btnFAdminLogin_Click" />
                <asp:Button ID="btnFStudentLogin" CausesValidation="false" CssClass="btns" runat="server" Text="Login as a Student" OnClick="btnFStudentLogin_Click" />
            </h1>
            <asp:Table ID="tblFLogin" runat="server" Height="219px" Width="508px" HorizontalAlign="Center" CaptionAlign="NotSet">
                <asp:TableRow ID="trF1" runat="server">
                    <asp:TableCell>
                        <asp:Label ID="lblFEmail" CssClass="lbl" runat="server" Text="E - Mail "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblFEmialSeperator" CssClass="lbl" runat="server" Text=": "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtFEmail" CssClass="txtField" placeholder="Enter your e-mail address" AutoCompleteType="Disabled" runat="server" Width="239px" TextMode="Email"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfFEmail" CssClass="valid" ControlToValidate="txtFEmail" ErrorMessage="Please enter your email address here!" ForeColor="Red" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                        <%--<asp:RegularExpressionValidator ID="revFEmail" CssClass="valid" ControlToValidate="txtFEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter a valid email!" ForeColor="Red" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>--%>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="trF2" runat="server">
                    <asp:TableCell ID="tcFPassword">
                        <asp:Label ID="lblFPassword" CssClass="lbl" runat="server" Text="Password "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblFPasswordSeperator" CssClass="lbl" runat="server" Text=": "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtFPassword" CssClass="txtField" placeholder="Enter the password" TextMode="Password" AutoCompleteType="Disabled" runat="server" Width="239px"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfFPassword" CssClass="valid" ControlToValidate="txtFPassword" ErrorMessage="Please enter the password here!" ForeColor="Red" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revFPassword" CssClass="valid" ControlToValidate="txtFPassword" ValidationExpression="^[\s\S]{8,}$" ErrorMessage="Password should contain minimum 8 characters!" ForeColor="Red" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <asp:Button ID="btnFLogin" CausesValidation="true" CssClass="btns" runat="server" Text="Login" OnClick="btnFLogin_Click" /><br />
            <br />

            <%----------------------------------------------------------------------------Popup--------------------------------------------------------------------------------%>
            <%----------------------------------------------------------------------------Popup--------------------------------------------------------------------------------%>
            <%----------------------------------------------------------------------------Popup--------------------------------------------------------------------------------%>


            <div id="pop" class="faded">


                <asp:LinkButton ID="liClose" CssClass="close" runat="server" OnClientClick="popForDownload()" OnClick="liClose_Click"><i class="fa fa-close"></i></asp:LinkButton>

                <asp:TextBox ID="txtE" CssClass="popText" placeholder="email address" runat="server" Width="45em"></asp:TextBox>
                <br />
                <asp:TextBox ID="txtP" CssClass="popText" placeholder="password" TextMode="Password" runat="server" Width="45em"></asp:TextBox>

                <asp:DropDownList ID="ddlP" runat="server" CssClass="ddl" AutoPostBack="false">
                </asp:DropDownList>
                <asp:Button ID="btnGetProjects" runat="server" Text="Show Projects" CausesValidation="false" OnClick="btnGetProjects_Click" />

                <asp:LinkButton ID="liAccepted" CausesValidation="false" CssClass="li" runat="server" OnClick="liAccepted_Click" ><i class="fa fa-download"></i>Accepted Updates</asp:LinkButton>
                <asp:LinkButton ID="liDeclined" CausesValidation="false" CssClass="li" runat="server" OnClick="liDeclined_Click"><i class="fa fa-download"></i>Declined Updates</asp:LinkButton>
                <asp:LinkButton ID="liBoth" CausesValidation="false" CssClass="li" runat="server" OnClick="liBoth_Click"><i class="fa fa-download"></i>Full Update Chart</asp:LinkButton>

            </div>

            <asp:GridView ID="gvHistory" runat="server" Visible="False" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="StudentProjectname" HeaderText="Project Name" />
                    <asp:BoundField DataField="DU" HeaderText="Update statement" />
                    <asp:BoundField DataField="Reason" HeaderText="Rejection Statement" />
                    <asp:BoundField DataField="Agree" HeaderText="Result" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>

        </div>
    </form>
</body>
<script>
    function popForDownload() {
        document.getElementById("pop").classList.toggle("appear");
    }
</script>
</html>
