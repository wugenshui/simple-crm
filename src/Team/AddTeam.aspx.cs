using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using CRM.Class;
using System.Data.SqlClient;
using System.Data;
using System.Text;

namespace CRM.Team
{
    public partial class AddTeam : System.Web.UI.Page
    {
  
        Logic logic = new Logic();
        SqlConnection Connection = new SqlConnection();

       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            { Response.Redirect("~/Quit.aspx"); ; }
            Logic logic = new Logic();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
            
        }
        public string GetCompany()
        {
            DataSet ds = new DataSet();
            ds = logic.GetCompanyList(Connection);
            string companylist="";
            if (ds.Tables[0].Rows.Count > 0)
            {


                for (int s = 0; s < ds.Tables[0].Rows.Count; s++)
                {
                    if (s == 0)
                    { companylist = ds.Tables[0].Rows[s]["companyName"].ToString(); }
                    else

                    { companylist=companylist+","+ ds.Tables[0].Rows[s]["companyName"].ToString(); }
                }

            }
            return companylist;
        }
   
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            if (logic.CheckTeamExist(name.Value.ToString(), Connection))
            {
                Response.Write("<script>alert('团队 " + name.Value.ToString() + " 已添加！')</script>");
                return;
            }
            //HiddenField1.Value.ToString() 选中的公司
            if (name.Value.ToString() == "" || owner.Value.ToString() == "" || HiddenField1.Value.ToString() == "" || pbone.Value.ToString() == "" || slogan.Value.ToString() == "")
            {
                Response.Write("<script>alert('请完整填完团队资料！')</script>");
                return;
            }
       
            logic.AddTeam(name.Value.ToString(), owner.Value.ToString(),  HiddenField1.Value.ToString(), pbone.Value.ToString(), slogan.Value.ToString(), Connection);
            Response.Write("<script>alert('恭喜,团队 " + name.Value.ToString() + " 添加成功')</script>");
            name.Value = "";
            owner.Value = "";
            company.Value = "";
            pbone.Value = "";
            slogan.Value = "";
         
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('取消')</script>");
        }
    }
}