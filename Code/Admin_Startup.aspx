<%@ Page Language="C#" MasterPageFile="~/Admin_Panel.Master" AutoEventWireup="true" CodeBehind="Admin_Startup.aspx.cs" Inherits="Communique.Startup" %>

<asp:Content ID="frmStartup" runat="server" ContentPlaceHolderID="head">
    <link rel="stylesheet" type="text/css" href="Admin_Startup_Style.css" />
    <
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="mstStartup">
        <asp:Label ID="lblWelcome" CssClass="wl" runat="server" text="Hola Admin!!"></asp:Label>
        <asp:Label ID="lblAP" CssClass="wlA" runat="server" text="Communique welcomes you."></asp:Label>
        <br /><br />
        <script src="Admin_Startup_Counter.js"></script>
        <div class="item-animate">
            <span class="gap"></span>
            <asp:HyperLink ID="stu" CssClass="linkStu" runat="server" NavigateUrl="~/Admin_fullRecord_Student.aspx"><asp:Label ID="lblSC" CssClass="SC" runat="server" Text="0"></asp:Label>
            <asp:Label ID="lblS" CssClass="S" runat="server" Text="Students"></asp:Label></asp:HyperLink>
            <span class="seperate"></span>
            <asp:HyperLink ID="fac" CssClass="linkFac" runat="server" NavigateUrl="~/Admin_fullRecord_Faculty.aspx"><asp:Label ID="lblFC" CssClass="FC" runat="server" Text="0"></asp:Label>
            <asp:Label ID="lblF" CssClass="F" runat="server" Text="Faculties"></asp:Label></asp:HyperLink>
            <asp:HiddenField ID="hndStudents" runat="server" />
            <asp:HiddenField ID="hndFaculties" runat="server" />
        </div>
        <script>
            $({ countNum: $('.SC').html() }).animate({ countNum: document.getElementById('<%= hndStudents.ClientID %>').value },
                {
                    duration: 4000,
                    easing: 'linear',
                    step: function () {
                        $('.SC').html(Math.floor(this.countNum));
                    },
                    complete: function () {
                        $('.SC').html(this.countNum);
                        //alert('finished');
                    }
                });
            $({ countNum: $('.FC').html() }).animate({ countNum: document.getElementById('<%= hndFaculties.ClientID %>').value },
                {
                    duration: 1000,
                    easing: 'linear',
                    step: function () {
                        $('.FC').html(Math.floor(this.countNum));
                    },
                    complete: function () {
                        $('.FC').html(this.countNum);
                        //alert('finished');
                    }
                });
        </script>
   </div>
</asp:Content>
