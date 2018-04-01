using Common;
using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = inputName.Value;
            string password = inputPassword.Value;
            if (!string.IsNullOrWhiteSpace(username) && !string.IsNullOrWhiteSpace(password))
            {
                Session["father"] = ""; // 父菜单
                Session["son"] = "";    // 子菜单

                UserDAL _UserDAL = new UserDAL();
                string md5password = MD5Helper.CreateMD5(password);
                User user = _UserDAL.Get().FirstOrDefault(o => o.Username == username && o.Password == md5password);
                if (user != null)
                {
                    CommonHelper.User = user;
                    Response.Redirect("./Default.aspx");
                }
                else
                    Response.Write("<script>alert('用户名或密码输入错误!')</script>");
            }
            else
                Response.Write("<script>alert('用户名或密码不能为空!')</script>");
        }
    }
}