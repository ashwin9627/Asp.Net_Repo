<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignInForm.aspx.cs" Inherits="AspDotNetProject.SignInForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--SignIn Form--%>

   <%-- <section class="container text-center">

        <asp:Login ID="Login1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" OnAuthenticate="Login1_Authenticate">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
            <TextBoxStyle Font-Size="0.8em" />
            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        </asp:Login>

    </section>--%>


      <section class="container">

        <section class="row">
            <section class="col-4 offset-1">
                <%--<asp:Login ID="Login1" runat="server"
                    BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" OnAuthenticate="Login1_Authenticate">
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                    <TextBoxStyle Font-Size="0.8em" />
                    <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                </asp:Login>--%>
                <section class="card shadow m-2">
                    <section class="card-header card-title text-center bg-primary text-white h3">Sign In</section>
                    <section class="card-body">
                        <div class="form-group">
                            <asp:Label ID="lbl1" runat="server" CssClass="col-form-label" Text="User name" />
                            <asp:TextBox ID="txtUserId" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lbl2" runat="server" CssClass="col-form-label" Text="Password" />
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" />
                        </div>
                        <div class="btn btn-group btn-group-lg">
                                <asp:LinkButton ID="btnSignIn" runat="server" CssClass="btn btn-danger mx-1" OnClick="btnSignIn_Click">
                            <i class="fa fa-sign-in"> </i> Sign in
                                </asp:LinkButton>
                               

                            </div>
                    </section>
                </section>
            </section>
            <section class="col-1">
                <div class="display-4 text-success align-baseline">OR</div>
            </section>
            <section class="col-4 align-self-end">
                <div class="card shadow m-2">
                    <div class="card-header card-title bg-warning text-dark h3">
                        Register
                    </div>
                    <div class="card-body">
                        <div class=" pl-5 form-row">
                            <div class="input-group my-1">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa fa-user" title="User name"></i></span>
                                </div>
                                <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" placeholder="Username" />
                            </div>
                            <div class="input-group my-1">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa fa-hashtag"></i></span>
                                </div>
                                <asp:TextBox ID="txtPwd" runat="server" CssClass="form-control" placeholder="Password" />
                            </div>
                            <div class="input-group my-1">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa fa-hashtag"></i></span>
                                </div>
                                <asp:TextBox ID="txtConfirm" runat="server" CssClass="form-control" placeholder="Confirm Password" />
                            </div>
                            <div class="input-group my-1">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa fa-at"></i></span>
                                </div>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" />
                            </div>
                            <div class="input-group my-1">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa fa-question" title="Security Question"></i></span>
                                </div>
                                <asp:TextBox ID="txtQuestion" runat="server" CssClass="form-control" placeholder="Security Question" />
                            </div>
                            <div class="input-group my-1">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa fa-reply" title="Security Answer"></i></span>
                                </div>
                                <asp:TextBox ID="txtAnswer" runat="server" CssClass="form-control" placeholder="Security Answer" />
                            </div>
                            <asp:Panel ID="pnlErrors" runat="server" CssClass="alert alert-danger" Visible="false">
                                <asp:Literal ID="litErrors" runat="server" />
                            </asp:Panel>
                            <div class="btn btn-group btn-group-lg">
                                <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-success mx-1" OnClick="btnSave_Click">
                            <i class="fa fa-save"> </i> Save
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn btn-secondary mx-1" OnClick="btnCancel_Click">
                            <i class="fa fa-remove"> </i> Cancel
                                </asp:LinkButton>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </section>


    </section>

</asp:Content>
