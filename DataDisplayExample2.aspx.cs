using AspDotNetProject.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspDotNetProject
{
    public partial class DataDisplayExample2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                PopulateData();
            }
        }
        string connectionString = "server=KALIDASA\\SQLDEV2016;database=Northwind;integrated security=sspi";
        string sql = "SELECT CustomerId,CompanyName,ContactName,City,Country from Customers";
        DataSet ds;
        SqlDataAdapter adapter;
        string tableName = "Customers";

        private void PopulateData()
        {
            //if (adapter == null)
            //{
            //    adapter = new SqlDataAdapter(sql, connectionString);
            //    if (ds == null) ds = new DataSet();
            //    adapter.Fill(ds, tableName);
            //    this.reapeter1.DataSource = ds;
            //    reapeter1.DataMember = tableName;
            //    reapeter1.DataBind();
            //}
            CustomerDataAccess dataAccess = new CustomerDataAccess();
            var list = dataAccess.GetCustomer();
            reapeter1.DataSource = list;
            reapeter1.DataBind();
        }

        protected void reapeter1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string custId = e.CommandArgument.ToString();
            if(e.CommandName=="View")
            {
                Response.Redirect("CustomerDetails.aspx?ID=" + custId);
            }
        }
    }
}
        