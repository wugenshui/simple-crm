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
        //SqlConnection Connection = new SqlConnection();
        //Employee employee = new Employee();
        protected void Page_Load(object sender, EventArgs e)
        {
            var aaa = new CRMEntities().Access.Where(o => o.ID > 10).OrderBy(o => o.ID).Skip(10).Take(20);
            var bbb = new EmpPassWordDAL().Get().OrderBy(o => o.ID).Skip(10).Take(20);
            //Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckAccount(inputName.Value.ToString(), inputPassword.Value.ToString()))
            {
                Session["father"] = ""; // 父菜单
                Session["son"] = "";    // 子菜单
                Session["user"] = inputName.Value;  // 用户名
                Session["password"] = inputPassword.Value;  // 密码

                Response.Redirect("~/MainFrm.aspx");
                //employee.EmployeeName = Session["user"].ToString();
                //employee.Password = inputPassword.Value.ToString();
            }
            else
            { Response.Write("<script>alert('用户名或密码输入错误!')</script>"); }
        }
        private bool CheckAccount(string emp, string password)
        {
            bool checkStatus = false;

            //string strSQL = "Select * From emppassword where emp='" + emp + "' and Password='" + password + "'";
            //DataSet ds = new DataSet();
            //SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);

            //Connection.Open();
            //adapter.Fill(ds);

            //if (ds.Tables[0].Rows.Count > 0)
            //{
            //    checkStatus = true;
            //}

            return checkStatus;
        }
    }
}