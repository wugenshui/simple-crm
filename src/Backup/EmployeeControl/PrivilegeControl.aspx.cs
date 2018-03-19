using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRM.Class;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace CRM.EmployeeControl
{
    public partial class PrivilegeControl : System.Web.UI.Page
    {       
        SqlConnection Connection = new SqlConnection();
        Logic logic = new Logic();
        protected void Page_Load(object sender, EventArgs e)
        {
           // if (Session["user"] == null)
        //    { Response.Redirect("~/LogIn.aspx"); }
            Logic logic = new Logic();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;

            if (!this.IsPostBack)
            { }

            DataSet ds = new DataSet();
            if (!IsPostBack)
            {
                ds = logic.GetUser("", Connection);
                gvDefine.DataSource = ds.Tables[0];
                gvDefine.DataBind();


            }
        }

        protected void gvDefault_RowCommand(object sender, GridViewCommandEventArgs e)
              {
                  string sysRoleID="";
                  if (e.CommandName == "cmdConfigMenu")
                  {
                      sysRoleID= e.CommandArgument.ToString();
                      Response.Redirect("SetPrivilege.aspx?empId=" + sysRoleID);
                  }
                   
              }
              protected void gvDefine_RowCommand(object sender, GridViewCommandEventArgs e)
              {
                  string sysRoleID="";
                  if(e.CommandName=="cmdConfigMenu")
                  {
                      sysRoleID= e.CommandArgument.ToString();
                      Response.Redirect("SetPrivilege.aspx?empId=" + sysRoleID);
                  }
                   
              }
           protected void btnAdd_Click(object sender, EventArgs e)
              {
                   
                  if(txtSysRoleID.Text.Trim().ToUpper().ToString()=="")
                  {
                        Response.Write("<script>window.alert('请输入账号 !')</script>");
                      return;
                  }
                  DataSet ds = new DataSet();
                   ds = logic.GetUser(txtSysRoleID.Text.Trim().ToUpper().ToString(), Connection);
               if(ds.Tables[0].Rows.Count>0)
               { Response.Write("<script>window.alert('"+txtSysRoleID.Text.Trim().ToUpper().ToString()+"已添加成功!')</script>");
                      return;}
              //   getdata.InsertEmpInfo(txtSysRoleID.Text.Trim.ToUpper.ToString(), txtName.Text.Trim.ToString(), TextBox1.Text.Trim.ToString(), TextBox2.Text.Trim.ToString())
    //    Dim ds1 As DataSet = getdata.GetUserInfo(txtSysRoleID.Text.Trim.ToUpper.ToString(), txtName.Text.Trim.ToString(), TextBox1.Text.Trim.ToString(), TextBox2.Text.Trim.ToString())
     //   gvDefine.DataSource = ds1.Tables(0)
     //   gvDefine.DataBind()
              }
           protected void btnDel_Click(object sender, EventArgs e)
           {

               if (txtSysRoleID.Text.Trim().ToUpper().ToString() == "")
               {
                   Response.Write("<script>window.alert('请输入账号 !')</script>");
                   return;
               }
               DataSet ds = new DataSet();
               ds = logic.GetUser(txtSysRoleID.Text.Trim().ToUpper().ToString(), Connection);
               if (ds.Tables[0].Rows.Count > 0)
               {
                   Response.Write("<script>window.alert('" + txtSysRoleID.Text.Trim().ToUpper().ToString() + "已添加成功!')</script>");
                   return;
               }
               //   getdata.InsertEmpInfo(txtSysRoleID.Text.Trim.ToUpper.ToString(), txtName.Text.Trim.ToString(), TextBox1.Text.Trim.ToString(), TextBox2.Text.Trim.ToString())
               //    Dim ds1 As DataSet = getdata.GetUserInfo(txtSysRoleID.Text.Trim.ToUpper.ToString(), txtName.Text.Trim.ToString(), TextBox1.Text.Trim.ToString(), TextBox2.Text.Trim.ToString())
               //   gvDefine.DataSource = ds1.Tables(0)
               //   gvDefine.DataBind()
           }
           protected void btnSetMenu_Click(object sender, EventArgs e)
           {

               if (txtSysRoleID.Text.Trim().ToUpper().ToString() == "")
               {
                   Response.Write("<script>window.alert('请输入账号 !')</script>");
                   return;
               }
               DataSet ds = new DataSet();
               ds = logic.GetUser(txtSysRoleID.Text.Trim().ToUpper().ToString(), Connection);
               if (ds.Tables[0].Rows.Count > 0)
               {
                   Response.Write("<script>window.alert('" + txtSysRoleID.Text.Trim().ToUpper().ToString() + "已添加成功!')</script>");
                   return;
               }
               //   getdata.InsertEmpInfo(txtSysRoleID.Text.Trim.ToUpper.ToString(), txtName.Text.Trim.ToString(), TextBox1.Text.Trim.ToString(), TextBox2.Text.Trim.ToString())
               //    Dim ds1 As DataSet = getdata.GetUserInfo(txtSysRoleID.Text.Trim.ToUpper.ToString(), txtName.Text.Trim.ToString(), TextBox1.Text.Trim.ToString(), TextBox2.Text.Trim.ToString())
               //   gvDefine.DataSource = ds1.Tables(0)
               //   gvDefine.DataBind()
           }
    }
}