<%@ Page Language="C#" MasterPageFile="~/Admin_Panel.Master" AutoEventWireup="true" CodeBehind="Admin_fullRecord_Faculty.aspx.cs" Inherits="Communique.Admin_fullRecord_Faculty" %>

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
    <link rel="stylesheet" type="text/css" href="Admin_fullRecord_Student_Style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="con">
        <br /><br />
        <div id="data">
            <asp:GridView CssClass="view" ID="gvStudentShow" runat="server" AlternatingRowStyle-CssClass="altR" AutoGenerateColumns="false" HorizontalAlign="Justify" >
                <Columns>
                    <%--<asp:BoundField DataField="StudentEnrollment" ItemStyle-Width="9em" HeaderText="Enrollment Number" HeaderStyle-BackColor="#FFF200" HeaderStyle-BorderColor="#FFF200" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Black" ItemStyle-HorizontalAlign="Center" HeaderStyle-Height="4em"  ItemStyle-Height="3.5em" />--%>
                    <asp:BoundField DataField="FacultyFirstname" ItemStyle-Width="9.5em" HeaderText="First Name" HeaderStyle-BackColor="#FFF200" HeaderStyle-BorderColor="#FFF200" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Black" ItemStyle-HorizontalAlign="Center" HeaderStyle-Height="4em" ItemStyle-Height="3.5em" />
                    <asp:BoundField DataField="FacultyLastname" ItemStyle-Width="9.5em" HeaderText="Last Name" HeaderStyle-BackColor="#FFF200" HeaderStyle-BorderColor="#FFF200" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Black" ItemStyle-HorizontalAlign="Center" />
                    <%--<asp:BoundField DataField="StudentProjectname" ItemStyle-Width="12em" HeaderText="Project Name" HeaderStyle-BackColor="#FFF200" HeaderStyle-BorderColor="#FFF200" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Black" ItemStyle-HorizontalAlign="Center" />--%>
                    <asp:BoundField DataField="FacultyTechleader" ItemStyle-Width="6em" HeaderText="Guided by" HeaderStyle-BackColor="#FFF200" HeaderStyle-BorderColor="#FFF200" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Black" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="FacultyPassword" ItemStyle-Width="10em" HeaderText="Password" HeaderStyle-BackColor="#FFF200" HeaderStyle-BorderColor="#FFF200" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Black" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="FacultyEmail" ItemStyle-Width="15em" HeaderText="Email Address" HeaderStyle-BackColor="#FFF200" HeaderStyle-BorderColor="#FFF200" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Black" ItemStyle-HorizontalAlign="Center" />
                    <%----<asp:BoundField DataField="StudentGroup" ItemStyle-Width="0.1em" HeaderText="Group Number" HeaderStyle-BackColor="#FFF200" HeaderStyle-BorderColor="#FFF200" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Black" ItemStyle-HorizontalAlign="Center" />
                    --<asp:BoundField DataField="StudentBatch" ItemStyle-Width="5.5em" HeaderText=" Batch " HeaderStyle-BackColor="#FFF200" HeaderStyle-BorderColor="#FFF200" HeaderStyle-ForeColor="Black" HeaderStyle-Font-Bold="true" ItemStyle-BorderColor="Black" ItemStyle-HorizontalAlign="Center" />--%>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>