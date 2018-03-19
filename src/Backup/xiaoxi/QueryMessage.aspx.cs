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

namespace CRM.xiaoxi
{
    public partial class QueryMessage : System.Web.UI.Page
    {
        Logic logic = new Logic();
        SqlConnection Connection = new SqlConnection();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            { Response.Redirect("~/LogIn.aspx"); }
            Logic logic = new Logic();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;

            DataSet ds = new DataSet();
            ds = Getdata(Request.QueryString["mid"].ToString());
            name.Value = ds.Tables[0].Rows[0]["Receiver"].ToString();
            sends.Value = ds.Tables[0].Rows[0]["Sender"].ToString();
            subject.Value = ds.Tables[0].Rows[0]["Subject"].ToString();
            messagecontent.Value = ds.Tables[0].Rows[0]["Mcontent"].ToString();
            name.Attributes.Add("readonly", "readonly");
            sends.Attributes.Add("readonly", "readonly");
            subject.Attributes.Add("readonly", "readonly");
            messagecontent.Attributes.Add("readonly", "readonly");

        }
        public DataSet Getdata(string messageid)
        {

            string strSQL = "select MessageID, OrderID,Sender,Receiver,Subject,Mcontent,Send_date,Mstatus from message where MessageID= '" + messageid + "'    ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
 
            return ds;
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            messagecontent.Attributes.Remove("readonly");
            Button2.Attributes.Remove("disabled");
            messagecontent.Value = "::::::" + messagecontent.Value.ToString();
            messagecontent.Focus();
            Button1.Attributes.Add("disabled", "true");

        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
              string orderid=DateTime.Now.ToString("yyyyMMddhhmmss");
              string content = Request.Params["messagecontent"].ToString();
              logic.AddNewMessage(Session["user"].ToString(), sends.Value.ToString(), "回复:" + subject.Value.ToString(), content, orderid, Connection);
              Button2.Attributes.Add("disabled", "true");
              Button1.Attributes.Remove("disabled");
              Response.Write("<script>window.open('shoujianxiang.aspx','ifrmMain')</script>");
        
              Response.Write("<script>alert('恭喜,新消息已发送成功')</script>");

        }
    }
}