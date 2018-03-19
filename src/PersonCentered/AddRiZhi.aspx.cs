using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Class;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace CRM.PersonCentered
{
    public partial class AddRiZhi : System.Web.UI.Page
    {
        Logic logic = new Logic();
        SqlConnection Connection = new SqlConnection();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            { Response.Redirect("~/Quit.aspx"); }
            Logic logic = new Logic();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
           
        }
     
 
       
       

        protected void Unnamed1_Click(object sender, EventArgs e)
        {

            if (contents.Value.ToString().Trim() == "")
            {
                Response.Write("<script>alert('请先输入日志内容')</script>");
                return;
            }
            logic.AddMyLog(Session["user"].ToString(), subject.Value.ToString(), contents.Value.ToString(), Connection);
            Response.Write("<script>alert('恭喜，日志添加成功')</script>");
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('取消')</script>");
        }

     
    }
}