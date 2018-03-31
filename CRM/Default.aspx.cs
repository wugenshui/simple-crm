using Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CommonHelper.User == null)
                Response.Redirect("./Login.aspx");
            else
                Response.Redirect("./Main.aspx");
        }
    }
}