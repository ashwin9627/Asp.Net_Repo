using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace AspDotNetProject
{
    //Partial  class is a class which is spread across physical files
    public partial class FirstPage:System.Web.UI.Page
    {
        protected TextBox txt1;
    public void page_Load(object sender, EventArgs e)
        {
            //Page_Init,Page_load,Page_Prerender,Page_Unload,Page_Disposed

            //public delegate void EventHandler(object sender,EventArgs e) //button or textbox is a sender and eventArgs e is aditional data
            if (!IsPostBack)
                this.txt1.Text = "Enter your name here";
        }
        protected override void OnInit(EventArgs e)
        {
            this.Load += new EventHandler(page_Load);
            base.OnInit(e);
        }
        public void btn1_Click(object sender, EventArgs e)
        {
            this.txt1.Text = this.txt1.Text.ToUpper();
        }

    }
}