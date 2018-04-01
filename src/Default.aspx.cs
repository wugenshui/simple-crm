using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CRM
{
    public partial class Default : System.Web.UI.Page
    {
        SqlConnection Connection = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
                Response.Redirect("./Login.aspx");
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
            StringBuilder strb = new StringBuilder();
            StringBuilder strb1 = new StringBuilder();
            strb.Append(@"  <div class=""user_side clearfix"">");
            strb.Append(@"  <img src=""assets/img/odinn.jpg"" alt=""Odinn god of Thunder"">");
            strb.Append(@"  <h5>Odinn</h5>");
            strb.Append(@"  <a href=""#""><i class=""icon-cog""></i> Settings</a>   ");
            strb.Append(@"  </div>");

            Literal1.Text = strb.ToString();

            DataSet ds = new DataSet();
            string ss = Session["user"].ToString();
            ds = GetProgramID(Session["user"].ToString());
            bool flag = false;
            bool flag1 = false;
            string collapseCount = "1";
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                if (ds.Tables[0].Rows[i]["ID1"].ToString().Length < 3)
                {
                    if (flag1)//子节点结尾
                    {
                        strb1.Append(@"   </div>");//子节点结尾
                        strb1.Append(@"   </div>");//子节点结尾
                        strb1.Append(@"   </div>");//父节点结尾
                    }
                    flag = true;
                    flag1 = false;
                    strb1.Append(@"   <div class=""accordion-group"">");
                    strb1.Append(@"   <div class=""accordion-heading"">");
                    strb1.Append(@"   <a class=""accordion-toggle"" data-toggle=""collapse"" target=""ifrmMain"" href=""" + ds.Tables[0].Rows[i]["linkURL"].ToString() + @""" ><i class=""icon-dashboard""></i> <span>" + ds.Tables[0].Rows[i]["DisplayName"].ToString() + @"</span></a>");
                    strb1.Append(@"   </div>");

                }
                else if (flag && (!flag1))//子节点第一个
                {
                    strb1.Append(@" <div id=""collapse" + collapseCount + @""" class=""accordion-body in collapse"" style=""height:auto"">");
                    collapseCount = (Convert.ToInt16(collapseCount) + 1).ToString();
                    flag1 = true;
                    strb1.Append(@"    <div class=""accordion-inner"">");
                    strb1.Append(@" <a class=""accordion-toggle"" target=""ifrmMain"" href=""" + ds.Tables[0].Rows[i]["linkURL"].ToString() + @"""><i class=""icon-star""></i>" + ds.Tables[0].Rows[i]["DisplayName"].ToString() + @"</a>");
                }
                else if (flag && (flag))//子节点第2345个
                {
                    strb1.Append(@" <a class=""accordion-toggle"" target=""ifrmMain"" href=""" + ds.Tables[0].Rows[i]["linkURL"].ToString() + @"""><i class=""icon-star""></i>" + ds.Tables[0].Rows[i]["DisplayName"].ToString() + @"</a>");
                }
                if (i == ds.Tables[0].Rows.Count - 1)
                {
                    if (flag1)
                    {
                        strb1.Append(@"   </div>");//子节点大结尾
                        strb1.Append(@"   </div>");//子节大点结尾
                    }
                    strb1.Append(@"   </div>");//父节大点结尾
                }
            }
            Literal2.Text = strb1.ToString();

        }
        private DataSet GetProgramID(string emp)
        {
            string strSQL = @"select * from Access a,Authority b
                                where a.ID2=b.FatherID and a.ID1=b.ProgramID
                                and b.Name='" + emp + "' order by ID1   ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            Connection.Open();
            adapter.Fill(ds);
            return ds;
        }
        private string GetFatherID(string id1)
        {
            string strSQL = "Select * From Access where id1='" + id1 + "' ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            Connection.Open();
            adapter.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return ds.Tables[0].Rows[0]["ID2"].ToString();
            }
            else
            {
                return "";
            }
        }
        private string GetURLandName(string id1)
        {
            string strSQL = "Select * From Access where id1='" + id1 + "' ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            Connection.Open();
            adapter.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return ds.Tables[0].Rows[0]["DisplayName"].ToString() + "," + ds.Tables[0].Rows[0]["LinkURL"].ToString();
            }
            else
            {
                return ",";
            }
        }
    }
}