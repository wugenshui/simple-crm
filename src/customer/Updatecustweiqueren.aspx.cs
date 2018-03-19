using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Class;
using System.Data.SqlClient;
using System.Configuration;

namespace CRM.customer
{
    public partial class Updatecustweiqueren : System.Web.UI.Page
    {
        Logic logic = new Logic();
        SqlConnection Connection = new SqlConnection();
        string name2 = ""; string type2 = ""; string phone2 = ""; string qq2 = ""; string contract2 = "";
        string mail2 = ""; string customerID2 = ""; string homeaddress2 = ""; string owner2 = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user"] == null)
            { Response.Redirect("~/LogIn.aspx"); }
            Logic logic = new Logic();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
             logic.GetMenu("客户管理", Session["user"].ToString(), Connection).ToString();
            name2 = Request.QueryString["name"];
            type2 = Request.QueryString["type"];
            phone2 = Request.QueryString["phone"];
            qq2 = Request.QueryString["qq"];
            contract2 = Request.QueryString["contract"];
            mail2 = Request.QueryString["mail"];
            customerID2 = Request.QueryString["namecustomerID"];
            homeaddress2 = Request.QueryString["homeaddress"];
            owner2 = Request.QueryString["owner"];
            phone.Value = phone2;
            qq.Value = qq2;
            name.Value = name2;
            mail.Value = mail2;
            custID.Value = customerID2;
            home.Value = homeaddress2;
            team.Value = owner2;
          
            if (type2 == "客户单子")
            { cust.Checked=true; }
            else if (type2 == "员工单子")
            {  emp.Checked=true; }
            else if (type2 == "商家单子")
            { buss.Checked = true; }
            else if (type2 == "商城单子")
            { bc.Checked = true; }

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

            logic.AddCustomer(type, name.Value.ToString(), phone.Value.ToString(), qq.Value.ToString(), mail.Value.ToString(), custID.Value.ToString(), home.Value.ToString(), team.Value.ToString(), uploadfile.Value.ToString(), Session["user"].ToString(), Connection);
            //  logic.AddCustomer(name.Value.ToString(), company.Value.ToString(), team.Value.ToString(), post.Value.ToString(), supervisor.Value.ToString(), phone.Value.ToString(), qq.Value.ToString(), txtdate.Value.ToString(), Connection);
        }
    }
}