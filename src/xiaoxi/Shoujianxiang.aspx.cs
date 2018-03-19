using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using CRM.Class;
using System.Configuration;

namespace CRM.xiaoxi
{
    public partial class Shoujianxiang : System.Web.UI.Page
    {

        SqlConnection Connection = new SqlConnection();
        Logic logic = new Logic();
        public string name2 = "name"; public string qq2 = "qq"; public string id2 = "phone";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            { Response.Redirect("~/LogIn.aspx"); }
            Logic logic = new Logic();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
          
            if (!this.IsPostBack)
            { }

            DataSet ds1 = new DataSet();
            ds1 = Getdata();

            GridViewAll.DataSource = ds1.Tables[0];
            GridViewAll.DataKeyNames = new string[] { "OrderID", "Sender", "Receiver", "Subject", "Send_date", "Mstatus" };
            GridViewAll.DataBind();
        
        
  


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
          
                ds = Getdata();

                GridViewAll.DataSource = ds.Tables[0];
                GridViewAll.DataKeyNames = new string[] { "OrderID", "Sender", "Receiver", "Subject",  "Send_date", "Mstatus" };
                GridViewAll.DataBind();
  


        }
 
        #region 获取数据
        private DataSet Getdata()
        {

            string strSQL = "select OrderID,Sender,Receiver,Subject,Mcontent,Send_date,Mstatus from message where Receiver='" + Session["user"] .ToString()+ "' order by Send_date  desc    ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            return ds;

        }
 
        #endregion
 
     
        protected void btnOpenClick(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "delete1")
            {
                int RowIndex = Convert.ToInt32(e.CommandArgument);
                DataKey keys = GridViewAll.DataKeys[RowIndex];      //行中的数据;
                string OrderID = keys["OrderID"].ToString();
                string Sender = keys["Sender"].ToString();
                string Receiver = keys["Receiver"].ToString();
                string mid = logic.GetMessageID(Receiver, Sender, OrderID, Connection);
                logic.DeleteXiaoxi(mid, Connection);
                DataSet ds = new DataSet();

                ds = Getdata();

                GridViewAll.DataSource = ds.Tables[0];
                GridViewAll.DataKeyNames = new string[] { "OrderID", "Sender", "Receiver", "Subject", "Send_date", "Mstatus" };
                GridViewAll.DataBind();

                Response.Write("<script>alert('恭喜,删除成功')</script>");
            }
            else if (e.CommandName == "chakan1")
            {
                int RowIndex = Convert.ToInt32(e.CommandArgument);
                DataKey keys = GridViewAll.DataKeys[RowIndex];      //行中的数据;
                string OrderID = keys["OrderID"].ToString(); 
                string Sender = keys["Sender"].ToString();
                string Receiver = keys["Receiver"].ToString();
                string mid = logic.GetMessageID(Receiver,Sender,OrderID,Connection);
                logic.UpdateMessageStatus(mid, "已读", Connection);
                Response.Redirect("QueryMessage.aspx?mid=" + mid);


            }
 
   
 
        }

 
 
 
   
    }
}