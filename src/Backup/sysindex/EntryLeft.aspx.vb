Imports System.Data.SqlClient

Public Class EntryLeft
    Inherits System.Web.UI.Page
    Dim user As String
    Dim Connection As SqlConnection = New SqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("user") IsNot Nothing Then
            user = TryCast(Session("user"), String)
        Else
            Response.Write("<script>LogIn Error!!!!!Please try login again</script>")
            Return
        End If
        Connection.ConnectionString = ConfigurationManager.ConnectionStrings("warehouseConnectionString").ConnectionString
        If Not IsPostBack Then
            Create_Account_MainMenu_TreeView()
        End If

    End Sub

    Private Sub Create_Account_MainMenu_TreeView()

        Dim isessionAccountID As String = user

        Dim ds As New DataSet()
        '取出菜单数据
        ' If isessionAccountID = "-1" Then
        'Sys_MainMenu
        ' ds = bizSQL.ExecSQL2("select MainMenuID,ParentID,MenuName,linkUrl from Sys_MainMenu Where State ='R' order by AbsIndex DESC")
        '  ElseIf (isessionAccountID = "-2") OrElse (isessionAccountID = "-3") Then
        '  ds = bizSQL.ExecSQL2("select MainMenuID,ParentID,MenuName,linkUrl from Sys_MainMenu Where State in ('R','D','N') order by AbsIndex DESC")
        '   Else
        '菜单要 account_menu + role_menu
        ds = GetAccountMenu(isessionAccountID)
        ' End If
        ' DataSet ds = new RoleBiz().ExecSQL2(strSQL);
        If ds Is Nothing Then
            '弹出提示窗口
            Response.Write("<script>window.alert('Your account is not exist in system.Please connect system administrator')</script>")
            Return
        Else
            Me.ViewState("ds") = ds

            '调用递归函数，完成树形结构的生成
            'addtree(0, (TreeNode)null);
            Dim sb As StringBuilder = Addtree(0)
            Literal1.Text = sb.ToString()
        End If
    End Sub
    'new 递归添加树的节点
    Private Function Addtree(ParentID As Integer) As StringBuilder
        Dim ds As DataSet = DirectCast(Me.ViewState("ds"), DataSet)
        Dim dvTree As New DataView(ds.Tables(0))
        '过滤ParentID,得到当前的所有子节点
        dvTree.RowFilter = "[ParentID] = " & ParentID

        Dim strb As New StringBuilder()
        strb.Append("<div id=""menuContainer"">")
        Dim i As Integer = 1
        For Each Row As DataRowView In dvTree
            If ParentID = 0 Then
                '添加根节点
                Dim url As String = Row("linkUrl").ToString()
                strb.Append(" <dl>")
                strb.Append("<dt  onclick=switchtab(this,document.all.contenttab" & i.ToString() & ")>")
                If url.Length > 7 Then
                    strb.Append("<div><img src=""../Images/index/biao.gif""><a  href=" & Row("linkUrl").ToString().Replace("~", "..") & " target=""ifrmMain"" >" & Row("MenuName").ToString() & "</a></div>")
                Else
                    strb.Append("<div><img src=""../Images/index/biao.gif"">" & Row("MenuName").ToString() & "</div>")
                End If

                ' 
                strb.Append("</dt><dd id=contenttab" & i.ToString() & " style=""display: none""> ")
                strb.Append("<ul>")

                strb.Append(AddSubTree(Int32.Parse(Row("MainMenuID").ToString())))


                strb.Append("</ul></dd></dl>")
            End If
            i += 1
        Next
        strb.Append("</div>")
        Return strb
    End Function
    Private Function AddSubTree(SubID As Integer) As StringBuilder
        Dim ds As DataSet = DirectCast(Me.ViewState("ds"), DataSet)
        Dim dvTree As New DataView(ds.Tables(0))
        '过滤ParentID,得到当前的所有子节点
        dvTree.RowFilter = "[ParentID] = " & SubID

        Dim strb As New StringBuilder()

        For Each Row As DataRowView In dvTree
            Dim url As String = Row("linkUrl").ToString()

            If url.Length > 7 Then
                strb.Append("<li class=""myli""><a  href=" & url.Replace("~", "..") & " target=""ifrmMain"" >" & Row("MenuName").ToString() & "</a></li>")
            End If
        Next
        Return strb
    End Function
    Private Function GetAccountMenu(EmpID As String) As DataSet
        'MainMenuID,ParentID,MenuName,linkUrl,ImageUrl,AbsIndex 

        ' "SELECT [DisplayName], [LinkURL] FROM [access] WHERE ([ActiveFlag] = @ActiveFlag) ORDER BY [seq]"
        Dim ds As New DataSet
        Dim GetStepNoSQL As String

        If EmpID = "admin" Then
            GetStepNoSQL = " SELECT MainMenuID,ParentID, [DisplayName] MenuName, [LinkURL] linkUrl FROM [access] WHERE   MenuControl='Y'  order by mainmenuID "
        Else
            GetStepNoSQL = "SELECT e.MainMenuID,e.ParentID, e.[DisplayName] MenuName, e.[LinkURL] linkUrl FROM ( select b.* from Employees a,access b  where a.Privilege=b.MainMenuID 　and a.EmpID='" & EmpID & "'   union "
            GetStepNoSQL = GetStepNoSQL + " select c.* from Employees a,access b,access c where a.Privilege=b.MainMenuID 　and b.ParentID=c.MainMenuID and a.EmpID='" & EmpID & "') e order by mainmenuID "

        End If

        Dim GetStepNoAdapter As New SqlDataAdapter(GetStepNoSQL, Connection)

        GetStepNoAdapter.Fill(ds)
 

        Return ds
    End Function
End Class