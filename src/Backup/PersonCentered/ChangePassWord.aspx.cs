using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Class;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace CRM.PersonCentered
{
    public partial class ChangePassWord : System.Web.UI.Page
    {
        Employee employee = new Employee();
        Logic logic = new Logic();
        SqlConnection connection = new SqlConnection();
   
        protected void Page_Load(object sender, EventArgs e)
        {
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
            StringBuilder strb = new StringBuilder();
            strb.Append(@"<a href=""#"" class=""current"">个人中心</a>");
 
                strb.Append(@"<a href=""#"" class=""current"">修改密码</a>");
                Session["father"] = "个人中心";
                Session["son"] = "修改密码";
          // Literal1.Text = strb.ToString();

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {

            employee = logic.GetEmployeeInfo(Session["user"].ToString(), connection);
            if(employee.Password !=oldPassword.Value.ToString())
            { Response.Write("<script>alert('旧密码输入错误')</script>"); return; }
            if (newPassword.Value.ToString() != repeatNewPassword.Value.ToString())
            { Response.Write("<script>alert('两次输入的新密码不一致')</script>"); return; }
            employee.UpdatePassword(employee, newPassword.Value.ToString(), connection);
            Response.Write("<script>alert('密码修改成功')</script>");
            Response.Redirect("~/Quit.aspx");
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('取消')</script>");
        }
    }
}