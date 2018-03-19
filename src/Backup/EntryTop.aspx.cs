using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using CRM.Class;
using System.Data.SqlClient;
using System.Configuration;

namespace CRM
{
    public partial class EntryTop : System.Web.UI.Page
    {      string father="";
            string son="";
            Logic logic = new Logic();
            SqlConnection Connection = new SqlConnection();
      protected void Page_Load(object sender, EventArgs e)
      {
                Response.Expires = -1;//清除页面缓存
                AjaxPro.Utility.RegisterTypeForAjax(typeof(EntryTop));//将此后台页面类，注册到前台
                Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
            if (!IsPostBack)
            {
                //father = "father";// Session["father"].ToString();
                //son = "son";//Session["son"].ToString();
                //  StringBuilder strb = new StringBuilder();
                //strb.Append(@"<a href=""#"" class=""current"">"+father+@"</a>");
                //if (son != "")
                //{ strb.Append(@"<a href=""#"" class=""current"">" + son + @"</a>"); }

               
            }
        }
        [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.ReadWrite)]
        public string GetMessageCount()
        {
          Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
          if (Session["user"] == null)
          { Response.Redirect("~/Quit.aspx"); }
          return  logic.GetMessageQuantity(Session["user"].ToString(),Connection);
        }
        public void ShowTopTree(string father,string son)
        {
 
        }
        public void test( )
        {
            Response.Write("<script>alert('用户名或密码输入错误!')</script>");
        }
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            HiddenField1.Value = logic.GetMessageQuantity(Session["user"].ToString(), Connection);
        }
    }
}