using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using CRM.Class;
namespace CRM
{
 
    public partial class LogIn : System.Web.UI.Page
    {
        SqlConnection Connection = new SqlConnection();
        Employee employee = new Employee();
        protected void Page_Load(object sender, EventArgs e)
        {
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
        }
 
        protected void Button1_Click(object sender, EventArgs e)
        {

            if (CheckAccount(inputName.Value.ToString(), inputPassword.Value.ToString()))
            {
                Session["father"] = "";
                Session["son"] = "";
                Session["user"] = inputName.Value.ToString();
                Session["password"] = inputPassword.Value.ToString();
            
                Response.Redirect("~/MainFrm.aspx");
                employee.EmployeeName = Session["user"].ToString();
                employee.Password = inputPassword.Value.ToString();
        
            }
            else
            { Response.Write("<script>alert('用户名或密码输入错误!')</script>"); }
        }
        private bool CheckAccount(string emp,string password)
        {
            bool checkStatus = false;
            string strSQL = "Select * From emppassword where emp='" + emp + "' and Password='" + password + "'";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);

           
            Connection.Open();
            adapter.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
            checkStatus = true; }
               
          
            return checkStatus;
        }
    }
}