using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Class;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CRM.PersonCentered
{
    public partial class QueryRiCheng : System.Web.UI.Page
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

            subject.Value = ds.Tables[0].Rows[0]["Subject"].ToString();
            times.Value = ds.Tables[0].Rows[0]["richengtime"].ToString();
            addr.Value = ds.Tables[0].Rows[0]["address"].ToString();

            testa.InnerHtml = ds.Tables[0].Rows[0]["detail"].ToString();
            subject.Attributes.Add("readonly", "readonly");
            times.Attributes.Add("readonly", "readonly");
            addr.Attributes.Add("readonly", "readonly");

        }
        public DataSet Getdata(string messageid)
        {

            string strSQL = "select * from myricheng where id= '" + messageid + "'    ";
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