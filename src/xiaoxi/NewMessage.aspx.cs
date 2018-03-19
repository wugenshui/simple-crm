using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using CRM.Class;

namespace CRM.xiaoxi
{
    public partial class NewMessage : System.Web.UI.Page
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
        public string Getemp()
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
            string s = name.Value.ToString();
            string[] sArray = s.Split(',');
            foreach (string i in sArray)
            {
                if (!logic.CheckEmpExist(i.ToString(), Connection))
                { Response.Write("<script>alert('收件人不存在,请重新填写')</script>"); }
            }  
            string orderid=DateTime.Now.ToString("yyyyMMddhhmmss");
            foreach (string i in sArray)
            {
                logic.AddNewMessage(Session["user"].ToString(),i.ToString(),subject.Value.ToString(),messagecontent.Value.ToString(),orderid, Connection); 
            }
            Response.Write("<script>alert('恭喜,新消息已发送成功')</script>");
            name.Value = ""; subject.Value = ""; messagecontent.Value = "";
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            
        }
    }
}