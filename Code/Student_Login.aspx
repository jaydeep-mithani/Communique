<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Login.aspx.cs" Inherits="Communique.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Login</title>
    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link type="text/css" rel="stylesheet" href="Student_Login_Style.css" />
</head>
<body>
    <div id="dImg" class="main">
        <form id="frmStudentLogin" runat="server">

            <h1 id="hTitle">
                <asp:ImageButton ID="download" OnClientClick="popForDownload()" runat="server" ImageUrl="Images/Download_G.png" onmouseover="this.src='Images/PDF_G.png'" onmouseout="this.src='Images/Download_G.png'" />
                <span id="ti">Communique</span>
                <asp:Button ID="btnAdminLogin" CausesValidation="false" CssClass="btns" runat="server" Text="Login as Admin" OnClick="btnAdminLogin_Click" TabIndex="5" />
                <asp:Button ID="btnFacultyLogin" CausesValidation="false" CssClass="btns" runat="server" Text="Login as Faculty" TabIndex="5" OnClick="btnFacultyLogin_Click1" />
            </h1>
            <asp:Table ID="tbllogin" runat="server" Height="219px" Width="508px" HorizontalAlign="Center" CaptionAlign="NotSet">
                <asp:TableRow ID="tr1" runat="server">
                    <asp:TableCell>
                        <asp:Label ID="lblEnrollment" CssClass="lbl" runat="server" Text="Enrollment No. "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblEnrollmentSeperator" CssClass="lbl" runat="server" Text=": "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtEnrollment" CssClass="txtField" placeholder="Enter your Enrollment number" AutoCompleteType="Disabled" runat="server" Width="239px" TabIndex="1"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfEnrollment" CssClass="valid" ControlToValidate="txtEnrollment" ErrorMessage="Please enter your enrollment no here!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEnrollment" CssClass="valid" ControlToValidate="txtEnrollment" ValidationExpression="^\d{12}$" ErrorMessage="Invalid enrollment number!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow ID="tr2" runat="server">
                    <asp:TableCell ID="tcPassword">
                        <asp:Label ID="lblPassword" CssClass="lbl" runat="server" Text="Password "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblPasswordSeperator" CssClass="lbl" runat="server" Text=": "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtPassword" CssClass="txtField" placeholder="Enter the password" TextMode="Password" AutoCompleteType="Disabled" runat="server" Width="239px" TabIndex="2"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="rfPassword" CssClass="valid" ControlToValidate="txtPassword" ErrorMessage="Please enter the password here!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPassword" CssClass="valid" ControlToValidate="txtPassword" ValidationExpression="^[\s\S]{8,}$" ErrorMessage="Password should contain minimum 8 characters!" ForeColor="#ae00ff" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Button ID="btnLogin" CausesValidation="true" CssClass="btns" runat="server" Text="Login" TabIndex="3" OnClick="btnLogin_Click1" /><br />
            <br />

            <%--<asp:LinkButton ID="liSignup" CausesValidation="false" runat="server" Text="Don't have an account? Click here to signup now." TabIndex="4" OnClick="liSignup_Click"></asp:LinkButton>--%>

            <br />
            <asp:Label ID="lblError" runat="server" ForeColor="Red" Text="Error" Visible="False"></asp:Label>
            <%-- |-----------------------------------------------------------------------popup structure----------------------------------------------------------------------| --%>
            <%-- |-----------------------------------------------------------------------popup structure----------------------------------------------------------------------| --%>
            <%-- |-----------------------------------------------------------------------popup structure----------------------------------------------------------------------| --%>
            <div id="pop" class="faded">
                <asp:LinkButton ID="liClose" CssClass="close" runat="server" OnClientClick="popForDownload()" OnClick="liClose_Click"><i class="fa fa-close"></i></asp:LinkButton>

                <asp:TextBox ID="txtE" CssClass="popText" placeholder="enrollment number" runat="server" Width="45em"></asp:TextBox>
                <%--<asp:RegularExpressionValidator ValidationGroup="popVal" ID="revE" CssClass="v" ControlToValidate="txtE" ValidationExpression="^\d{12}$" ErrorMessage="Invalid Enrollment number!" ForeColor="#ff0000" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>--%>
                <br />
                <asp:TextBox ID="txtP" CssClass="popText" placeholder="password" TextMode="Password" runat="server" Width="45em"></asp:TextBox>
                <%--<asp:RegularExpressionValidator ValidationGroup="popVal" ID="revP" CssClass="v" ControlToValidate="txtP" ValidationExpression="^[\s\S]{8,}$" ErrorMessage="Password should contain minimum 8 characters!" ForeColor="#ff0000" Display="Dynamic" runat="server"></asp:RegularExpressionValidator>--%>
                <asp:LinkButton ID="liAccepted" CausesValidation="false" CssClass="li" runat="server" OnClick="liAccepted_Click"><i class="fa fa-download"> </i>Accepted Updates</asp:LinkButton>
                <asp:LinkButton ID="liDeclined" CausesValidation="false" CssClass="li" runat="server" OnClick="liDeclined_Click"><i class="fa fa-download"> </i>Declined Updates</asp:LinkButton>
                <asp:LinkButton ID="liBoth" CausesValidation="false" CssClass="li" runat="server" OnClick="liBoth_Click"><i class="fa fa-download"> </i>Full Update Chart</asp:LinkButton>
            </div>

            <asp:GridView ID="gvHistory" runat="server" AutoGenerateColumns="False" HorizontalAlign="Justify" AllowSorting="True" CurrentSordDirection="DES" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="DU" ItemStyle-Width="50em" HeaderText="Submitted Data" HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center" >
<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle HorizontalAlign="Center" Width="50em"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Reason" ItemStyle-Width="25em" HtmlEncode="false" HeaderText="Reasult Reason" HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-Height="4em" ItemStyle-Height="3.5em" >
<HeaderStyle Font-Bold="True" Height="4em"></HeaderStyle>

<ItemStyle HorizontalAlign="Center" Height="3.5em" Width="25em"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Agree" HtmlEncode="false" HeaderText="Results" HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center" >
<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <%--<asp:TemplateField HeaderText="Result" HeaderStyle-BackColor="#68ff00" HeaderStyle-BorderColor="#68ff00" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Gray" ItemStyle-HorizontalAlign="Center" HeaderStyle-Height="4em" ItemStyle-Height="3.5em">
                        <ItemTemplate><%# (Boolean.Parse(Eval("Agree").ToString())) ? "Accepted" : "Declined" %></ItemTemplate>
                    </asp:TemplateField>--%>
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

            <%-- |-----------------------------------------------------------------------popup structure----------------------------------------------------------------------| --%>
            <%-- |-----------------------------------------------------------------------popup structure----------------------------------------------------------------------| --%>
            <%-- |-----------------------------------------------------------------------popup structure----------------------------------------------------------------------| --%>
        </form>
    </div>
</body>

<script>

    //var e;
    //var eExp = /(?:\D|^)(\d{12})(?:\D|$)/;//new RegExp("([^\d])\d{12}([^\d])");
    //var p;

    function popForDownload() {
        //alert("Function entered............................................................................................................................");
        document.getElementById("pop").classList.toggle("appear");
    }
</script>

</html>
