<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignOut.aspx.cs" Inherits="AspDotNetProject.SignOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="jumbotron">
        <div class="display-1">You have logged out.You will have to
            <asp:Hyperlink ID="link1" runat="server" text="re-login"
                navigativeUrl="~/SignInForm.aspx" /> to access the site.
        </div>
    </section>
</asp:Content>
