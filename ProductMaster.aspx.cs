using AspDotNetProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspDotNetProject
{
    public partial class ProductMaster : System.Web.UI.Page
    {
#region Private Helper Methods
        private void InitializePage()
        {
            txtSearch.Text = string.Empty;
            FetchProductDate();
        }
        private void FetchProductDate()
        {
            if (Cache["productList"] == null) //Hashtable
            {
                try
                {
                    productProcess process = new productProcess();
                    //   var list = process.GetProductSearchProcess(txtSearch.Text);
                    var list = process.GetProducts(txtSearch.Text);
                    Cache["productList"] = list;
                    this.grid1.DataSource = list;
                    this.grid1.DataBind();
                }
                catch (Exception)
                {
                    throw;
                }
            }
            else
            {
                var list = Cache["productList"] as List<Product>;
                this.grid1.DataSource = list;
                this.grid1.DataBind();
            }
        }
#endregion
        #region Page Event Handler
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                InitializePage();
            //Design ->GridView AutoGeneratecolumns=false
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
             txtSearch.Text = string.Empty;
            FetchProductDate();
        }

        protected void btnSubmit1_Click(object sender, EventArgs e)
        {
            FetchProductDate();
            
            
        }

        protected void btnCreateView1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("CreateProduct.aspx");
        }
        #endregion

        protected void grid1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grid1.PageIndex = e.NewPageIndex;
            FetchProductDate();
        }

        protected void grid1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            string id = this.grid1.DataKeys[e.NewEditIndex].Value.ToString();
            Response.Redirect("UpdateProduct.aspx?id="+id);
        }
    }
}