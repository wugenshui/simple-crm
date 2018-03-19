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

namespace CRM.customer
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        Logic logic = new Logic();
        SqlConnection Connection = new SqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["user"] == null)
            { Response.Redirect("~/LogIn.aspx"); }
            Logic logic = new Logic();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
            logic.GetMenu("员工管理", Session["user"].ToString(), Connection).ToString();
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
            string type = "";
            if (cust.Checked)
            { type = "客户单子"; }
            else if (emp.Checked)
            { type = "员工单子"; }
            else if (buss.Checked)
            { type = "商家单子"; }
            else if (bc.Checked)
            { type = "商城单子"; }
            if (logic.CheckCustomerDupAdd(name.Value.ToString(), Connection))
            {
                Response.Write("<script language='javascript'>alert('"+name.Value.ToString()+" 未完成,不能重复添加')</script>");
                return;
            }
            if (type == "" || name.Value.ToString() == "" || phone.Value.ToString() == "" || qq.Value.ToString() == "" || mail.Value.ToString() == "" || custID.Value.ToString() == "" || home.Value.ToString() == "")
            {
                Response.Write("<script language='javascript'>alert('请输入完整资料')</script>");
                return;
            }
            logic.AddCustomer(type, name.Value.ToString(), phone.Value.ToString(), qq.Value.ToString(), mail.Value.ToString(), custID.Value.ToString(), home.Value.ToString(), HiddenField1.Value.ToString() , uploadfile.Value.ToString(), Session["user"].ToString(), Connection);
            //  logic.AddCustomer(name.Value.ToString(), company.Value.ToString(), team.Value.ToString(), post.Value.ToString(), supervisor.Value.ToString(), phone.Value.ToString(), qq.Value.ToString(), txtdate.Value.ToString(), Connection);
            string strSQL = @"insert into CustomerLog(CustomerID,status,remark,emp,logdate)
                             values('" + logic.GetCustomerId(name.Value.ToString(),Connection) + "','已添加',' ','" + Session["user"].ToString() + "',getdate()) ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();
            Response.Write("<script language='javascript'>alert('添加成功')</script>"); 
            clear();
        }
        private void clear()
        {
            cust.Checked = false;
            emp.Checked = false;
            buss.Checked = false;
            bc.Checked = false;
            name.Value = "";
            phone.Value = "";
            qq.Value = "";
            mail.Value = "";
            custID.Value = "";
            home.Value = "";
            owner.Value = "";
       
        }
    }
}