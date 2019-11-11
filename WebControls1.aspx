<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebControls1.aspx.cs" Inherits="AspDotNetProject.WebControls1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--m-1 =>margin,ml-,mr-,mt,-mb-,mx-(ml+mr),my-(mt+mb)
    p-1=>padding,pl,pr,pr-,pt-,pb-,px-,py-
    p|m-[1-5]
    width ->  w-25,w-50,w-75,w-100,height-h-25,h-50,h-75,h-100--%>
    <asp:Literal ID="literal1" runat="server" />
        <section class="card shadow mx-5">
        <div class="card-header card-title text-center">Application Form</div>
        <div class="card-body">
            <%--Username --%>
            <div class="form-group form-row">
                <div class="col-3 offset-2 text-right">
                    <asp:Label ID="lbl1" runat="server" Text="Name : "></asp:Label>

                </div>
                <div class="col-5 text-left">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <%--Password --%>
            <div class="form-group form-row">
                <div class="col-3 offset-2 text-right">
                    <asp:Label ID="lbl2" runat="server" Text="Password : "></asp:Label>
                </div>
                <div class="col-5 text-left">
                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

 

            <%--Address --%>
            <div class="form-group form-row">
                <div class="col-3 offset-2 text-right">
                    <asp:Label ID="lbl3" runat="server" Text="Address : "></asp:Label>
                </div>
                <div class="col-5 text-left">
                    <asp:TextBox ID="txtAdd" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <%--Gender --%>
            <div class="form-group form-row">
                <div class="col-3 offset-2 text-right">
                    <asp:Label ID="lbl4" runat="server" Text="Gender : "></asp:Label>
                </div>
                <div class="col-5 text-left">
                    <asp:RadioButton ID="Radio1" runat="server" GroupName="Gender" Text="Male" />
                    <asp:RadioButton ID="Radio2" runat="server" GroupName="Gender" Text="FeMale" />
                </div>
            </div>

            <%--Location --%>
            <div class="form-group form-row">
                <div class="col-3 offset-2 text-right">
                    <asp:Label ID="lbl5" runat="server" Text="Location : "></asp:Label>
                </div>
                <div class="col-5 text-left">
                    <asp:DropDownList ID="location1" runat="server" CssClass="form-control">
                        <asp:ListItem Text="---Select---" Value="0" Selected="true" />
                        <asp:ListItem Text="Bengaluru" Value="Bengaluru" />
                        <asp:ListItem Text="Mysuru" Value="Mysuru" />
                        <asp:ListItem Text="Hyderabad" Value="0" />
                        <asp:ListItem Text="Delhi" Value="0" />
                    </asp:DropDownList>
                </div>
            </div>

            <%--Interests/Hobbies --%>
            <div class="form-group form-row">
                <div class="col-3 offset-2 text-right">
                    <asp:Label ID="Label1" runat="server" Text="Interests : "></asp:Label>
                </div>
                <div class="col-5  text-left">
                    <asp:CheckBoxList ID="ChkInterests" runat="server" RepeatColumns= "2"
                        RepeatDirection="Horizontal" RepeatLayout="Table"
                        CssClass="table table-sm table-striped">
                    </asp:CheckBoxList>
                </div>
            </div>
        </div>
             <div class="col-2 offset-3 text-right">
            <div class="form-row">
                <div class="col-4 offset-4 btn-group-lg text-center">
                    <asp:Button ID="BtnSave" runat="server" Text="Save" CssClass="btn btn-primary mx-2" OnClick="btnSave_Click"/>
                    <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="btn btn-primary mx-2"/>
                </div>
            </div>




        </div>
    </section>
</asp:Content>