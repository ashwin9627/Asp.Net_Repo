using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspDotNetProject
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ls1_LoggedOut(object sender, EventArgs e)
        {
            Session.Abandon();  //terminating the session.
            FormsAuthentication.SignOut(); //Killing the authentication code
        }
    }
}