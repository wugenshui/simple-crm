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
    public partial class CustomerListaspx : System.Web.UI.Page
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
            logic.GetMenu("客户管理", Session["user"].ToString(), Connection).ToString();
            if (!this.IsPostBack)
            { }

                DataSet ds1 = new DataSet();
                ds1 = Getdata(name.Value.ToString().Trim());

                GridView1.DataSource = ds1.Tables[0];
                GridView1.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
                GridView1.DataBind();
                DataSet ds2 = new DataSet();
                ds2 = Getdataweiqueren(noconfirmCust.Value.ToString().Trim());
                GridViewnoconfirmCust.DataSource = ds2.Tables[0];
                GridViewnoconfirmCust.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
                GridViewnoconfirmCust.DataBind();
                DataSet ds3 = new DataSet();
                ds3 = Getdatayiqueren(yiquerencust.Value.ToString().Trim());
                GridViewyiqueren.DataSource = ds3.Tables[0];
                GridViewyiqueren.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
                GridViewyiqueren.DataBind();
                DataSet ds4 = new DataSet();
                ds4 = Getdatayifenpei(yifenpeicust.Value.ToString().Trim());
                GridViewyifenpei.DataSource = ds4.Tables[0];
                GridViewyifenpei.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
                GridViewyifenpei.DataBind();
                DataSet ds5 = new DataSet();
                ds5 = Getdatayilianxi(yilianxicust.Value.ToString().Trim());
                GridViewyilianxi.DataSource = ds5.Tables[0];
                GridViewyilianxi.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
                GridViewyilianxi.DataBind();
                DataSet ds6 = new DataSet();
                ds6 = Getdatayiwancheng(yilianxicust.Value.ToString().Trim());
                GridViewyiwancheng.DataSource = ds6.Tables[0];
                GridViewyiwancheng.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
                GridViewyiwancheng.DataBind();
                if (Session["tab"] != null)
                { HiddenFieldTab.Value = Session["tab"].ToString(); }
            #region tab控制
            if (HiddenFieldTab.Value == "t1")
            {
                t1.Attributes.Add("class", "active"); 
                t2.Attributes.Add("class", "");
            t3.Attributes.Add("class", "");
            t4.Attributes.Add("class", "");
            t5.Attributes.Add("class", "");
            t6.Attributes.Add("class", "");
            tab1.Attributes.Add("class", "tab-pane active");
            tab2.Attributes.Add("class", "tab-pane");
            tab3.Attributes.Add("class", "tab-pane");
            tab4.Attributes.Add("class", "tab-pane");
            tab5.Attributes.Add("class", "tab-pane");
            tab6.Attributes.Add("class", "tab-pane");
            }
            else if (HiddenFieldTab.Value == "t2")
            {
                t2.Attributes.Add("class", "active");
                t3.Attributes.Add("class", "");
                t4.Attributes.Add("class", "");
                t5.Attributes.Add("class", "");
                t6.Attributes.Add("class", "");
                t1.Attributes.Add("class", "");
                tab1.Attributes.Add("class", "tab-pane");
                tab2.Attributes.Add("class", "tab-pane active");
                tab3.Attributes.Add("class", "tab-pane");
                tab4.Attributes.Add("class", "tab-pane");
                tab5.Attributes.Add("class", "tab-pane");
                tab6.Attributes.Add("class", "tab-pane");
            }
            else if (HiddenFieldTab.Value == "t3")
            {
                t3.Attributes.Add("class", "active"); t1.Attributes.Add("class", "");
                t2.Attributes.Add("class", "");
                t4.Attributes.Add("class", "");
                t5.Attributes.Add("class", "");
                t6.Attributes.Add("class", "");
                tab1.Attributes.Add("class", "tab-pane");
                tab3.Attributes.Add("class", "tab-pane active");
                tab2.Attributes.Add("class", "tab-pane");
                tab4.Attributes.Add("class", "tab-pane");
                tab5.Attributes.Add("class", "tab-pane");
                tab6.Attributes.Add("class", "tab-pane");
            }
            else if (HiddenFieldTab.Value == "t4")
            {
                t4.Attributes.Add("class", "active"); t1.Attributes.Add("class", "");
                t3.Attributes.Add("class", "");
                t2.Attributes.Add("class", "");
                t5.Attributes.Add("class", "");
                t6.Attributes.Add("class", "");
                tab1.Attributes.Add("class", "tab-pane");
                tab4.Attributes.Add("class", "tab-pane active");
                tab3.Attributes.Add("class", "tab-pane");
                tab2.Attributes.Add("class", "tab-pane");
                tab5.Attributes.Add("class", "tab-pane");
                tab6.Attributes.Add("class", "tab-pane");
            }
            else if (HiddenFieldTab.Value == "t5")
            {
                t5.Attributes.Add("class", "active"); t1.Attributes.Add("class", "");
                t3.Attributes.Add("class", "");
                t4.Attributes.Add("class", "");
                t2.Attributes.Add("class", "");
                t6.Attributes.Add("class", "");
                tab1.Attributes.Add("class", "tab-pane");
                tab5.Attributes.Add("class", "tab-pane active");
                tab3.Attributes.Add("class", "tab-pane");
                tab4.Attributes.Add("class", "tab-pane");
                tab2.Attributes.Add("class", "tab-pane");
                tab6.Attributes.Add("class", "tab-pane");
            }
            else if (HiddenFieldTab.Value == "t6")
            {
                t6.Attributes.Add("class", "active"); t1.Attributes.Add("class", "");
                t3.Attributes.Add("class", "");
                t4.Attributes.Add("class", "");
                t5.Attributes.Add("class", "");
                t2.Attributes.Add("class", "");
                tab1.Attributes.Add("class", "tab-pane");
                tab6.Attributes.Add("class", "tab-pane active");
                tab3.Attributes.Add("class", "tab-pane");
                tab4.Attributes.Add("class", "tab-pane");
                tab5.Attributes.Add("class", "tab-pane");
                tab2.Attributes.Add("class", "tab-pane");
            }
            else 
            {
                t1.Attributes.Add("class", "active");
                tab1.Attributes.Add("class", "tab-pane active");
            }


            #endregion


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            if (HiddenFieldTab.Value == "t1")
            {
                ds = Getdata(name.Value.ToString().Trim());

                GridView1.DataSource = ds.Tables[0];
                GridView1.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
                GridView1.DataBind();
            }
            else if (HiddenFieldTab.Value == "t2")
            {
                ds = Getdata(name.Value.ToString().Trim());
                GridViewnoconfirmCust.DataSource = ds.Tables[0];
                GridViewnoconfirmCust.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
                GridViewnoconfirmCust.DataBind();
            }
            
            

        }
        protected void Buttonhuifang_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridView1.DataBind();

        }
        protected void Buttongenjin_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridView1.DataBind();

        }
        protected void Buttonchakan_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridView1.DataBind();

        }
        protected void Buttoncustlist_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridView1.DataBind();

        }
        protected void Buttonnoconfirm_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridView1.DataBind();

        }
        protected void Buttonconfirm_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridView1.DataBind();

        }
        protected void Buttonassgin_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridView1.DataBind();

        }
        protected void Buttonconnect_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridView1.DataBind();

        }
        protected void Buttonfinish_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridView1.DataBind();

        }
        #region 获取数据
        private DataSet Getdata(string teamName)
        {

            string strSQL = "Select * From customer where customername like '" + teamName + "%'  ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();
            return ds;

        }
        private DataSet Getdataweiqueren(string teamName)
        {

            string strSQL = "Select * From customer where status='未确认' and customername like '" + teamName + "%'  ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();
            return ds;

        }
        private DataSet Getdatayiqueren(string teamName)
        {

            string strSQL = "Select * From customer where status='已确认'and customername like '" + teamName + "%'  ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();
            return ds;

        }
        private DataSet Getdatayifenpei(string teamName)
        {

            string strSQL = "Select * From customer where status='已分配'and customername like '" + teamName + "%'  ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();
            return ds;

        }
        private DataSet Getdatayilianxi(string teamName)
        {

            string strSQL = "Select * From customer where status='已联系'and customername like '" + teamName + "%'  ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();
            return ds;

        }
        private DataSet Getdatayiwancheng(string teamName)
        {

            string strSQL = "Select * From customer where status='已完成'and customername like '" + teamName + "%'  ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();
            return ds;

        }
        #endregion
        private DataSet Deletedata(string teamName)
        {

            string strSQL = "delete customer where customername = '" + teamName + "'  ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }
            adapter.Fill(ds);
            Connection.Close();
            return ds;

        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.EditRowStyle.BackColor = Color.Pink;
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());

            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridView1.DataBind();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            string name1 = GridView1.DataKeys[e.RowIndex]["customername"].ToString().Trim();

            Deletedata(name1);
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridView1.DataBind();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            DataSet ds = new DataSet();
            ds = Getdata(name.Value.ToString().Trim());
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataKeyNames = new string[] { "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridView1.DataBind();
        }
        public string Getemp()
        {
            DataSet ds = new DataSet();
            ds = logic.GetEmployeeList(Connection);
            string companylist = "";
            if (ds.Tables[0].Rows.Count > 0)
            {


                for (int s = 0; s < ds.Tables[0].Rows.Count; s++)
                {
                    if (s == 0)
                    { companylist = ds.Tables[0].Rows[s]["name"].ToString(); }
                    else

                    { companylist = companylist + "," + ds.Tables[0].Rows[s]["name"].ToString(); }
                }

            }
            return companylist;
        }
        #region  未确认客户
        protected void btnOpenClick(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                int RowIndex = Convert.ToInt32(e.CommandArgument);
                DataKey keys = GridViewnoconfirmCust.DataKeys[RowIndex];      //行中的数据;
                string perid = keys["customername"].ToString();
                string id = keys["id"].ToString();
                Session["tab"] = "t2";
                Response.Redirect("QueryCustomer.aspx?name=" + perid + "&id=''" + id);
            }
            else if (e.CommandName == "chakan1")
            {
                int RowIndex = Convert.ToInt32(e.CommandArgument);
                DataKey keys = GridView1.DataKeys[RowIndex];      //行中的数据;
                string perid = keys["customername"].ToString();
                string id = keys["id"].ToString();
                Session["tab"] = "t1";
                Response.Redirect("QueryCustomer.aspx?name=" + perid + "&id=" + id);
   
 
            }
            else if (e.CommandName == "update2")
            {
                int RowIndex = Convert.ToInt32(e.CommandArgument);
                DataKey keys = GridViewnoconfirmCust.DataKeys[RowIndex];      //行中的数据;
                string name = keys["customername"].ToString();
                string type = keys["customertype"].ToString();
                string phone = keys["customerphone"].ToString();
                string qq = keys["customerqq"].ToString();
                string mail = keys["mail"].ToString();
                string customerID = keys["customerID"].ToString();
                string homeaddress = keys["homeaddress"].ToString();
                string owner = keys["owner"].ToString();
                string contract = keys["contract"].ToString();
                Session["tab"] = "t2";
                Response.Redirect(@"Updatecustweiqueren.aspx?name=" + name + @"&type=" + type + @"&phone=" + phone + @"&qq="
                    + qq + @"&mail=" + mail + @"&customerID=" + customerID + @"&homeaddress=" + homeaddress + 
                   @"&owner=" + owner + @"&contract=" + contract );
            }
            else if (e.CommandName == "Details11")
            {
                int RowIndex = Convert.ToInt32(e.CommandArgument);
                DataKey keys = GridViewnoconfirmCust.DataKeys[RowIndex];      //行中的数据;
                string perid = keys["customername"].ToString();
                //Literal3.Text = perid;
                //  Response.Write("<script>alert('"+perid+"!')</script>");
            }
            else if (e.CommandName == "yiquerenchakan")
            {
                int RowIndex = Convert.ToInt32(e.CommandArgument);
                DataKey keys = GridViewyiqueren.DataKeys[RowIndex];      //行中的数据;
                string perid = keys["customername"].ToString();
                string id = keys["id"].ToString();
                Session["tab"] = "t3";
                Response.Redirect("QueryCustomer.aspx?name=" + perid + "&id=" + id);
            
            }
            else if (e.CommandName == "yifenpeichakan")
            {
                int RowIndex = Convert.ToInt32(e.CommandArgument);
                DataKey keys = GridViewyifenpei.DataKeys[RowIndex];      //行中的数据; 
                string perid = keys["customername"].ToString();
                string id = keys["id"].ToString();
                Session["tab"] = "t4";
                Response.Redirect("QueryCustomer.aspx?name=" + perid + "&id=" + id);
            }
            else if (e.CommandName == "yilianxichakan")
            {
                int RowIndex = Convert.ToInt32(e.CommandArgument);
                DataKey keys = GridViewyilianxi.DataKeys[RowIndex];      //行中的数据; 
                string perid = keys["customername"].ToString();
                string id = keys["id"].ToString();
                Session["tab"] = "t5";
                Response.Redirect("QueryCustomer.aspx?name=" + perid + "&id=" + id);
            }
            else if (e.CommandName == "yiwanchengchakan")
            {
                int RowIndex = Convert.ToInt32(e.CommandArgument);
                DataKey keys = GridViewyiwancheng.DataKeys[RowIndex];      //行中的数据; 
                string perid = keys["customername"].ToString();
                string id = keys["id"].ToString();
                Session["tab"] = "t6";
                Response.Redirect("QueryCustomer.aspx?name=" + perid + "&id=" + id);
            }
        }
        protected void Buttonweiqueren2_check(object sender, EventArgs e)
        {

            DataSet ds = new DataSet();
            ds = Getdataweiqueren(noconfirmCust.Value.ToString().Trim());
            GridViewnoconfirmCust.DataSource = ds.Tables[0];
            GridViewnoconfirmCust.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewnoconfirmCust.DataBind();
        }
 
        protected void Buttonchakan2_Click(object sender, EventArgs e)
        {
            string s_url;
            s_url = "b.aspx?name=" ;
            Response.Redirect(s_url); 

        }
        protected void hd(object sender, EventArgs e)
        {
            tableidcust.InnerHtml = HiddenField1.Value;
            HiddenField1.Value = HiddenField1.Value;
            id2 = HiddenField1.Value;

        }
        protected void Buttongenjin2_Click(object sender, EventArgs e)
        {
            string strSQL = @"insert into CustomerLog(CustomerID,status,remark,emp,logdate)
                             values('" + HiddenField1.Value + "','已跟进','" + eventname.Value.ToString().Trim() + "','" + Session["user"].ToString() + "',getdate()) ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();
            UpdateStatus("已跟进");
           
            ds = Getdataweiqueren(noconfirmCust.Value.ToString().Trim());
           
            GridViewnoconfirmCust.DataSource = ds.Tables[0];
            GridViewnoconfirmCust.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewnoconfirmCust.DataBind();

        }
        protected void Buttonxiugai2_Click(object sender, EventArgs e)
        {
            Response.Redirect("customer/Updatecustweiqueren.aspx?id=" + id2);
           
        }
        protected void Buttonzuifei2_Click(object sender, EventArgs e)
        {
            string strSQL = @"insert into CustomerLog(CustomerID,status,remark,emp,logdate)
                             values('" + HiddenField1.Value + "','已作废','" + Text1.Value.ToString().Trim() + "','" + Session["user"].ToString() + "',getdate()) ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();
            UpdateStatus("已作废");
          
            ds = Getdataweiqueren(noconfirmCust.Value.ToString().Trim());
            GridViewnoconfirmCust.DataSource = ds.Tables[0];
            GridViewnoconfirmCust.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewnoconfirmCust.DataBind();
        }
        protected void Buttonqueren2_Click(object sender, EventArgs e)
        {
            if (!logic.CheckConfirmAuthority(Session["user"].ToString(), Connection))
            {
                Response.Write("<script>alert(' 您无权限确认,请通知主管或经理确认！')</script>");
                return;
            }
            string strSQL = @"insert into CustomerLog(CustomerID,status,remark,emp,logdate)
                             values('" + HiddenField1.Value + "','已确认','" + eventname.Value.ToString().Trim() + "','" + Session["user"].ToString() + "',getdate()) ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();
            UpdateStatus("已确认");
            
            ds = Getdataweiqueren(noconfirmCust.Value.ToString().Trim());
            GridViewnoconfirmCust.DataSource = ds.Tables[0];
            GridViewnoconfirmCust.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewnoconfirmCust.DataBind();

        }
        #endregion  未确认客户
        private void UpdateStatus(string status)
        {
            string strSQL = @"update customer set status = '" + status + @"',updatedate=getdate()
                             where ID='" + HiddenField1.Value + "'    ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);

            Connection.Close();
        }
        private void UpdateStatus(string status,string feipeikefu)
        {
            string strSQL = @"update customer set status = '" + status + @"',OM = '" + feipeikefu + @"',updatedate=getdate()
                             where ID='" + HiddenField1.Value + "'    ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();

        }
        private void InsertCustomerVisit(string id, string form,string emp)
        {
            string strSQL = @"insert into  customervisit(customerID,sourceform,sourceemp,createdate,status)
                              values ('" + id + @"','" + form + @"' ,'" + emp + @"',getdate(),'wait')    ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);

            Connection.Close();
        }
        private bool CheckCustomerVisitDouble(string id)
        {
            string strSQL = @"select * from customervisit 
                            where  customerID='" + id + @"' and status='wait'    ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();
            if (ds.Tables[0].Rows.Count > 0)
            { return true;}
            else
            { return false; }
        }
        #region 已确认客户

        protected void Buttonyiqueren2_check(object sender, EventArgs e)
        {

            DataSet ds = new DataSet();
            ds = Getdatayiqueren(yiquerencust.Value.ToString().Trim());
            GridViewyiqueren.DataSource = ds.Tables[0];
            GridViewyiqueren.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewyiqueren.DataBind();
        }
        protected void Buttonyiquerengenjin_Click(object sender, EventArgs e)
        {

            DataSet ds = new DataSet();
            ds = Getdata(yiquerencust.Value.ToString().Trim());
            GridViewyiqueren.DataSource = ds.Tables[0];
            GridViewyiqueren.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewyiqueren.DataBind();
        }
        protected void Buttonyiquerenfenpei_Click(object sender, EventArgs e)
        {

            string strSQL = @"insert into CustomerLog(CustomerID,status,remark,emp,logdate)
                             values('" + HiddenField1.Value + "','已分配','" + eventname.Value.ToString().Trim() + "','" + Session["user"].ToString() + "',getdate()) ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();
            UpdateStatus("已分配", HiddenFieldfenpeikefu.Value.ToString().Trim());
     
            ds = Getdatayiqueren(yiquerencust.Value.ToString().Trim());
            GridViewyiqueren.DataSource = ds.Tables[0];
            GridViewyiqueren.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewyiqueren.DataBind();
            Connection.Close();
        }
        protected void Buttonzanbulianxiyfp_Click(object sender, EventArgs e)
        {

            string strSQL = @"insert into CustomerLog(CustomerID,status,remark,emp,logdate)
                             values('" + HiddenField1.Value + "','暂不联系','" + zanbulianxiyfpremark.Value.ToString().Trim() + "','" + Session["user"].ToString() + "',getdate()) ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();

            string strSQL1 = @"insert into CustomerNoContact(CustomerID,status,remark,emp,createdate,customername,phone,qq,mail,companyowner,contactdate)
                             values('" + HiddenField1.Value + "','new','" + eventname.Value.ToString().Trim() + "','" + Session["user"].ToString() + "',getdate()),'" + zanbulianxiyfpcnamex.InnerText.ToString().Trim()
                                       + "','" + zanbulianxiyfpcphone.InnerText.ToString().Trim() + "','" + zanbulianxiyfpcqq.InnerText.ToString().Trim() + "','" + zanbulianxiyfpcqq.InnerText.ToString().Trim() +
                                       "','','' ,cast('" + txtdate.Value.ToString().Trim() + "' as date) ";
                                      
            DataSet ds1 = new DataSet();
            SqlDataAdapter adapter1 = new SqlDataAdapter(strSQL1, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter1.Fill(ds1);
            Connection.Close();
            UpdateStatus("暂不联系", HiddenFieldfenpeikefu.Value.ToString().Trim());

            ds = Getdatayiqueren(yiquerencust.Value.ToString().Trim());
            GridViewyiqueren.DataSource = ds.Tables[0];
            GridViewyiqueren.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewyiqueren.DataBind();
            Connection.Close();
        }
        #endregion

        #region 已分配客户
        protected void Buttonyifenpei2_check(object sender, EventArgs e)
        {

            DataSet ds = new DataSet();
            ds = Getdatayifenpei(yifenpeicust.Value.ToString().Trim());
            GridViewyifenpei.DataSource = ds.Tables[0];
            GridViewyifenpei.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewyifenpei.DataBind();
        }
        protected void Buttonyifenpeigenjin_Click(object sender, EventArgs e)
        {

            string strSQL = @"insert into CustomerLog(CustomerID,status,remark,emp,logdate)
                             values('" + HiddenField1.Value + "','已联系','" + Text5.Value.ToString().Trim() + "','" + Session["user"].ToString() + "',getdate()) ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();
            UpdateStatus("已联系");

            ds = Getdatayifenpei(yiquerencust.Value.ToString().Trim());
            GridViewyifenpei.DataSource = ds.Tables[0];
            GridViewyifenpei.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewyifenpei.DataBind();
        }
        protected void Buttonyifenpeihuifang_Click(object sender, EventArgs e)
        {
            if (CheckCustomerVisitDouble(HiddenField1.Value))
            { Response.Write("<script>alert('已经对该客户做过回访操作！无需重复回访操作')</script>"); return; }
            DataSet ds = new DataSet();
            string strSQL = @"insert into CustomerLog(CustomerID,status,remark,emp,logdate)
                             values('" + HiddenField1.Value + "','已分配回访','" + yifenpeihuifangremark.Value.ToString().Trim() + "','" + Session["user"].ToString() + "',getdate()) ";
            
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();
            /*   UpdateStatus("已联系");*/
            InsertCustomerVisit(HiddenField1.Value, "已分配", Session["user"].ToString());
            ds = Getdatayifenpei(yiquerencust.Value.ToString().Trim());
            GridViewyifenpei.DataSource = ds.Tables[0];
            GridViewyifenpei.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewyifenpei.DataBind();
        }
        #endregion

        #region 已联系
        protected void Buttonyilianxi_check(object sender, EventArgs e)
        {

            DataSet ds = new DataSet();
            ds = Getdatayilianxi(yilianxicust.Value.ToString().Trim());
            GridViewyilianxi.DataSource = ds.Tables[0];
            GridViewyilianxi.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewyilianxi.DataBind();
        }
        protected void Buttonyilianxigenjin_Click(object sender, EventArgs e)
        {

            string strSQL = @"insert into CustomerLog(CustomerID,status,remark,emp,logdate)
                             values('" + HiddenField1.Value + "','已完成','" + yilianxigenjinremark.Value.ToString().Trim() + "','" + Session["user"].ToString() + "',getdate()) ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();
            UpdateStatus("已完成");

            ds = Getdatayilianxi(yilianxicust.Value.ToString().Trim());
            GridViewyilianxi.DataSource = ds.Tables[0];
            GridViewyilianxi.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewyilianxi.DataBind();
        }
        protected void Buttonyilianxihuifang_Click(object sender, EventArgs e)
        {
            if (CheckCustomerVisitDouble(HiddenField1.Value))
            { Response.Write("<script>alert('已经对该客户做过回访操作！无需重复回访操作')</script>"); return; }
            string strSQL = @"insert into CustomerLog(CustomerID,status,remark,emp,logdate)
                             values('" + HiddenField1.Value + "','已联系回访','" + yilianxihuifangremark.Value.ToString().Trim() + "','" + Session["user"].ToString() + "',getdate()) ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();
            //UpdateStatus("已完成");
            InsertCustomerVisit(HiddenField1.Value, "已联系", Session["user"].ToString());
            ds = Getdatayilianxi(yilianxicust.Value.ToString().Trim());
            GridViewyilianxi.DataSource = ds.Tables[0];
            GridViewyilianxi.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewyilianxi.DataBind();
        }
        #endregion
        #region 已完成客户
        protected void Buttonyiwancheng_check(object sender, EventArgs e)
        {

            DataSet ds = new DataSet();
            ds = Getdatayiwancheng(yiwanchengcust.Value.ToString().Trim());
            GridViewyiwancheng.DataSource = ds.Tables[0];
            GridViewyiwancheng.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewyiwancheng.DataBind();
        }
        protected void Buttonyiwanchenggenjin_Click(object sender, EventArgs e)
        {

            string strSQL = @"insert into CustomerLog(CustomerID,status,remark,emp,logdate)
                             values('" + HiddenField1.Value + "','已完成2','" + yiwanchenggenjinremark.Value.ToString().Trim() + "','" + Session["user"].ToString() + "',getdate()) ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();
            UpdateStatus("已完成");

            ds = Getdatayiwancheng(yiwanchengcust.Value.ToString().Trim());
            GridViewyiwancheng.DataSource = ds.Tables[0];
            GridViewyiwancheng.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewyiwancheng.DataBind();
        }
        protected void Buttonyiwanchenghuifang_Click(object sender, EventArgs e)
        {     
            if (CheckCustomerVisitDouble(HiddenField1.Value))
            { Response.Write("<script>alert('已经对该客户做过回访操作！无需重复回访操作')</script>"); return; }
            string strSQL = @"insert into CustomerLog(CustomerID,status,remark,emp,logdate)
                             values('" + HiddenField1.Value + "','已完成回访','" + yiwanchenghuifangremark.Value.ToString().Trim() + "','" + Session["user"].ToString() + "',getdate()) ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }

            adapter.Fill(ds);
            Connection.Close();
           // UpdateStatus("已完成");
            InsertCustomerVisit(HiddenField1.Value, "已完成", Session["user"].ToString());
            ds = Getdatayiwancheng(yiwanchengcust.Value.ToString().Trim());
            GridViewyiwancheng.DataSource = ds.Tables[0];
            GridViewyiwancheng.DataKeyNames = new string[] { "id", "customername", "customertype", "customerphone", "customerqq", "mail", "customerID", "homeaddress", "owner", "contract", "status", "createdate", "createemp" };
            GridViewyiwancheng.DataBind();
        }
        #endregion
    }
}