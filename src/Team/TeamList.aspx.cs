using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using CRM.Class;

namespace CRM.Team
{
    public partial class TeamList : System.Web.UI.Page
    {
        SqlConnection Connection = new SqlConnection();
        Logic logic = new Logic();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            { Response.Redirect("~/LogIn.aspx"); }
            Logic logic = new Logic();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
            logic.GetMenu("公司团队", Session["user"].ToString(), Connection).ToString();

           
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());
            if (!IsPostBack)
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataKeyNames = new string[] { "name", "owner", "ownerphone", "slogan", "company" };
                GridView1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
             DataSet ds = new DataSet();
             ds = Getdata(name.Value.ToString().Trim());
            
                 GridView1.DataSource = ds.Tables[0];
                 GridView1.DataKeyNames = new string[] { "name", "owner", "ownerphone", "slogan", "company" }; 
               GridView1.DataBind();
            
        }
        private DataSet Getdata(string teamName)
        {
           
            string strSQL = "Select * From Team where name like '" + teamName + "%'  ";
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

            string strSQL = "delete Team where name = '" + teamName + "'  ";
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
             GridView1.EditIndex = e.NewEditIndex;
             GridView1.EditRowStyle.BackColor = Color.Pink;
             DataSet ds = new DataSet();
             ds = Getdata(name.Value.ToString().Trim());
            
             GridView1.DataSource = ds.Tables[0];
             GridView1.DataKeyNames = new string[] { "name", "owner", "ownerphone", "slogan", "company" }; 
             GridView1.DataBind();
        }

  

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           
            string name1 = GridView1.DataKeys[e.RowIndex]["name"].ToString().Trim();
         
            Deletedata(name1);
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "name", "owner", "ownerphone", "slogan", "company" }; 
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
                  GridView1.EditIndex = -1;
                  DataSet ds = new DataSet();
                  ds = Getdata(name.Value.ToString().Trim());
                  GridView1.DataSource = ds.Tables[0];
                  GridView1.DataKeyNames = new string[] { "name", "owner", "ownerphone", "slogan", "company" }; 
                  GridView1.DataBind();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string teamName = GridView1.DataKeys[e.RowIndex]["name"].ToString().Trim();
            // TextBox tb = (TextBox)GridView1.Rows[GridView1.EditIndex].Cells[0].FindControl("CompanyName");
          

            string owner = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("owner")).Text;
            string ownerphone = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("ownerphone")).Text;

            string slogan = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("slogan")).Text;
            string company = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("company")).Text;
            if (!logic.CheckEmpExist(owner, Connection))
            {
                Response.Write("<script>alert('员工 " + owner + " 不存在,请先添加员工！')</script>");
                return;
            }
            if (!logic.CheckCompanyExist(company, Connection))
            {
                Response.Write("<script>alert('公司 " + company + " 不存在,请先添加公司！')</script>");
                return;
            }
            if ( owner == "" ||
                ownerphone == "" ||
                slogan == "" ||
                company == ""  )
            {
                Response.Write("<script>alert('请完整填完团队资料！')</script>");
                return;
            }

            logic.UpdateTeam(teamName,  owner,ownerphone,slogan,company, Connection);
            Response.Write("<script>alert('恭喜,已更新成功！')</script>");
            DataSet ds = new DataSet();
            ds = Getdata(teamName);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "name", "owner", "ownerphone", "slogan", "company" }; 
            GridView1.DataBind();
        }
    }
}