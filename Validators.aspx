<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Validators.aspx.cs" Inherits="AspDotNetProject.Validators" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function myValidation(s, e)
        {
            if (e.Value.length > 4) {
                e.IsValid = true;
            }
            else {
                e.IsValid = false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container">
        <h2 class="bg-success text-white font-weight-bold text-center">Working with Validators</h2>
    <asp:ValidationSummary ID="sum1" runat="server" DisplayMode="List"
        ShowSummary="true" CssClass="alert alert-danger" HeaderText="Errors"/>
        <div class="row">
        <div class="col-3 p-2">
            <div class="card h-100"> 
                <div class="card-header card-title bg-warning">Require Field Validatior</div>
                <div class="card-body">
                    <div class="form-group">
                        <asp:Textbox id="txtName" class="form-control" runat="server" placeholder="Enter name"/>
                        <asp:RequiredFieldValidator ID="rfv1" runat="server"
                            ControlToValidate="txtName" Display="Static" Text="*"
                            ErrorMessage="Name is required"
                            CssClass="text-danger"/>
                    </div>
                </div>
            </div>
        </div>

           <div class="col-3 p-2">
                <div class="card mb-5 h-100">
                    <div class="card-header card-title bg-warning">Compare Validator</div>
                    <div class="card-body">
                        <div class="form-group">
                            <asp:TextBox ID="txtPwd" Cssclass="form-control" runat="server"
                                placeholder="Enter Password"/>
                            <asp:TextBox ID="txtConfirm" Cssclass="form-control" runat="server"
                                placeholder="Confirm Password"  />
                            <asp:CompareValidator ID="cv1" runat="server"
                                ControlToValidate="txtConfirm" Display="Static" Text="*"
                                CssClass=" text-danger" ErrorMessage="Password Doesnot match" ControlToCompare="txtPwd"
                                Operator="Equal" Type="String"/>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-3 p-2">
                <div class="card h-100">
                    <div class="card-header card-title bg-warning">Compare Validator 2</div>
                    <div class="card-body">
                        <div class="form-group">
                            <asp:TextBox ID="txtDate" Cssclass="form-control" runat="server"
                                placeholder="Enter Date"  />
                           
                            <asp:CompareValidator ID="CompareValidator2" runat="server"
                                ControlToValidate="txtDate" Display="Static" Text="*"
                                CssClass=" text-danger" ErrorMessage="Invalid Date"
                                Operator="DataTypeCheck" Type="Date"/>
                        </div>
                    </div>
                </div>
            </div>

          <div class="col-3 p-2">
                <div class="card h-100 ">
                    <div class="card-header card-title bg-warning">Range Validator</div>
                    <div class="card-body">
                        <div class="form-group">
                            <asp:TextBox ID="txtRange" Cssclass="form-control" runat="server"
                                placeholder="Enter Date"  />
                           
                            <asp:RangeValidator ID="RangeValidator1" runat="server"
                                ControlToValidate="txtRange" Display="Static" Text="*"
                                CssClass=" text-danger" ErrorMessage="Age should be betweeen 18 and 100"
                                Operator="DataTypeCheck" Type="Integer" MinimumValue="18" MaximumValue="100"/>
                        </div>
                    </div>
                </div>
            </div>


              <div class="col-3 p-2">
                <div class="card h-100">
                    <div class="card-header card-title bg-warning">Regular Expression Validator</div>
                    <div class="card-body">
                        <div class="form-group">
                            <asp:TextBox ID="txtEmail" Cssclass="form-control" runat="server"
                                placeholder="Enter Email"  />
                           
                            <asp:RegularExpressionValidator ID="reg1" runat="server"
                                ControlToValidate="txtEmail" Display="Static" Text="*"
                                CssClass=" text-danger" ErrorMessage="Invalid Email format"
                                 ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"/>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-3 p-2">
                <div class="card h-100">
                    <div class="card-header card-title bg-warning">Custom Validator</div>
                    <div class="card-body">
                        <div class="form-group">
                            <asp:TextBox ID="txtUserId" Cssclass="form-control" runat="server"
                                placeholder="Enter a valid User ID"  />
                           
                            <asp:CustomValidator ID="cv3" runat="server"
                                ControlToValidate="txtUserId" Display="Static" Text="*"
                                CssClass=" text-danger" ErrorMessage="User ID should be 5 or more letters and non existant"
                                 ClientValidationFunction="myValidation"
                                OnServerValidate="cv3_ServerValidate" />
                        </div>
                    </div>
                </div>
            </div>

        </div>
                  
              
    <div class="row">
        <div class="col-12 text-center">
            <button class="btn btn-outline-danger">Submit</button>
        </div>
    </div>
    
    </section>

</asp:Content>
