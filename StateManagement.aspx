<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StateManagement.aspx.cs" Inherits="AspDotNetProject.StateManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <section class="container" >
        <h2 class="bg-success text-white text-center">State Management</h2>
        <hr />
        <%--Application Counter:=--%><asp:Label ID="lblApplication" runat="server" />
        <br />
        <%--Session Counter:= --%>
        <asp:Label ID="lblSession" runat="server" Font-Bold="true" />
        <br />
        <hr />
     <%--  <%= %>
       <%int d1=10; %>
       <%$ D %>
 --%>

        <div style="border 1px solid black;">
            <div style="background-color:deepskyblue; color:white;font-weight:bold;
                padding:2px;width:100%;border-bottom:1px solid black">
                Working with Cookies

 

            </div>
                <div style="padding:10px;">
                    <asp:Label ID="lblName" runat="server" Text="Cookie Name:" Width="150px" />
                    <asp:TextBox ID="txtName" runat="server" BorderColor="Wheat" BorderStyle="Dotted"
                        BorderWidth="2px"></asp:TextBox>
                    <br />

 

                     <asp:Label ID="lblValue" runat="server" Text="Cookie Value:" Width="150px" />
                    <asp:TextBox ID="txtValue" runat="server" BorderColor="Wheat" BorderStyle="Dotted"
                        BorderWidth="2px"></asp:TextBox>
                    <br />

 

                     <asp:Label ID="btnStore1" runat="server" Text="Store Cookies" Width="150px" />
                    <asp:button ID="btnStore" runat="server" Text="ButtonStore" BorderColor="YellowGreen" BorderStyle="Groove"
                        BorderWidth="1px" onclick="btnStore_Click1" BackColor="#0099CC" ForeColor="#66FF66"></asp:button>
                    <asp:Button ID="btnRetrives" runat="server" Text="Retrive Cookies" OnClick="btnRetrives_Click" BackColor="#00CC66" ForeColor="#FF6699" />
                    <asp:Button ID="Button2" runat="server" Text="Button" />
                    <br />
                    <br />
                    <asp:Label ID="LblMessage" runat="server" Text="" BackColor="#0066FF" ForeColor="#FF99CC"></asp:Label>
                    <br />
                </div>    
        </div>
    </section>

</asp:Content>
