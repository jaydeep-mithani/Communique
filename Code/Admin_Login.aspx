<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Login.aspx.cs" Inherits="Communique.Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link type="text/css" rel="stylesheet" href="Admin_Login_Style.css" />
</head>
<body>
    <form id="frmAdminLogin" runat="server">
        <div>
            <h1 id="hATitle">
                <asp:ImageButton CssClass="dl" ID="download" OnClientClick="popForDownload()" runat="server" ImageUrl="Images/Download_Y.png" onmouseover="this.src='Images/PDF_Y.png'" onmouseout="this.src='Images/Download_Y.png'" />
                <span id="ti">Communique</span>
                <asp:Button ID="btnAFacultyLogin" CausesValidation="false" CssClass="btns" runat="server" Text="Login as Faculty" OnClick="btnAFacultyLogin_Click" TabIndex="5" />
                <asp:Button ID="btnAStudentLogin" CausesValidation="false" CssClass="btns" runat="server" Text="Login as a Student" OnClick="btnAStudentLogin_Click" TabIndex="4" />
            </h1>
            <asp:Panel ID="pnlAdminLogin" runat="server" CssClass=".pan">
                <asp:Table ID="tblALogin" runat="server" Height="219px" Width="508px" HorizontalAlign="Center" CaptionAlign="NotSet">
                    <asp:TableRow ID="trA1" runat="server">
                        <asp:TableCell>
                            <asp:Label ID="lblUsername" CssClass="lbl" runat="server" Text="Username "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblAEmialSeperator" CssClass="lbl" runat="server" Text=": "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtAUsername" CssClass="txtField" placeholder="Enter your username" AutoCompleteType="Disabled" runat="server" Width="239px" TabIndex="1"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="rfAUsername" CssClass="valid" ControlToValidate="txtAUsername" ErrorMessage="Please enter your username here!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                            <%--                        <asp:RegularExpressionValidator ID="revAUsername" CssClass="valid" ControlToValidate="txtAUsername" ValidationExpression="^[\s\S]{3,}$" ErrorMessage="The username requires atleast 3 characters!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>--%>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow ID="trA2" runat="server">
                        <asp:TableCell ID="tcAPassword">
                            <asp:Label ID="lblAPassword" CssClass="lbl" runat="server" Text="Password "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblAPasswordSeperator" CssClass="lbl" runat="server" Text=": "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtAPassword" CssClass="txtField" placeholder="Enter the password" TextMode="Password" AutoCompleteType="Disabled" runat="server" Width="239px" TabIndex="2"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="rfAPassword" CssClass="valid" ControlToValidate="txtAPassword" ErrorMessage="Please enter the password here!" ForeColor="#ff66cc" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator CssClass="valid" ID="reUsername" runat="server" ControlToValidate="txtAPassword" ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&+=]).*$" ErrorMessage="The password must contain of minimum 8 characters an uppercase character, lowercase character, a number and a special character!" Display="Dynamic" ForeColor="#ff66cc"></asp:RegularExpressionValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Button ID="btnALogin" CausesValidation="true" CssClass="btns" runat="server" Text="Login" OnClick="btnALogin_Click" TabIndex="3" /><br />
                <br />
            </asp:Panel>
        </div>

        <%----------------------------------------------------------------------------Popup--------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------Popup--------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------Popup--------------------------------------------------------------------------------%>


        <div id="pop" class="faded">

            <asp:ScriptManager ID="smPopup" runat="server">
            </asp:ScriptManager>

            <asp:LinkButton ID="liClose" CssClass="close" runat="server" OnClientClick="popForDownload()" OnClick="liClose_Click"><i class="fa fa-close"></i></asp:LinkButton>

            <asp:TextBox ID="txtU" CssClass="popText" placeholder="username" runat="server" Width="45em"></asp:TextBox>
            <%--<asp:RegularExpressionValidator ValidationGroup="popVal" ID="revE" CssClass="v" ControlToValidate="txtE" ValidationExpression="^\d{12}$" ErrorMessage="Invalid Enrollment number!" ForeColor="#ff0000" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>--%>
            <br />
            <asp:TextBox ID="txtP" CssClass="popText" placeholder="password" TextMode="Password" runat="server" Width="45em"></asp:TextBox>
            <%--<asp:RegularExpressionValidator ValidationGroup="popVal" ID="revP" CssClass="v" ControlToValidate="txtP" ValidationExpression="^[\s\S]{8,}$" ErrorMessage="Password should contain minimum 8 characters!" ForeColor="#ff0000" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>--%>
            <%--<asp:UpdatePanel ID="upPopup" runat="server">
                <ContentTemplate>--%>
            <asp:DropDownList ID="ddlT" OnSelectedIndexChanged="ddlT_SelectedIndexChanged" runat="server" CssClass="ddl" AutoPostBack="true" ClientIDMode="Static">
            </asp:DropDownList>
            <%--                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlF" />
                </Triggers>
            </asp:UpdatePanel>--%>
            <asp:DropDownList ID="ddlF" runat="server" CssClass="ddl" AutoPostBack="false">
            </asp:DropDownList>
            <asp:DropDownList ID="ddlP" runat="server" CssClass="ddl" AutoPostBack="false">
            </asp:DropDownList>

            <asp:LinkButton ID="liAccepted" CausesValidation="false" CssClass="li" runat="server" OnClick="liAccepted_Click"><i class="fa fa-download"></i>Accepted Updates</asp:LinkButton>
            <asp:LinkButton ID="liDeclined" CausesValidation="false" CssClass="li" runat="server" OnClick="liDeclined_Click"><i class="fa fa-download"></i>Declined Updates</asp:LinkButton>
            <asp:LinkButton ID="liBoth" CausesValidation="false" CssClass="li" runat="server" OnClick="liBoth_Click"><i class="fa fa-download"></i>Full Update Chart</asp:LinkButton>

        </div>
        
        <asp:GridView ID="gvHistory" runat="server" Visible="False" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="StudentProjectname" HeaderText="Project name" />
                <asp:BoundField DataField="Technology" HeaderText="Technology" />
                <asp:BoundField DataField="DU" HeaderText="Update Statement" ItemStyle-Width="30em" >
<ItemStyle Width="30em"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Reason" HeaderText="Rejection Statement" ItemStyle-Width="20em" >
<ItemStyle Width="20em"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Agree" HeaderText="Results" />
                <asp:BoundField DataField="FacultyFirstname" HeaderText="Guides First Name" />
                <asp:BoundField DataField="FacultyLastname" HeaderText="Guides Last Name" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>

        <%----------------------------------------------------------------------------Popup--------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------Popup--------------------------------------------------------------------------------%>
        <%----------------------------------------------------------------------------Popup--------------------------------------------------------------------------------%>
    </form>
</body>

<script>
    //document.body.style.zoom = 1.0;
    //var scale = 'scale(1)';
    //document.body.style.webkitTransform = scale;
    //document.body.style.msTransform = scale;
    //document.body.style.transform = scale;

    function popForDownload() {
        document.getElementById("pop").classList.toggle("appear");
    }
</script>

</html>
