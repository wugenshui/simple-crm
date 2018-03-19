<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shoujianxiang.aspx.cs" Inherits="CRM.xiaoxi.Shoujianxiang" %>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
 <!DOCTYPE html>
<html lang="en">
<head>
<title>收件箱</title>
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
<link href="font-awesome/../css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
 <style  type="text/css">
html,body{background:#FFFFFF;}
</style>

</head>
<body>

 

<div id="content1">
 
<div id="content-header">
  <div id="breadcrumb"  > <a href="index.aspx" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="#" class="tip-bottom">消息</a> <a href="#" class="current">收件箱</a> </div>
</div>

 

<div class="container-fluid">
   
  <div class="row-fluid">
    <div class="span12">
      <div class="widget-box">
        <form id="Form1" action="#"  class="form-horizontal" runat="server">
          <asp:HiddenField ID="HiddenField1" runat="server" />
         <div class="widget-box">
          <div class="widget-title">
            <ul class="nav nav-tabs">
              <li runat="server"  id="t1"  onclick="tabchange('t1')"><a data-toggle="tab" href="#tab1">全部消息</a></li> 
            </ul>
          </div>
          <div class="widget-content tab-content">
            <div runat="server" id="tab1" class="tab-pane active">
   
              <asp:GridView ID="GridViewAll" runat="server" AllowPaging="True" 
        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" Width="100%" AutoGenerateColumns="False" 
        OnRowCommand= "btnOpenClick"  
       >
        <Columns> 
            <asp:TemplateField HeaderText="消息编号"> <ItemTemplate> <%# Eval("OrderID")%> </ItemTemplate> </asp:TemplateField>
            <asp:TemplateField HeaderText="发送人"><ItemTemplate> <%# Eval("Sender")%> </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="接收人"><ItemTemplate> <%# Eval("Receiver")%> </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="主题"><ItemTemplate> <%# Eval("Subject")%> </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="发送日期"><ItemTemplate> <%# Eval("Send_date")%> </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="状态"><ItemTemplate> <%# Eval("Mstatus")%> </ItemTemplate></asp:TemplateField>
            <asp:ButtonField HeaderText="操作" ButtonType="Button" CommandName="chakan1"  Text="查看"  /> 
            <asp:ButtonField HeaderText="操作" ButtonType="Button" CommandName="delete1"  Text="删除"  /> 
     

        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle HorizontalAlign ="Center"  BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
     
    </asp:GridView>
          
            </div>
        
          </div>
        </div>            
      </form>   
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
