Imports System.Data.SqlClient

Public Class Desktop_aspx
    Inherits System.Web.UI.Page
    Dim Connection As SqlConnection = New SqlConnection
    Dim t_id As String = ""
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("user") = "" Then
            Response.Redirect("~/sysindex/Quit.aspx")
        End If
        If Session("user") <> "" Then
            Session.Timeout = 5
        End If
        Connection.ConnectionString = ConfigurationManager.ConnectionStrings("warehouseConnectionString").ConnectionString
        If (Not Page.IsPostBack) Then



            Dim mydata As New GetData(Connection)
            Dim ds As New DataSet()
            ds = mydata.TurnPartsEndUserQuery(Session("user"))
            GridView1.DataSource = ds.Tables(0)
            GridView1.DataBind()
            If ds.Tables(0).Rows.Count > 0 Then


                Label1.Text = "You have Turn Parts waiting to receive. Please confirm."

            Else
                Label1.Text = ""

            End If
            If Connection.State = ConnectionState.Open Then
                Connection.Close()
            End If
        End If
    End Sub

    Protected Sub GridView1_RowCreated(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType <> DataControlRowType.DataRow Then
            Return
        End If

        If e.Row.FindControl("ButtonA") IsNot Nothing Then
            Dim CtlButton As Button = DirectCast(e.Row.FindControl("ButtonA"), Button)

            ' CtlButton.Click += New EventHandler(AddressOf CtlButton_Click)
        End If
    End Sub

    Private Sub CtlButton_Click(sender As Object, e As EventArgs)
        Dim button As Button = DirectCast(sender, Button)
        Dim gvr As GridViewRow = DirectCast(button.Parent.Parent, GridViewRow)
        Dim pk As String = GridView1.DataKeys(gvr.RowIndex).Value.ToString()

        'do something

        'InsusJsUtility objJs = new InsusJsUtility();  //http://www.cnblogs.com/insus/articles/1341703.html
        'objJs.JsAlert(pk);
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim aa As String = DirectCast(sender, Button).CommandArgument.ToString()
        Dim UpdateStr As String = " update turnparts_control set  end_Status='close', end_time=getdate() "
        UpdateStr = UpdateStr & "  where  id=" & DirectCast(sender, Button).CommandArgument.ToString() & " "
        Dim Cmd As New SqlCommand(UpdateStr, Connection)
        '尽可能晚的打开连接，尽早的关闭连接 
        If Connection.State <> ConnectionState.Open Then
            Connection.Open()
        End If

        Cmd.ExecuteNonQuery()
        Dim mydata As New GetData(Connection)
        Dim ds As New DataSet()
        ds = mydata.TurnPartsEndUserQuery(Session("user"))
        GridView1.DataSource = ds.Tables(0)
        GridView1.DataBind()
        If ds.Tables(0).Rows.Count > 0 Then


            Label1.Text = "You have Turn Parts waiting to receive. Please confirm."

        Else
            Label1.Text = ""

        End If
        If Connection.State = ConnectionState.Open Then
            Connection.Close()
        End If
    End Sub

 
    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Dim UpdateStr As String = " update turnparts_control set  end_Status='reject', end_time=getdate() "
        UpdateStr = UpdateStr & "  where  id=" & DirectCast(sender, Button).CommandArgument.ToString() & " "
        Dim Cmd As New SqlCommand(UpdateStr, Connection)
        '尽可能晚的打开连接，尽早的关闭连接 
        If Connection.State <> ConnectionState.Open Then
            Connection.Open()
        End If

        Cmd.ExecuteNonQuery()
        Dim mydata As New GetData(Connection)
        Dim ds As New DataSet()
        ds = mydata.TurnPartsEndUserQuery(Session("user"))
        GridView1.DataSource = ds.Tables(0)
        GridView1.DataBind()
        If ds.Tables(0).Rows.Count > 0 Then


            Label1.Text = "You have Turn Parts waiting to receive. Please confirm."

        Else
            Label1.Text = ""

        End If
        If Connection.State = ConnectionState.Open Then
            Connection.Close()
        End If
    End Sub

 

    
    Protected Sub GridView1_RowUpdating(sender As Object, e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridView1.RowUpdating
        t_id = Server.HtmlDecode(GridView1.Rows(e.RowIndex).Cells(0).Text.ToString())
    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        Dim gvr As GridViewRow = DirectCast(DirectCast(e.CommandSource, Control).Parent.Parent, GridViewRow)
        Dim id As HiddenField = TryCast(gvr.FindControl("id"), HiddenField)
        t_id = id.Value
    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

    End Sub

    Protected Sub GridView1_RowCreated1(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated

    End Sub
End Class