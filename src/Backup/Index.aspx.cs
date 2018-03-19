using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;
using System.Data;
using CRM.Class;

namespace CRM
{   
    public partial class Index : System.Web.UI.Page
    {
        SqlConnection Connection = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
          if(Session["user"].ToString() == ""  )
          { Response.Redirect("~/LogIn.aspx"); }
          Logic logic = new Logic();
          Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
          Literal2.Text = logic.GetMenu("",Session["user"].ToString(), Connection).ToString();

        }

   
    }
}