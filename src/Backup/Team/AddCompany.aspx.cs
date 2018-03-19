using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Class;
using System.Data.SqlClient;
using System.Configuration;

namespace CRM.Team
{
    public partial class AddCompany : System.Web.UI.Page
    {
        
        
        Logic logic = new Logic();
        SqlConnection Connection = new SqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["user"] == null)
            { Response.Redirect("~/LogIn.aspx"); }
            Logic logic = new Logic();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
            logic.GetMenu("公司团队", Session["user"].ToString(), Connection).ToString();
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            if (logic.CheckCompanyExist(name.Value.ToString(), Connection))
            {
                Response.Write("<script>alert('公司 " + name.Value.ToString() + " 已添加！')</script>");
                return;
            }
            if (name.Value.ToString() == "" || owner.Value.ToString() == "" || number.Value.ToString() == "" || pbone.Value.ToString() == "" || web.Value.ToString() == "")
            {
                Response.Write("<script>alert('请完整填完公司资料！')</script>");
                return;
            }
            if (!logic.CheckDateFormat(txtdate.Value.ToString()))
            {
                Response.Write("<script>alert('日期格式错误呀！')</script>");
                return;
            }
            logic.AddCompany(name.Value.ToString(), owner.Value.ToString(), number.Value.ToString(), pbone.Value.ToString(), web.Value.ToString(), txtdate.Value.ToString(), Connection);
            Response.Write("<script>alert('恭喜,公司 " + name.Value.ToString() + " 添加成功')</script>");
            name.Value = "";
            owner.Value= "";
            number.Value = "";
            pbone.Value = "";
            web.Value = "";
            txtdate.Value = "";
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('取消')</script>");
        }
    }
}