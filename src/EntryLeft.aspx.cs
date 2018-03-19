using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;
using CRM.Class;

namespace CRM
{
    public partial class EntryLeft : System.Web.UI.Page
    {
        SqlConnection Connection = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {

            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;

            StringBuilder strb1 = new StringBuilder();

    
            DataSet ds = new DataSet();
            if (Session["user"]  == null)
            { Response.Redirect("~/LogIn.aspx"); }
            if (Session["password"] != null && Session["password"].ToString() == "12345678")
            {
                Response.Write("<script>window.open('PersonCentered/ChangePassWord.aspx','ifrmMain')</script>");
            }
            Logic logic = new Logic();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
            Literal2.Text = logic.GetMenu("客户管理", Session["user"].ToString(), Connection).ToString();
  
        }
        private DataSet GetProgramID(string emp)
        {
            string strSQL = @"select * from Access a,Authority b 
                                where a.ID2=b.FatherID and a.ID1=b.ProgramID
                                and b.Name='" + emp + "' order by ID1   ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            Connection.Open();
            adapter.Fill(ds);
            return ds;
        }
        private string GetFatherID(string id1)
        {
            string strSQL = "Select * From Access where id1='" + id1 + "' ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            Connection.Open();
            adapter.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return ds.Tables[0].Rows[0]["ID2"].ToString();
            }
            else
            {
                return "";
            }
        }
        private string GetURLandName(string id1)
        {
            string strSQL = "Select * From Access where id1='" + id1 + "' ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            Connection.Open();
            adapter.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return ds.Tables[0].Rows[0]["DisplayName"].ToString() + "," + ds.Tables[0].Rows[0]["LinkURL"].ToString();
            }
            else
            {
                return ",";
            }
        }
    }
}