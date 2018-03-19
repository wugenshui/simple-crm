<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="CRM.EmployeeControl.EmployeeList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
 <!DOCTYPE html>
<html lang="en">
<head>
<title>员工列表</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="../css/colorpicker.css" />
<link rel="stylesheet" href="../css/datepicker.css" />
<link rel="stylesheet" href="../css/uniform.css" />
<link rel="stylesheet" href="../css/select2.css" />
<link rel="stylesheet" href="../css/matrix-style.css" />
<link rel="stylesheet" href="../css/matrix-media.css" />
<link rel="stylesheet" href="../css/bootstrap-wysihtml5.css" />
<link href="../font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
 <style  type="text/css">
html,body{background:#FFFFFF;}
</style>
</head>
<body>

 

<div id="content1">
 
<div id="content-header">
  <div id="breadcrumb"  > <a href="index.aspx" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="#" class="tip-bottom">员工管理</a> <a href="#" class="current">员工列表</a> </div>
</div>
<div class="container-fluid">
   
  <div class="row-fluid">
    <div class="span12">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>员工列表</h5>
        </div>
            <div class="widget-content nopadding">
             <form id="Form1" action="#"  class="form-horizontal" runat="server">
            <div class="control-group">
              <label class="control-label">员工姓名 :</label>
              <div class="controls">
                <input style="width:220px;" runat="server"  id="name"   type="text" class="span11" placeholder="员工姓名" />
                    <asp:Button ID="Button2" runat="server" Text="查询" 
                      Height="29px" Width="66px" />
              </div>
            </div>
      
            <table class="table table-bordered table-striped" >
      
              <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        BackColor="White"   BorderStyle="None" BorderWidth="1px"   CssClass="GridViewStyle"
        CellPadding="4" Width="100%" AutoGenerateColumns="false" 
        onrowcancelingedit="GridView1_RowCancelingEdit" 
        onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" onrowupdating="GridView1_RowUpdating">
        <Columns>
            <asp:TemplateField HeaderText="姓名"> <ItemTemplate> <%# Eval("name") %> </ItemTemplate> </asp:TemplateField>
            <asp:TemplateField HeaderText="所属公司"><ItemTemplate> <%# Eval("company") %> </ItemTemplate>
                   <EditItemTemplate>
                    <asp:TextBox ID="CompanyName" runat="server"  text=<%# Eval("company") %>></asp:TextBox> 
                </EditItemTemplate><ControlStyle Width="80%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="所属团队"><ItemTemplate> <%# Eval("team")%> </ItemTemplate>  <EditItemTemplate>
                    <asp:TextBox ID="team" runat="server"  text=<%# Eval("team") %>></asp:TextBox> 
                </EditItemTemplate><ControlStyle Width="80%" /></asp:TemplateField>
            <asp:TemplateField HeaderText="职位"><ItemTemplate> <%# Eval("post") %> </ItemTemplate>  <EditItemTemplate>
                    <asp:TextBox ID="post" runat="server"  text=<%# Eval("post") %>></asp:TextBox> 
                </EditItemTemplate><ControlStyle Width="80%" /></asp:TemplateField>
            <asp:TemplateField HeaderText="主管"><ItemTemplate> <%# Eval("supervisor") %> </ItemTemplate>  <EditItemTemplate>
                    <asp:TextBox ID="supervisor" runat="server"  text=<%# Eval("supervisor") %>></asp:TextBox> 
                </EditItemTemplate><ControlStyle Width="80%" /></asp:TemplateField>
            <asp:TemplateField HeaderText="电话"><ItemTemplate> <%# Eval("phonenumber") %> </ItemTemplate>  <EditItemTemplate>
                    <asp:TextBox ID="phonenumber" runat="server"  text=<%# Eval("phonenumber") %>></asp:TextBox> 
                </EditItemTemplate><ControlStyle Width="80%" /></asp:TemplateField>
            <asp:TemplateField HeaderText="QQ"><ItemTemplate> <%# Eval("qqnumber") %> </ItemTemplate>  <EditItemTemplate>
                    <asp:TextBox ID="qqnumber" runat="server"  text=<%# Eval("qqnumber") %>></asp:TextBox> 
                </EditItemTemplate><ControlStyle Width="80%" /></asp:TemplateField>
            <asp:TemplateField HeaderText="状态"><ItemTemplate> <%# Eval("status") %> </ItemTemplate>  <EditItemTemplate>
                    <asp:TextBox ID="status" runat="server"  text=<%# Eval("status") %>></asp:TextBox> 
                </EditItemTemplate><ControlStyle Width="80%" /></asp:TemplateField>
            <asp:TemplateField HeaderText="入职时间"><ItemTemplate> <%# Eval("workstartdate") %> </ItemTemplate>  <EditItemTemplate>
                    <asp:TextBox ID="workstartdate" runat="server"  text=<%# Eval("workstartdate") %>></asp:TextBox> 
                </EditItemTemplate><ControlStyle Width="80%" /></asp:TemplateField>
      
            <asp:CommandField HeaderText="操作" ShowEditButton="True" SelectText="查看" 
                ShowDeleteButton="True" ShowSelectButton="True" />
        </Columns>
        <FooterStyle  CssClass="GridViewFooterStyle"/>
        <HeaderStyle CssClass="GridViewHeaderStyle" />
        <PagerStyle CssClass="GridViewPagerStyle" />
        <RowStyle CssClass="GridViewRowStyle" />
        <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
            </table>
            </form>
          </div>
      </div>
    </div>
  </div>
  
</div>
 
</div>
<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; MatAdmin.</div>
</div>
<!--end-Footer-part--> 
<script src="../js/jquery.min.js"></script> 
<script src="../js/jquery.ui.custom.js"></script> 
<script src="../js/bootstrap.min.js"></script> 
<script src="../js/bootstrap-colorpicker.js"></script> 
<script src="../js/bootstrap-datepicker.js"></script> 
<script src="../js/jquery.toggle.buttons.html"></script> 
<script src="../js/masked.js"></script> 
<script src="../js/jquery.uniform.js"></script> 
<script src="../js/select2.min.js"></script> 
<script src="../js/matrix.js"></script> 
<script src="../js/matrix.form_common.js"></script> 
<script src="../js/wysihtml5-0.3.0.js"></script> 
<script src="../js/jquery.peity.min.js"></script> 
<script src="../js/bootstrap-wysihtml5.js"></script> 
<script>
    $('.textarea_editor').wysihtml5();
</script>
</body>
</html>
