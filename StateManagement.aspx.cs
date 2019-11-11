using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspDotNetProject
{
    public partial class StateManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Application.Lock();
            int counter = Convert.ToInt32(Application["counter"]);
            counter++;
            lblApplication.Text = counter.ToString();
            Application["counter"] = counter;
            Application.UnLock();



            counter = Convert.ToInt32(Session["counter"]);
            counter++;
            lblSession.Text = counter.ToString();
            Session["counter"] = counter;

        }

        

        protected void btnStore_Click1(object sender, EventArgs e)
        {
            System.Web.HttpCookie cookie = new HttpCookie(
                name: txtName.Text,
                value: txtValue.Text);
            //Make a persistent cookie by setting the expires property
            //Cookie.Expires=Datetime.Now.AddHours(1);
            Response.Cookies.Add(cookie);
            LblMessage.Text = "WOW!! Success in storing cookies!!";
            LblMessage.BackColor = Color.White;
            LblMessage.Font.Size = new FontUnit(20,0);
        }

        protected void btnRetrives_Click(object sender, EventArgs e)
        {
            StringBuilder bldr = new StringBuilder();
            bldr.Append("<h3>cookies are : </h3>").Append("</ul>");
            foreach(string key in Request.Cookies)
            {
                bldr.AppendFormat("<li><b>{0}</b> : {1}</li>",
                    key, Request.Cookies[key].Value);
            }
            bldr.Append("</ul>");
            LblMessage.BackColor = Color.White;
            LblMessage.ForeColor = Color.Black;
            LblMessage.Text = bldr.ToString();
        }
    }
}