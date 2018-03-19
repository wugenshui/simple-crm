using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using CRM.Class;

namespace CRM.Report
{
    public partial class PersonPerformance : System.Web.UI.Page
    {
        SqlConnection Connection = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            { Response.Redirect("~/LogIn.aspx"); }
            Logic logic = new Logic();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
            logic.GetMenu("统计报表", Session["user"].ToString(), Connection).ToString();
            if (!this.IsPostBack)
            {
                datestart.Value = DateTime.Now.AddDays(-45).ToString("yyyy-MM-dd");
                dateend.Value = DateTime.Now.ToString("yyyy-MM-dd");
            }



            DataSet ds6 = new DataSet();

            ds6 = Getdata("");
            GridViewyiwancheng.DataSource = ds6.Tables[0];
            //  GridViewyiwancheng.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewyiwancheng.DataBind();
        }

        public string RadioClick()
        {
            // Button2.Text = HiddenField1.Value;
            DataSet ds6 = new DataSet();

            ds6 = Getdata(HiddenField1.Value);
            GridViewyiwancheng.DataSource = ds6.Tables[0];
            //  GridViewyiwancheng.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewyiwancheng.DataBind();
            return "空";
        }


        protected void RadioClick_Click(object sender, EventArgs e)
        { }
        private DataSet Getdata(string querydate)
        {
            string query = "";
            if (querydate == "jinri")
            {
                query = " a.CreateDate>CAST(GETDATE() as date) ";
            }
            else if (querydate == "zuori")
            { query = " a.CreateDate between CAST(GETDATE()-1 as date) and CAST(GETDATE() as date) "; }
            else if (querydate == "qianri")
            { query = " a.CreateDate between CAST(GETDATE()-2 as date) and CAST(GETDATE()-1 as date) "; }
            else if (querydate == "benzhou")
            { query = " a.CreateDate >CAST( dateadd(day,1-(datepart(weekday,GETDATE())),GETDATE())as date) "; }
            else if (querydate == "qitian")
            { query = " a.CreateDate > CAST(GETDATE()-7 as date) "; }
            else if (querydate == "benyue")
            { query = " a.CreateDate > DATEADD(mm,DATEDIFF(mm,0,getdate()),0)  "; }
            else if (querydate == "sanshitian")
            { query = " a.CreateDate > CAST(GETDATE()-30 as date) "; }
            else if (querydate == "benji")
            { query = " a.CreateDate > DATEADD(qq,DATEDIFF(qq,0,getdate()),0) "; }
            else if (querydate == "bennian")
            { query = " a.CreateDate>DATEADD(yy,DATEDIFF(yy,0,getdate()),0)  "; }
            else if (querydate == "lishi")
            { query = " a.CreateDate between cast( '" + datestart.Value.ToString() + "' as date) and   cast( '" + dateend.Value.ToString() + "' as date)"; }
            else
            { query = " a.CreateDate =a.CreateDate  "; }
            string strSQL = @"select  '第'+ cast(row_number()over(order by num ) as varchar(10))+'名' as '名次',name as '员工名称' from (
select  b.name,COUNT(*) as num  from   customer a,Employee b
where  " + query + @" and a.Owner=b.Name group by   b.name ) c ";
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
        private void UpdateCustomerVisit(string emp, string remark, string id)
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
            ds = Getdata("");
            GridViewyiwancheng.DataSource = ds.Tables[0];
            GridViewyiwancheng.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewyiwancheng.DataBind();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = Getdata("");
            GridViewyiwancheng.DataSource = ds.Tables[0];
            GridViewyiwancheng.DataBind();
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = Getdata("");
            GridViewyiwancheng.AllowPaging = false;


            GridViewyiwancheng.DataSource = ds.Tables[0];
            GridViewyiwancheng.DataBind();
            // 设置编码和附件格式   
            Response.ContentType = "application/vnd.ms-excel";
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("gb2312");
            Response.Charset = "gb2312";

            Response.AddHeader("content-disposition", "attachment; filename=个人业绩排行榜_" + DateTime.Now.ToString("yyyyMMddhhmmss") + ".xls");

            // Response.ContentType = "application/excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);

            GridViewyiwancheng.RenderControl(htw);

            Response.Write("<meta http-equiv=\"content-type\" content=\"application/ms-excel; charset=gb2312\"/>" + sw.ToString());

            Response.End();
            GridViewyiwancheng.AllowPaging = true;
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            // Confirms that an HtmlForm control is rendered for
        }
    }
}