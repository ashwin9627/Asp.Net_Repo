<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DataListExample1.aspx.cs" Inherits="AspDotNetProject.DataListExample1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <section class="container">
        <div class="h2 bg-success text-white">DataList Example</div>
            <div class="col">
                <asp:DataList id="dataList1" runat="server" OnItemCommand="dataList1_ItemCommand"
                    DataKeyField="CustomerId"
                    OnEditCommand="dataList1_EditCommand"
                    OnUpdateCommand="dataList1_UpdateCommand"
                    OnDeleteCommand="dataList1_DeleteCommand"
                    OnCancelCommand="dataList1_CancelCommand"
                    RepeatColumns="4" RepeatDirection="horizontal" RepeatLayout="Table">
                        <HeaderTemplate>
                        
                        <h4 class="bg-dark text-light p-2">Customer List</h4>
                        <div class="row">
                    </HeaderTemplate>
                    <FooterTemplate>
                        </div>
                         <h6 class="bg-dark text-light p-2">End of List</h6>
                    </FooterTemplate>
                    <ItemTemplate>
                        <div class="border m-0 p-2">
                            The Customer <%# DataBinder.Eval(Container.DataItem,"CompanyName") %>
                        ,represented by <%# DataBinder.Eval(Container.DataItem,"ContactName") %>
                        is located in <%# DataBinder.Eval(Container,"DataItem.City") %>
                        <%# DataBinder.Eval(Container,"DataItem.Country") %>
                         <br />
                            <div class="mt-2 mb-2 d-flex">
                              <asp:LinkButton ID="editLink1" runat="server" Text="Modify"
                                CommandName="Edit"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem,"CustomerId") %>'
                                CssClass="btn btn-outline-danger btn-sm w-50"></asp:LinkButton>
                        <asp:LinkButton ID="link1" runat="server"
                            CssClass="btn btn-outline-primary btn-dark btn-sm w-50" Text="View Details"
                            CommandName="View"
                            CommandArgument='<%# DataBinder.Eval(Container.DataItem,"CustomerId") %>' />
         </div>
                            </div>
                            </ItemTemplate>
                    <AlternatingItemTemplate>
                        <div class="bg-light">
                              The Customer <%# DataBinder.Eval(Container.DataItem,"CompanyName") %>
                        ,represented by <%# DataBinder.Eval(Container.DataItem,"ContactName") %>
                        is located in <%# DataBinder.Eval(Container,"DataItem.City") %>
                        <%# DataBinder.Eval(Container,"DataItem.Country") %>
                        <br />
                            <div class="mt-2 mb-2 d-flex">
                            <asp:LinkButton ID="editLink1" runat="server" Text="Modify"
                                CommandName="Edit"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem,"CustomerId") %>'
                                CssClass="btn btn-outline-danger btn-sm w-50"></asp:LinkButton>
                        <asp:LinkButton ID="link1" runat="server"
                            CssClass="btn btn-outline-primary btn-sm w-50" Text="View Details"
                            CommandName="View"
                            CommandArgument='<%# DataBinder.Eval(Container.DataItem,"CustomerId") %>' />
                        </div>
                </AlternatingItemTemplate>

                    <EditItemTemplate>
                        <table class="table table-sm">
                            <tr>
                                <td>Company</td>
                                <td>
                                    <asp:TextBox ID="txtCompany" runat="server"
                                        text='<%# DataBinder.Eval(Container.DataItem,"CompanyName") %>'
                                        CssClass="form-control" />
                                       </td>
                                </tr>
                              <tr>
                                <td>Contact</td>
                                <td>
                                    <asp:TextBox ID="txtContact" runat="server"
                                        text='<%# DataBinder.Eval(Container.DataItem,"ContactName") %>'
                                        CssClass="form-control" />
                                       </td>
                                </tr>
                            <tr>
                                <td>City</td>
                                <td>
                                    <asp:TextBox ID="txtCity" runat="server"
                                        text='<%# DataBinder.Eval(Container.DataItem,"City") %>'
                                        CssClass="form-control" />
                                       </td>
                                </tr>
                          <tr>
                                <td>Country</td>
                                <td>
                                    <asp:TextBox ID="txtCountry" runat="server"
                                        text='<%# DataBinder.Eval(Container.DataItem,"Country") %>'
                                        CssClass="form-control" />
                                       </td>
                                </tr>
                          
                                <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update"
                                        CommandName="Update" CssClass="btn btn-sm btn-success" />
                                
                                    <asp:Button ID="btnCancel" runat="server" Text="Discard"
                                        CommandName="Cancel" CssClass="btn btn-sm btn-secondary" />
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
</asp:DataList>
        </div>
        
    </section>
</asp:Content>
