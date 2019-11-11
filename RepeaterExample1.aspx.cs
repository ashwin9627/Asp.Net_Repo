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
    public partial class RepeaterExample1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
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
            if(adapter==null)
            {
                adapter = new SqlDataAdapter(sql, connectionString);
                if (ds == null) ds = new DataSet();
                adapter.Fill(ds, tableName);
                this.repeater1.DataSource = ds;
                repeater1.DataMember = tableName;
                repeater1.DataBind();
            }
        }
    }
}