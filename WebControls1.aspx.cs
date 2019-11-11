using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspDotNetProject
{
    public partial class WebControls1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> interestList = new List<string>
            {
                "Art","Automobiles","Technology","Fashion","Sports"
            };
            //The request is a new request or whether it is postback (submit) request
            if (!IsPostBack)
            {
                //do the assignment and invoke the methods

              //  ChkInterests.DataSource = interestList;  //we can use databind or the for loop
              //  ChkInterests.DataBind();             //bind the string items to list items 

            } //otherwise,ignore the assignment

            for(int i=0;i<interestList.Count;i++)
            {
                ChkInterests.Items.Add(interestList[i]);
            }
        }
        protected void btnSave_Click(object sender,EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<section class='alert alert-info'>");
            sb.AppendFormat("Hi, <b>{0}</b>!<br>", txtName.Text)
            .Append("Welcome to our site.You are located in")
            .AppendFormat("<strong>{0}</strong>", location1.Text)
            .AppendFormat("<address>{0}</address>", txtAdd.Text)
            .Append("<br> Your Interests are")
            .Append("<ul>");

            foreach(ListItem item in ChkInterests.Items)
            {
                if (item.Selected)
                    sb.AppendFormat("<li>{0}</li>",item.Text);
            }
            sb.Append("</ul>");
            sb.Append("</section>");
            literal1.Text = sb.ToString();
        }
    }
}