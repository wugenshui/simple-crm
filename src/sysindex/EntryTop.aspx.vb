Imports System.Data.SqlClient

Public Class EntryTop
    Inherits System.Web.UI.Page
    Dim user As String
    Dim Connection As SqlConnection = New SqlConnection
    Protected Sub Page_Init(sender As Object, e As EventArgs)
        If Session("user") IsNot Nothing Then
            user = TryCast(Session("user"), String)

        Else
            Return
        End If

    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Connection.ConnectionString = ConfigurationManager.ConnectionStrings("warehouseConnectionString").ConnectionString
        user = TryCast(Session("user"), String)
        If Not IsPostBack Then

            '显示公司，部门，姓名，帐号等信息
            ShowBaseInfo()
        End If


    End Sub
    Private Sub ShowBaseInfo()
        lbAccount.Text = user
        '  lbSoftCnName.Text = "lbSoftCnName" 'XmlUtility.getSMSKey("ComCnName")
        ' Dim dt As DataTable = accountBiz.GetOneInfo(account)
        ' If dt.Rows.Count > 0 Then
        ' lbEmpName.Text = "lbEmpName" 'dt.Rows(0)("EmpName").ToString()
        '  End If



        'Dim dt2 As DataTable = departmentBiz.GetLists("Select Name from Admin_Department Where DeptID=" & iSessionCompanyID)

        'If dt2.Rows.Count > 0 Then
        lbCompanyName.Text = "IGS" ' dt2.Rows(0)("Name").ToString()


        ' End If


        ' Dim dt3 As DataTable = departmentBiz.GetLists("Select Name from Admin_Department Where DeptID=" & iSessionDepartmentID)

        ' If dt3.Rows.Count > 0 Then
        ' lbDepartmentName.Text = "lbDepartmentName" 'dt3.Rows(0)("Name").ToString()
        '  End If
        Dim strSQL As [String] = "select distinct empID, FirstName,LastName,Department from Employees  where EmpID='" & user & "' "
        Connection.Open()
        Dim ds As New DataSet
        Dim GetStepNoAdapter As New SqlDataAdapter(strSQL, Connection)
        GetStepNoAdapter.Fill(ds)


        lbEmpName.Text = ds.Tables(0).Rows(0)("FirstName").ToString() & " " & ds.Tables(0).Rows(0)("LastName").ToString()
        lbDepartmentName.Text = ds.Tables(0).Rows(0)("Department").ToString()
        Connection.Close()


    End Sub
End Class