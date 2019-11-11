using AspDotNetProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspDotNetProject
{
    public partial class DataListExample1 : System.Web.UI.Page
    {       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                PopulateData();
        }
        private void PopulateData()
        {
            CustomerDataAccess dataAccess = new CustomerDataAccess();
            var list = dataAccess.GetCustomer();
            dataList1.DataSource = list;
            dataList1.DataBind();
        }

        protected void dataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            if (e.CommandName == "View")
            {
                Response.Redirect("CustomerDetails.aspx?ID=" + id);
            }
            //else if(e.CommandName=="Edit")
            //    {
            //    Response.Redirect("");
            //}

        }

        protected void dataList1_EditCommand(object source, DataListCommandEventArgs e)
        {
            //enables the edit item template for the selected row
            dataList1.EditItemIndex = e.Item.ItemIndex;  //returns the row number
            PopulateData();
        }

        protected void dataList1_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            string custId = dataList1.DataKeys[e.Item.ItemIndex].ToString();
            string company = ((TextBox)e.Item.FindControl("txtCompany")).Text;
            string contact = ((TextBox)e.Item.FindControl("txtContact")).Text;
            string city = ((TextBox)e.Item.FindControl("txtCity")).Text;
            string country = ((TextBox)e.Item.FindControl("txtCountry")).Text;

            //Response.Write("Company:"+company);
            Customer obj = new Customer
            {
                CustomerId = custId,
                CompanyName = company,
                ContactName = contact,
                City = city,
                Country = country

            };
            try
            {
                CustomerDataAccess dataAccess = new CustomerDataAccess();
                dataAccess.UpdateCustomer(obj);
            }
            catch(Exception ex)
            {
                throw ex;
            }

            //De - select EditItemTemplate by resetting the EditItemIndex to -1
            dataList1.EditItemIndex = -1;
            PopulateData();
        }

        protected void dataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {

        }

        protected void dataList1_CancelCommand(object source, DataListCommandEventArgs e)
        {

        }
    }
}