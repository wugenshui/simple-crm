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

namespace CRM.Team
{
    public partial class UpdateCompany : System.Web.UI.Page
    {

        Logic logic = new Logic();
        SqlConnection Connection = new SqlConnection();
        string namea;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user"] == null)
            { Response.Redirect("~/Quit.aspx"); }
            Logic logic = new Logic();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
           
           
            if (!IsPostBack)
            {
                HiddenField1.Value = Request.QueryString["company"].ToString();
                namea = Request.QueryString["company"].ToString();
                Response.Expires = -1;//清除页面缓存
                AjaxPro.Utility.RegisterTypeForAjax(typeof(UpdateCompany));//将此后台页面类，注册到前台
            }
        }
        [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.ReadWrite)]
        public string GetCompanyData(string com)
        {
            DataSet ds = new DataSet();
            string companyInfo ="";
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
            ds = logic.QueryCompany(com, Connection);
            if (ds.Tables[0].Rows.Count > 0)
            {
                companyInfo = ds.Tables[0].Rows[0]["owner"].ToString() + "^ " + ds.Tables[0].Rows[0]["phone"].ToString() + "^ " + ds.Tables[0].Rows[0]["website"].ToString() + "^ " +
                     ds.Tables[0].Rows[0]["createdate"].ToString() + "^ " + ds.Tables[0].Rows[0]["companyID"].ToString() + "^" + ds.Tables[0].Rows[0]["companyName"].ToString() + "^ ";
            }
            return companyInfo;

        }
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
      
            if (name.Value.ToString() == "" || owner.Value.ToString() == "" || number.Value.ToString() == "" || pbone.Value.ToString() == "" || web.Value.ToString() == "")
            {
                Response.Write("<script>alert('请完整填完公司资料！')</script>");
                return;
            }
            if (!logic.CheckDateFormat(txtdate.Value.ToString()))
            {
                Response.Write("<script>alert('日期格式错误呀！')</script>");
                return;
            }
            logic.UpdateCompany(name.Value.ToString(), owner.Value.ToString(), number.Value.ToString(), pbone.Value.ToString(), web.Value.ToString(), txtdate.Value.ToString(), Connection);
            Response.Write("<script>alert('恭喜,公司 " + name.Value.ToString() + " 修改成功')</script>");
            name.Value = "";
            owner.Value = "";
            number.Value = "";
            pbone.Value = "";
            web.Value = "";
            txtdate.Value = "";
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('取消')</script>");
        }
    }
}