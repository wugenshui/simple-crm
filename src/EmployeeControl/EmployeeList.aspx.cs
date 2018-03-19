using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using CRM.Class;
using System.Configuration;
using System.Data;
using System.Drawing;

namespace CRM.EmployeeControl
{
    public partial class EmployeeList : System.Web.UI.Page
    {
        SqlConnection Connection = new SqlConnection();
        Logic logic = new Logic();
        protected void Page_Load(object sender, EventArgs e)
        {
             
            if (Session["user"] == null)
            { Response.Redirect("~/LogIn.aspx"); }
            Logic logic = new Logic();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
              logic.GetMenu("员工管理", Session["user"].ToString(), Connection).ToString();

            if (!IsPostBack)
            {
                DataSet ds = new DataSet();
                ds = Getdata(name.Value.ToString().Trim());

                GridView1.DataSource = ds.Tables[0];
                GridView1.DataKeyNames = new string[] { "name", "company", "team", "post", "supervisor", "phonenumber", "qqnumber", "status", "workstartdate" };
                GridView1.DataBind();
            }
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "name", "company", "team", "post", "supervisor", "phonenumber", "qqnumber", "status", "workstartdate" };
            GridView1.DataBind();

        }
        private DataSet Getdata(string name)
        {

            string strSQL = "Select * From employee where name like '" + name + "%'  ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            return ds;

        }
        private DataSet Deletedata(string teamName)
        {

            string strSQL = "delete employee where name = '" + teamName + "'  ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }
            adapter.Fill(ds);
            return ds;

        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            (sender as GridView).EditIndex = e.NewEditIndex;
            GridView1.EditRowStyle.BackColor = Color.Pink;
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "name" };//{ "name", "company", "team", "post", "supervisor", "phonenumber", "qqnumber", "status", "workstartdate" };
            GridView1.DataBind();
        }



        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            string name1 = GridView1.DataKeys[e.RowIndex]["name"].ToString().Trim();

            Deletedata(name1);
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "name", "company", "team", "post", "supervisor", "phonenumber", "qqnumber", "status", "workstartdate" };
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "name", "company", "team", "post", "supervisor", "phonenumber", "qqnumber", "status", "workstartdate" };
            GridView1.DataBind();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string name = GridView1.DataKeys[e.RowIndex]["name"].ToString().Trim();
            // TextBox tb = (TextBox)GridView1.Rows[GridView1.EditIndex].Cells[0].FindControl("CompanyName");company


            string post = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("post")).Text;
            string team = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("team")).Text;
            string company = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("CompanyName")).Text;
            string supervisor = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("supervisor")).Text;
            string phonenumber = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("phonenumber")).Text;
            string qqnumber = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("qqnumber")).Text;
            string status = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("status")).Text;
            string workstartdate = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("workstartdate")).Text;

            if (!logic.CheckEmpExist(supervisor, Connection))
            {
                Response.Write("<script>alert('员工 " + supervisor + " 不存在,请先添加员工！')</script>");
                return;
            }
            if (!logic.CheckCompanyExist(company, Connection))
            {
                Response.Write("<script>alert('公司 " + company + " 不存在,请先添加公司！')</script>");
                return;
            }
            if (!logic.CheckTeamExist(team, Connection))
            {
                Response.Write("<script>alert('团队 " + team + " 不存在,请先添加团队！')</script>");
                return;
            }
            if (post == "" || phonenumber == "" || qqnumber == "" || status == "" || workstartdate == "" ||
                team == "" ||
                supervisor == "" ||
                company == "")
            {
                Response.Write("<script>alert('请完整填完员工资料！')</script>");
                return;
            }

            logic.UpdateEmployee(name,company,team,post,supervisor,phonenumber,qqnumber,status,workstartdate, Connection);
            Response.Write("<script>alert('恭喜,已更新成功！')</script>");
            DataSet ds = new DataSet();
            ds = Getdata(name);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "name", "company", "team", "post", "supervisor", "phonenumber", "qqnumber", "status", "workstartdate" };
            GridView1.DataBind();
        }
    }
}