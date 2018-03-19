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

namespace CRM.PersonCentered
{
    public partial class CompanyData : System.Web.UI.Page
    {
        Logic logic = new Logic();
        SqlConnection Connection = new SqlConnection();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            { Response.Redirect("~/Quit.aspx"); }
            Logic logic = new Logic();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
            Response.Expires = -1;//清除页面缓存
            AjaxPro.Utility.RegisterTypeForAjax(typeof(CompanyData));//将此后台页面类，注册到前台
        }
        [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.ReadWrite)]
        public string GetCompanyInfro()
        {
            DataSet ds = new DataSet();
            string companyInfo = "";
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
            ds = logic.GetCompanyInfomation(Session["user"].ToString(), Connection);
            if (ds.Tables[0].Rows.Count > 0)
            {
                companyInfo = ds.Tables[0].Rows[0]["owner"].ToString() + "^ " + ds.Tables[0].Rows[0]["phone"].ToString() + "^ " + ds.Tables[0].Rows[0]["website"].ToString() + "^ " +
                     ds.Tables[0].Rows[0]["createdate"].ToString() + "^ " + ds.Tables[0].Rows[0]["companyID"].ToString()+"^" +ds.Tables[0].Rows[0]["companyName"].ToString() + "^ " ;
            }
            return companyInfo;

        } 
       [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.ReadWrite)]
        public string GetCompanyDatapanel()
        {
            DataSet ds = new DataSet();
            string companyInfo = "";
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
            ds = logic.GetCompanyDatapanel(Connection);
            if (ds.Tables[0].Rows.Count > 0)
            {
                companyInfo = ds.Tables[0].Rows[0]["employee"].ToString() + "^ " + ds.Tables[0].Rows[0]["Team"].ToString() + "^ " + ds.Tables[0].Rows[0]["zuoriyj"].ToString() + "^ " +
                     ds.Tables[0].Rows[0]["shangzhouyj"].ToString() + "^ " + ds.Tables[0].Rows[0]["shangyueyj"].ToString() + "^" + ds.Tables[0].Rows[0]["lishiyj"].ToString() + "^ ";
            }
            return companyInfo;

        }
        public string GetCompany()
        {
            DataSet ds = new DataSet();
            ds = logic.GetCompanyList(Connection);
            string companylist = "";
            if (ds.Tables[0].Rows.Count > 0)
            {


                for (int s = 0; s < ds.Tables[0].Rows.Count; s++)
                {
                    if (s == 0)
                    { companylist = ds.Tables[0].Rows[s]["companyName"].ToString(); }
                    else

                    { companylist = companylist + "," + ds.Tables[0].Rows[s]["companyName"].ToString(); }
                }

            }
            return companylist;
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
       

        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('取消')</script>");
        }
      
        public string Getdata()
        {
           
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
            else
            {
                dataquery = "[[gd(2000,01,01),1]]";
            }
            Connection.Close();
         
            return dataquery;

        }
        public string Getdatalx()
        {

            string strSQL = "";
    
                strSQL = @"select CONVERT(varchar(4), CreateDate, 120 ) as years --,COUNT(*) as num
                                ,+substring(CONVERT(varchar(10), CreateDate, 120 ),6,2) as months
                                ,substring(CONVERT(varchar(10), CreateDate, 120 ),9,2) as dayss
                                ,count(*) as summ
                                  from   customer a,Employee b,CustomerLog c
                                where  c.CustomerID=a.ID and  a.Owner=b.Name and a.CreateDate > CAST(GETDATE()-30 as date) 
                                and b.Company='总公司'  and c.status='已联系'
                                group by  CONVERT(varchar(4), CreateDate, 120 )  
                                ,+substring(CONVERT(varchar(10), CreateDate, 120 ),6,2) 
                                ,substring(CONVERT(varchar(10), CreateDate, 120 ),9,2)"; ;
          
   


            DataSet ds = new DataSet();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
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
            else
            {
                dataquery = "[[gd(2000,01,01),1]]";
            }
            Connection.Close();

            return dataquery;

        }
        public string Getdatafp()
        {

            string strSQL = "";
            strSQL = @"select CONVERT(varchar(4), CreateDate, 120 ) as years --,COUNT(*) as num
                                ,+substring(CONVERT(varchar(10), CreateDate, 120 ),6,2) as months
                                ,substring(CONVERT(varchar(10), CreateDate, 120 ),9,2) as dayss
                                ,count(*) as summ
                                  from   customer a,Employee b,CustomerLog c
                                where  c.CustomerID=a.ID and  a.Owner=b.Name and a.CreateDate > CAST(GETDATE()-30 as date) 
                                and b.Company='总公司'  and c.status='已分配'
                                group by  CONVERT(varchar(4), CreateDate, 120 )  
                                ,+substring(CONVERT(varchar(10), CreateDate, 120 ),6,2) 
                                ,substring(CONVERT(varchar(10), CreateDate, 120 ),9,2)";



            DataSet ds = new DataSet();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
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
            else
            {
                dataquery = "[[gd(2000,01,01),1]]";
            }
            Connection.Close();

            return dataquery;

        }
        public string Getdatawc()
        {

            string strSQL = "";
            strSQL = @"select CONVERT(varchar(4), CreateDate, 120 ) as years --,COUNT(*) as num
                                ,+substring(CONVERT(varchar(10), CreateDate, 120 ),6,2) as months
                                ,substring(CONVERT(varchar(10), CreateDate, 120 ),9,2) as dayss
                                ,count(*) as summ
                                  from   customer a,Employee b,CustomerLog c
                                where  c.CustomerID=a.ID and  a.Owner=b.Name and a.CreateDate > CAST(GETDATE()-30 as date) 
                                and b.Company='总公司'  and c.status='已完成'
                                group by  CONVERT(varchar(4), CreateDate, 120 )  
                                ,+substring(CONVERT(varchar(10), CreateDate, 120 ),6,2) 
                                ,substring(CONVERT(varchar(10), CreateDate, 120 ),9,2)";


            DataSet ds = new DataSet();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
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
            else
            {
                dataquery = "[[gd(2000,01,01),1]]";
            }
            Connection.Close();

            return dataquery;

        }
        public string Getdataqr()
        {

            string strSQL = "";
            strSQL = @"select CONVERT(varchar(4), CreateDate, 120 ) as years --,COUNT(*) as num
                                ,+substring(CONVERT(varchar(10), CreateDate, 120 ),6,2) as months
                                ,substring(CONVERT(varchar(10), CreateDate, 120 ),9,2) as dayss
                                ,count(*) as summ
                                  from   customer a,Employee b,CustomerLog c
                                where  c.CustomerID=a.ID and  a.Owner=b.Name and a.CreateDate > CAST(GETDATE()-30 as date) 
                                and b.Company='总公司'  and c.status='已确认'
                                group by  CONVERT(varchar(4), CreateDate, 120 )  
                                ,+substring(CONVERT(varchar(10), CreateDate, 120 ),6,2) 
                                ,substring(CONVERT(varchar(10), CreateDate, 120 ),9,2)";


            DataSet ds = new DataSet();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
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
            else
            {
                dataquery = "[[gd(2000,01,01),1]]";
            }
            Connection.Close();

            return dataquery;

        }
        public string Getdatatj()
        {

            string strSQL = "";
            strSQL = @"select CONVERT(varchar(4), CreateDate, 120 ) as years --,COUNT(*) as num
                                ,+substring(CONVERT(varchar(10), CreateDate, 120 ),6,2) as months
                                ,substring(CONVERT(varchar(10), CreateDate, 120 ),9,2) as dayss
                                ,count(*) as summ
                                  from   customer a,Employee b,CustomerLog c
                                where  c.CustomerID=a.ID and  a.Owner=b.Name and a.CreateDate > CAST(GETDATE()-30 as date) 
                                and b.Company='总公司'  and c.status='已添加'
                                group by  CONVERT(varchar(4), CreateDate, 120 )  
                                ,+substring(CONVERT(varchar(10), CreateDate, 120 ),6,2) 
                                ,substring(CONVERT(varchar(10), CreateDate, 120 ),9,2)";


            DataSet ds = new DataSet();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
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
            else
            {
                dataquery = "[[gd(2000,01,01),1]]";
            }
            Connection.Close();

            return dataquery;

        }
        public string Getdatasy()
        {

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
            else
            {
                dataquery = "[[gd(2000,01,01),1]]";
            }
            Connection.Close();

            return dataquery;

        }
            [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.ReadWrite)]
          public string Getdataa(string selectitem)
          {

              string strSQL = @"select CONVERT(varchar(4), CreateDate, 120 ) as years --,COUNT(*) as num
                                ,+substring(CONVERT(varchar(10), CreateDate, 120 ),6,2) as months
                                ,substring(CONVERT(varchar(10), CreateDate, 120 ),9,2) as dayss
                                ,count(*) as summ
                                  from   customer a,Employee b,CustomerLog c
                                where  c.CustomerID=a.ID and  a.Owner=b.Name and a.CreateDate > CAST(GETDATE()-30 as date) 
                                and b.Company='总公司' and c.status='"+selectitem+@"'
                                group by  CONVERT(varchar(4), CreateDate, 120 )  
                                ,+substring(CONVERT(varchar(10), CreateDate, 120 ),6,2) 
                                ,substring(CONVERT(varchar(10), CreateDate, 120 ),9,2)";
              DataSet ds = new DataSet();
              Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
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
              Connection.Close();
              return dataquery;

          }

            [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.ReadWrite)]
            public string Getdataalllist(string selectitem)
            {

                string strSQL = @" select  sum(a.tianjia) tianjia,sum(a.feipei) feipei,sum(a.lianxi) lianxi,
                                     sum(a.queren) queren,sum(a.wancheng)  wancheng 
                                     from ( select cast( a.CreateDate as date) as times,
                                      CASE WHEN c.status ='已添加' THEN 1  ELSE 0 END as tianjia ,
                                      CASE WHEN c.status ='已分配' THEN 1  ELSE 0 END  as feipei,
                                      CASE WHEN c.status ='已联系' THEN 1  ELSE 0 END  as lianxi,
                                      CASE WHEN c.status ='已确认' THEN 1  ELSE 0 END  as queren,
                                      CASE WHEN c.status ='已完成' THEN 1  ELSE 0 END  as wancheng 
                                        from   customer a,Employee b,CustomerLog c
                                    where  c.CustomerID=a.ID and  a.Owner=b.Name and a.CreateDate > CAST(GETDATE()-30 as date) 
                                    and b.Company='总公司' and c.status in('已添加','已分配','已联系','已确认','已完成')) a  ";
                DataSet ds = new DataSet();
                Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
                SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
                if (Connection.State == System.Data.ConnectionState.Closed)
                {
                    Connection.Open();
                }

                adapter.Fill(ds);
                string dataquery = "";
                if (ds.Tables[0].Rows.Count > 0)
                {
                    dataquery = ds.Tables[0].Rows[0]["tianjia"].ToString() + "^ " + ds.Tables[0].Rows[0]["feipei"].ToString() + "^ " + ds.Tables[0].Rows[0]["lianxi"].ToString() + "^ " +
       ds.Tables[0].Rows[0]["queren"].ToString() + "^ " + ds.Tables[0].Rows[0]["wancheng"].ToString() ;
         
                }
                Connection.Close();
                return dataquery;

            }
    }
}