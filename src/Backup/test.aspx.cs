using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Configuration;

namespace CRM
{
    public partial class test : System.Web.UI.Page
    {
        SqlConnection Connection = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {


            Response.Expires = -1;//清除页面缓存
            AjaxPro.Utility.RegisterTypeForAjax(typeof(test));//将此后台页面类，注册到前台
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
        }
         [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.ReadWrite)]
        public string Getdata()
        {
            string query = "";



            string strSQL = @"select CONVERT(varchar(4), CreateDate, 120 ) as years --,COUNT(*) as num
                                ,+substring(CONVERT(varchar(10), CreateDate, 120 ),6,2) as months
                                ,substring(CONVERT(varchar(10), CreateDate, 120 ),9,2) as dayss
                                ,count(*) as summ
                                  from   customer a,Employee b
                                where   a.Owner=b.Name and a.CreateDate > CAST(GETDATE()-30 as date) 
                                and b.Company='总公司' 
                                group by  CONVERT(varchar(4), CreateDate, 120 )  
                                ,+substring(CONVERT(varchar(10), CreateDate, 120 ),6,2) 
                                ,substring(CONVERT(varchar(10), CreateDate, 120 ),9,2)";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            string dataquery = "";
            if (ds.Tables[0].Rows.Count > 0)
            {
               // string[,] siblings = new string[ds.Tables[0].Rows.Count, ds.Tables[0].Rows.Count];
                
           
                    dataquery = @"[[gd(" + ds.Tables[0].Rows[0]["years"].ToString() + "," + ds.Tables[0].Rows[0]["months"].ToString() +
                                  ", " + ds.Tables[0].Rows[0]["dayss"].ToString() + "), " + ds.Tables[0].Rows[0]["summ"].ToString() + "]";
             
                for (int i = 1; i < ds.Tables[0].Rows.Count; i++)
                {
                    dataquery = dataquery + @",[gd(" + ds.Tables[0].Rows[i]["years"].ToString() + "," + ds.Tables[0].Rows[i]["months"].ToString() +
                                  ", " + ds.Tables[0].Rows[i]["dayss"].ToString() + "), " + ds.Tables[0].Rows[i]["summ"].ToString() + "]";
                }
                dataquery = dataquery + "]";
            }
            return dataquery;

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
 

        }

       
    }
}