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

namespace CRM.EmployeeControl
{
    public partial class AddEmployee : System.Web.UI.Page
    {

        Logic logic = new Logic();
        SqlConnection Connection = new SqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user"] == null)
            { Response.Redirect("~/LogIn.aspx"); }
            Logic logic = new Logic();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
          
        }
        public string GetCompany()
        {
            DataSet ds = new DataSet();
            ds = logic.GetCompanyList(Connection);
            string companylist = "";
            if (ds.Tables[0].Rows.Count > 0)
            {


                for (int s = 0; s < ds.Tables[0].Rows.Count; s++)
                {
                    if (s == 0)
                    { companylist = ds.Tables[0].Rows[s]["companyName"].ToString(); }
                    else

                    { companylist = companylist + "," + ds.Tables[0].Rows[s]["companyName"].ToString(); }
                }

            }
            return companylist;
        }
        public string GetTeam()
        {
            DataSet ds = new DataSet();
            ds = logic.GetTeamList(Connection);
            string companylist = "";
            if (ds.Tables[0].Rows.Count > 0)
            {


                for (int s = 0; s < ds.Tables[0].Rows.Count; s++)
                {
                    if (s == 0)
                    { companylist = ds.Tables[0].Rows[s]["name"].ToString(); }
                    else

                    { companylist = companylist + "," + ds.Tables[0].Rows[s]["name"].ToString(); }
                }

            }
            return companylist;
        }
        public string GetEmployee()
        {
            DataSet ds = new DataSet();
            ds = logic.GetEmployeeList(Connection);
            string companylist = "";
            if (ds.Tables[0].Rows.Count > 0)
            {


                for (int s = 0; s < ds.Tables[0].Rows.Count; s++)
                {
                    if (s == 0)
                    { companylist = ds.Tables[0].Rows[s]["name"].ToString(); }
                    else

                    { companylist = companylist + "," + ds.Tables[0].Rows[s]["name"].ToString(); }
                }

            }
            return companylist;
        }
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            if (logic.CheckEmpExist(name.Value.ToString(), Connection))
            {
                Response.Write("<script>alert('员工 " + name.Value.ToString() + " 已添加！')</script>");
                return;
            }
            //HiddenField1.Value.ToString() 选中的公司 post
            if (name.Value.ToString() == "" || qq.Value.ToString() == "" || post.Value.ToString() == "" || phone.Value.ToString() == "" || txtdate.Value.ToString() == ""
                || HiddenFieldcompany.Value.ToString() == "" || HiddenFieldteam.Value.ToString() == "")
            {
                Response.Write("<script>alert('请完整填完员工资料！')</script>");
                return;
            }



            logic.AddEmpoyee(name.Value.ToString(), HiddenFieldcompany.Value.ToString(), HiddenFieldteam.Value.ToString(), post.Value.ToString(), HiddenFieldemp.Value.ToString(), phone.Value.ToString(), qq.Value.ToString(), txtdate.Value.ToString(), Connection);
            Response.Write("<script>alert('恭喜,团队 " + name.Value.ToString() + " 添加成功')</script>");
            name.Value = "";
            qq.Value = "";
            company.Value = "";
            phone.Value = "";
            team.Value = "";
            post.Value = "";
            supervisor.Value = "";
            txtdate.Value = "";
        }
    }
}