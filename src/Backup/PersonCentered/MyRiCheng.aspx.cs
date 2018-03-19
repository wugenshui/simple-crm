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

namespace CRM.PersonCentered
{
    public partial class MyRiCheng : System.Web.UI.Page
    {

        SqlConnection Connection = new SqlConnection();
        Logic logic = new Logic();

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

            GridView1.DataSource = ds1.Tables[0];
            GridView1.DataKeyNames = new string[] { "id", "Subject", "richengtime", "address", "createdate" };
            GridView1.DataBind();





        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();

            ds = Getdata();

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "id", "Subject", "richengtime", "address", "createdate" };
            GridView1.DataBind();



        }

        #region 获取数据
        private DataSet Getdata()
        {

            string strSQL = "select id, Subject,richengtime,address,createdate from myricheng where emp='" + Session["user"].ToString() + "'  order by createdate  desc    ";
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
                DataKey keys = GridView1.DataKeys[RowIndex];      //行中的数据;
                string OrderID = keys["id"].ToString();

                logic.DeleteRiCheng(OrderID, Connection);
                DataSet ds = new DataSet();

                ds = Getdata();

                GridView1.DataSource = ds.Tables[0];
                GridView1.DataKeyNames = new string[] { "id", "Subject", "richengtime", "address", "createdate" };
                GridView1.DataBind();

                Response.Write("<script>alert('恭喜,删除成功')</script>");
            }
            else if (e.CommandName == "chakan1")
            {
                int RowIndex = Convert.ToInt32(e.CommandArgument);
                DataKey keys = GridView1.DataKeys[RowIndex];      //行中的数据;
                string OrderID = keys["id"].ToString();

                Response.Redirect("QueryRiCheng.aspx?mid=" + OrderID);


            }



        }





    }
}