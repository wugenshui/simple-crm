using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;
using CRM.Class;

namespace CRM.Team
{
    public partial class CompanyList : System.Web.UI.Page
    {
        SqlConnection Connection = new SqlConnection();
        Logic logic = new Logic();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            { Response.Redirect("~/LogIn.aspx"); }
           
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
             logic.GetMenu("公司团队", Session["user"].ToString(), Connection).ToString();

            
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());
            if (!IsPostBack)
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataKeyNames = new string[] { "companyName", "owner", "phone", "website", "createdate", "companyID" };
                GridView1.DataBind();
            }
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "companyName", "owner", "phone", "website", "createdate", "companyID" };
            GridView1.DataBind();

        }
        private DataSet Getdata(string teamName)
        {

            string strSQL = "Select * From company where companyName like '" + teamName + "%'  ";
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

            string strSQL = "delete company where companyName = '" + teamName + "'  ";
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
            GridView1.DataKeyNames = new string[] { "companyName", "owner", "phone", "website", "createdate", "companyID" };
            GridView1.DataBind();
        }



        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            string name1 = GridView1.DataKeys[e.RowIndex]["companyName"].ToString().Trim();

            Deletedata(name1);
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "companyName", "owner", "phone", "website", "createdate", "companyID" };
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "companyName", "owner", "phone", "website", "createdate", "companyID" };
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string companyName = GridView1.DataKeys[e.RowIndex]["companyName"].ToString().Trim();
           // TextBox tb = (TextBox)GridView1.Rows[GridView1.EditIndex].Cells[0].FindControl("CompanyName");
           

            string owner = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("owner")).Text;
            string phone = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("phone")).Text;
      
            string website = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("website")).Text;
            string createdate = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("createdate")).Text;
            string companyID = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("companyID")).Text;
      
            if (  owner == "" ||
                phone == "" ||
               website == "" ||
             createdate == "" ||
              companyID == "")
            {
                Response.Write("<script>alert('请完整填完公司资料！')</script>");
                return;
            }
            if (!logic.CheckDateFormat(createdate))
            {
                Response.Write("<script>alert('日期格式错误呀！')</script>");
                return;
            }
            logic.UpdateCompany(companyName, owner, companyID, phone, website, createdate, Connection);
            Response.Write("<script>alert('恭喜,已更新成功！')</script>");
            DataSet ds = new DataSet();
            ds = Getdata(companyName);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "companyName", "owner", "phone", "website", "createdate", "companyID" };
            GridView1.DataBind();
        }
    }
}