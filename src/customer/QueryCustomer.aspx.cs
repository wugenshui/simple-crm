using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using CRM.Class;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Text;

namespace CRM.customer
{
    public partial class QueryCustomer : System.Web.UI.Page
    {
        SqlConnection Connection = new SqlConnection();
       
        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (Session["user"] == null)
            { Response.Redirect("~/LogIn.aspx"); }
            Logic logic = new Logic();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
            logic.GetMenu("客户管理", Session["user"].ToString(), Connection).ToString();

            DataSet ds = new DataSet();
            ds = Getdata(Request.QueryString["name"].ToString());
            StringBuilder strb1 = new StringBuilder();

            StringBuilder strb2 = new StringBuilder();   
            if (ds.Tables[0].Rows.Count > 0)
            {
                strb1.Append(@"<tr><td>客户姓名：</td><td>"+ ds.Tables[0].Rows[0]["customerName"].ToString()+@"</td>
                                   <td>电话：</td><td>" + ds.Tables[0].Rows[0]["customerPhone"].ToString() + @"</td></tr>");
                strb1.Append(@"<tr><td>QQ：</td><td>" + ds.Tables[0].Rows[0]["customerqq"].ToString() + @"</td>
                                   <td>邮箱：</td><td>" + ds.Tables[0].Rows[0]["mail"].ToString() + @"</td></tr>");
                strb1.Append(@"<tr><td>身份证号码：</td><td>" + ds.Tables[0].Rows[0]["customerID"].ToString() + @"</td>
                                   <td>签约时间：</td><td>" + ds.Tables[0].Rows[0]["createDate"].ToString() + @"</td></tr>");
                strb1.Append(@"<tr><td>家庭住址：</td><td colspan=""3"">" + ds.Tables[0].Rows[0]["homeaddress"].ToString() + @"</td>
                                    </tr>");

                strb2.Append(@"<tr><td>所属业务员：</td><td>" + ds.Tables[0].Rows[0]["owner"].ToString() + @"</td>
                                   <td>业务员电话：</td><td>" + ds.Tables[0].Rows[0]["phonenumber"].ToString() + @"</td></tr>");
                strb2.Append(@"<tr><td>员工QQ号：</td><td>" + ds.Tables[0].Rows[0]["qqnumber"].ToString() + @"</td>
                                   <td>所属公司：</td><td>" + ds.Tables[0].Rows[0]["company"].ToString() + @"</td></tr>");
                strb2.Append(@"<tr><td>是否回访：</td><td colspan=""3"">" + ds.Tables[0].Rows[0]["returnvisit"].ToString() + @"</td>
                                    </tr>");
                Literalcust.Text = strb1.ToString();
                Literalemployee.Text = strb2.ToString();
            }

            
            ds = GetdataLog(Request.QueryString["id"].ToString());
            StringBuilder strb3 = new StringBuilder();
            if (ds.Tables[0].Rows.Count > 0)
            {


                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    strb3.Append(@"<tr><td colspan=""4"">" + ds.Tables[0].Rows[i]["emp"].ToString() + @"  在 " 
                                  + ds.Tables[0].Rows[i]["logdate"].ToString() + @" 对客户 " 
                                  + ds.Tables[0].Rows[i]["customername"].ToString() + @" 进行了 " 
                                  + ds.Tables[0].Rows[i]["status"].ToString() + @" 的操作， 备注信息："
                                  + ds.Tables[0].Rows[i]["remark"].ToString() + @" 
                                    </td></tr>");
                }
                Literalordertracking.Text = strb3.ToString();
               
            } 
        }

  
        private DataSet Getdata(string teamName)
        {

            string strSQL = @" select * from customer a,employee b  
                  where a.owner=b.Name    and a.customername=  '" + teamName + "'  ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            return ds;

        }
      
        private DataSet GetdataLog(string id)
        {

            string strSQL = @" select * from   customerlog a,customer b
                     where a.CustomerID=b.ID and a.CustomerID= '" + id + "'   ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            return ds;

        }
        private DataSet Deletedata(string teamName)
        {

            string strSQL = "delete company where companyName = '" + teamName + "'  ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }
            adapter.Fill(ds);
            return ds;

        }
 
    }
}