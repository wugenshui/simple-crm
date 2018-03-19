<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeamList.aspx.cs" Inherits="CRM.Team.TeamList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

 <!DOCTYPE html>
<html lang="en">
<head>
<title>团队列表</title>
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
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'/>
 <style  type="text/css">
html,body{background:#FFFFFF;}
</style>
</head>
<body>

 

<div id="content1">
 
<div id="content-header">
  <div id="breadcrumb" > <a href="index.aspx" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="#" class="tip-bottom">公司团队</a> <a href="#" class="current">团队列表</a> </div>
</div>
<div class="container-fluid">
   
  <div class="row-fluid">
    <div class="span12">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>团队列表</h5>
        </div>
            <div class="widget-content nopadding">
             <form id="Form1" action="#" method="post" class="form-horizontal" runat="server">
            <div class="control-group">
              <label class="control-label">团队名称 :</label>
              <div class="controls">
                <input style="width:220px;" runat="server"  id="name"   type="text" class="span11" placeholder="团队名称" />
                <asp:Button ID="Button1" runat="server" Text="查询" onclick="Button1_Click" 
                      Height="29px" Width="66px" />
              </div>
            </div>
            
            <table class="table table-bordered table-striped" >
      
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" Width="1017px" AutoGenerateColumns="False" 
        onrowcancelingedit="GridView1_RowCancelingEdit" 
        onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing"  onrowupdating="GridView1_RowUpdating">
        <Columns>
            <asp:TemplateField HeaderText="团队名称"> <ItemTemplate> <%# Eval("Name") %> </ItemTemplate>  </asp:TemplateField>
            <asp:TemplateField HeaderText="团队负责人"><ItemTemplate> <%# Eval("Owner") %> </ItemTemplate><EditItemTemplate>
                    <asp:TextBox ID="Owner" runat="server"  text=<%# Eval("Owner") %>></asp:TextBox> 
                </EditItemTemplate><ControlStyle Width="92%" /> </asp:TemplateField>
            <asp:TemplateField HeaderText="负责人电话"><ItemTemplate> <%# Eval("OwnerPhone")%> </ItemTemplate><EditItemTemplate>
                    <asp:TextBox ID="OwnerPhone" runat="server"  text=<%# Eval("OwnerPhone") %>></asp:TextBox> 
                </EditItemTemplate><ControlStyle Width="92%" /> </asp:TemplateField>
            <asp:TemplateField HeaderText="团队口号"><ItemTemplate> <%# Eval("Slogan") %> </ItemTemplate><EditItemTemplate>
                    <asp:TextBox ID="Slogan" runat="server"  text=<%# Eval("Slogan") %>></asp:TextBox> 
                </EditItemTemplate><ControlStyle Width="92%" /> </asp:TemplateField>
            <asp:TemplateField HeaderText="所属公司"><ItemTemplate> <%# Eval("Company") %> </ItemTemplate><EditItemTemplate>
                    <asp:TextBox ID="Company" runat="server"  text=<%# Eval("Company") %>></asp:TextBox> 
                </EditItemTemplate><ControlStyle Width="92%" /> </asp:TemplateField>
            <asp:CommandField HeaderText="操作" ShowEditButton="True" SelectText="查看" 
                ShowDeleteButton="True" ShowSelectButton="True" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
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
