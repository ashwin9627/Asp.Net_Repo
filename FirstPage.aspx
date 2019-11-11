<%--<%@ page Language="C#" %>--%>
<%@ Page Language="C#" AutoEventWireup="false"
    CodeBehind="FirstPage.aspx.cs" inherits="AspDotNetProject.FirstPage" %>  <%--if it is false all events are state as false,--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
<script runat = "server" >
    </script>
</head>
<body>
    <h1>Welcome to Asp.Net Application</h1>
    <form runat="server">
<%--        
<label for="username">User name :</label>
        <input type="text" name="username"/>
        <br />
        <label for="password">Password :</label>
        <input type="password" name="password" />
        <button type="button">Submit</button>
--%>
<asp:Label id="lbl1" runat="server" Text="User name:"/>
<asp:TextBox id="txt1" runat="server" />
<br/>
<asp:Label id="lbl2" runat="server" Text="Password:"/>
<asp:TextBox id="txt2" runat="server" TextMode="Password" />
<br/>
<asp:Button id="btn1" runat="server" Text="Submit" Onclick="btn1_Click" />
    </form>
</body>
</html>