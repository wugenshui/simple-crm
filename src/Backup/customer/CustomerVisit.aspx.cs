using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CRM.Class;
using System.Configuration;

namespace CRM.customer
{
    public partial class CustomerVisit : System.Web.UI.Page
    {
        SqlConnection Connection = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"].ToString() == "")
            { Response.Redirect("~/LogIn.aspx"); }
            Logic logic = new Logic();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
         logic.GetMenu("客户管理", Session["user"].ToString(), Connection).ToString();
            if (!this.IsPostBack)
            { }

            DataSet ds6 = new DataSet();
           
            ds6 = Getdata(name.Value.ToString().Trim());
            GridViewyiwancheng.DataSource = ds6.Tables[0];
            GridViewyiwancheng.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewyiwancheng.DataBind();
        }
        private DataSet Getdata(string teamName)
        {

            string strSQL = @"select b.* from   customervisit a,customer b
                  where a.CustomerID=b.ID and b.customername like '" + teamName + "%' and a.status='wait' ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            return ds;

        }
        protected void btnOpenClick(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "yiwanchengchakan")
            {
                int RowIndex = Convert.ToInt32(e.CommandArgument);
                DataKey keys = GridViewyiwancheng.DataKeys[RowIndex];      //行中的数据; 
                string perid = keys["customername"].ToString();
                string id = keys["id"].ToString();
                Response.Redirect("QueryCustomer.aspx?name=" + perid + "&id=" + id);
            }
        }
        private void UpdateCustomerVisit(string emp, string remark,string id)
        {
            string strSQL = @"update customervisit set status = 'done', visitemp = '" + emp + @"',remark = '" + remark
                            + @"' ,visitdate=getdate() where customerid='" + id + "'    ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);


        }
        protected void Buttonyiwanchenghuifang_Click(object sender, EventArgs e)
        {
           
            string strSQL = @"insert into CustomerLog(CustomerID,status,remark,emp,logdate)
                             values('" + HiddenField1.Value + "','回访','" + yiwanchenghuifangremark.Value.ToString().Trim() + "','" + Session["user"].ToString() + "',getdate()) ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);

            UpdateCustomerVisit(Session["user"].ToString(), yiwanchenghuifangremark.Value.ToString().Trim(), HiddenField1.Value);
            ds = Getdata(name.Value.ToString().Trim());
            GridViewyiwancheng.DataSource = ds.Tables[0];
            GridViewyiwancheng.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewyiwancheng.DataBind();
        }
        
    }
}