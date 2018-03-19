using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using CRM.Class;
using System.Data;
using System.Configuration;
using System.Collections;

namespace CRM.EmployeeControl
{
    public partial class SetPrivilege : System.Web.UI.Page
    {
        SqlConnection Connection = new SqlConnection();
        Logic logic = new Logic();
        string sysRoleID = "";
        ArrayList  alAccountID = new ArrayList();
 
        protected void Page_Load(object sender, EventArgs e)
        {
            // if (Session["user"] == null)
            //    { Response.Redirect("~/LogIn.aspx"); }
            Logic logic = new Logic();
            Connection.ConnectionString = ConfigurationManager.ConnectionStrings["CRMConnection"].ConnectionString;
            sysRoleID = Request.Params["empId"].ToString();
            if (!this.IsPostBack)
            { }

            DataSet ds = new DataSet();
            ds = logic.GetUser("", Connection);
            if (!IsPostBack)
            {

                loadOldMenu(sysRoleID);
                lbRole.Text = "为  " + sysRoleID +" 设置权限";

            }
 

     
        }
         protected void loadOldMenu(string strSysRoleID )
         {
             DataTable dtMainMenuID = new DataTable();
             
               string strSQL = "select programid as MainMenuID from Authority where name= '" + strSysRoleID + "'    ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }
            adapter.Fill(ds);
             if(ds.Tables[0].Rows.Count>0)
             {
                 for(int i=0;i<ds.Tables[0].Rows.Count;i++)
                 {
                     alAccountID.Add(ds.Tables[0].Rows[i]["MainMenuID"].ToString());
                 }
             }
             Create_MainMenu_TreeView();
             MainMenuTreeView.Attributes.Add("onclick", "CheckEvent()");
         }

  
     
        private void  Create_MainMenu_TreeView()
        {
            MainMenuTreeView.Nodes.Clear();
            string strSQL = "select id1 as MainMenuID,id2 as ParentID,displayname as MenuName   from Access  ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }
            adapter.Fill(ds);
            if (ds.Tables[0].Rows.Count == 0)
            { return; }
            this.ViewState["ds"] = ds;
            TreeNode treeNode = new TreeNode();
            AddTree("0", treeNode);
        }
 

        private void AddTree(string ParentID, TreeNode pNode)
        {
            DataSet ds = new DataSet();
            ds =(DataSet)this.ViewState["ds"];
            DataView dvTree = new DataView(ds.Tables[0]);
            //过滤ParentID,得到当前的所有子节点
            dvTree.RowFilter = "[ParentID] = " + ParentID;

            foreach (DataRowView Row in dvTree)
            {
                TreeNode Node = new TreeNode();
                if (pNode.Text == "")
                {
                    //'添加根节点
                    Node.Text = Row["MenuName"].ToString();
                    Node.Value = Row["MainMenuID"].ToString();
                    MainMenuTreeView.Nodes.Add(Node);
                    if (alAccountID.Contains(Row["MainMenuID"].ToString()))
                    { Node.Expanded = true; }
                   
                    //再次递归
                    AddTree(Row["MainMenuID"].ToString(), Node);
                }
                else 
                {
                    //添加当前节点的子节点
                      Node.Text = Row["MenuName"].ToString();
                      Node.Value = Row["MainMenuID"].ToString();
                      pNode.ChildNodes.Add(Node);
                      if (alAccountID.Contains(Row["MainMenuID"].ToString()))
                      { Node.Expanded = true; }
                      AddTree(Row["MainMenuID"].ToString(), Node);
                }
            }
           
        }
        protected void InsertAllSelectNodeID(TreeNodeCollection tnc, String strSysRoleID)
        {
            foreach (TreeNode node in tnc)
            {
               
                if (node.Checked)
                {
                    string strSQL = "select * from Authority where name='" + strSysRoleID + "'  and programid= '" + node.Value.ToString() + "' ";
                    DataSet ds = new DataSet();
                    SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
                    if (Connection.State == System.Data.ConnectionState.Closed)
                    {
                        Connection.Open();
                    }
                    adapter.Fill(ds);
                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        string father = "";
                        if (node.Value.ToString().Length == 1)
                        { father = "0"; }
                        else
                        { father = node.Value.ToString().Substring(0, 1); }
                        string strSQL1 = "insert into Authority ( name,programid,fatherid) VALUES ('" + strSysRoleID + "'  ,  '" + node.Value.ToString() + "','" + father + "')";
                        DataSet ds1 = new DataSet();
                        SqlDataAdapter adapter1 = new SqlDataAdapter(strSQL1, Connection);
                        if (Connection.State == System.Data.ConnectionState.Closed)
                        {
                            Connection.Open();
                        }
                        adapter1.Fill(ds1);
                    }
                }
                else
                {
                    string strSQL = "delete Authority where name='" + strSysRoleID + "'  and programid= '" + node.Value.ToString() + "' ";
                    DataSet ds = new DataSet();
                    SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
                    if (Connection.State == System.Data.ConnectionState.Closed)
                    {
                        Connection.Open();
                    }
                    adapter.Fill(ds);
                }
                if(node.ChildNodes.Count!=0)
                { InsertAllSelectNodeID(node.ChildNodes, strSysRoleID); }
       
    
            }
        }
        //设定系统角色菜单
        protected void btnConfigMenu_Click(Object sender, EventArgs e)
        {
            string strSysRoleID = sysRoleID;
            InsertAllSelectNodeID(MainMenuTreeView.Nodes, strSysRoleID);
            Response.Write("<script>window.alert(' 权限设置成功！')</script>");
        }
 
          protected void btnBack_Click(Object sender, EventArgs e)
        {
            Response.Redirect("privilegeControl.aspx");
        }
     
    }
}