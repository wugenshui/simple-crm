<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyRiCheng.aspx.cs" Inherits="CRM.PersonCentered.MyRiCheng" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

 <!DOCTYPE html>
<html lang="en">
<head>
<title>我的日程</title>
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
<script type="text/javascript">



    function fixcompany() {

        open("addricheng.aspx", "ifrmMain");

    }
 
</script> 
 <style  type="text/css">
html,body{background:#FFFFFF;}
</style>
</head>
<body>

 

<div id="content1">
 
<div id="content-header">
  <div id="breadcrumb"  > <a href="PersonCentered/gerenzhiliao.aspx" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="#" class="tip-bottom">个人中心</a> <a href="#" class="current">我的日程</a> </div>
</div>
<div class="container-fluid">
   
  <div class="row-fluid">
    <div class="span12">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>我的日程</h5>
           <span class="label label-info"><a style="background-color:yellow" href="#" onclick="javascript:fixcompany()">添加我的日程</a> </span>  
        </div>
            <div class="widget-content nopadding">
             <form id="Form1" action="#" method="post" class="form-horizontal" runat="server">
            <div class="control-group">
              <label class="control-label">标题 :</label>
              <div class="controls">
                <input style="width:220px;" runat="server"  id="name"   type="text" class="span11" placeholder="日志标题" />
                <asp:Button ID="Button1" runat="server" Text="查询" onclick="Button1_Click" 
                      Height="29px" Width="66px" />
              </div>
            </div>
            
            <table class="table table-bordered table-striped" >
      
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" Width="1017px" AutoGenerateColumns="False" 
         OnRowCommand= "btnOpenClick"  >
        <Columns>
            <asp:TemplateField HeaderText="日程标题"> <ItemTemplate> <%# Eval("subject") %> </ItemTemplate>  </asp:TemplateField>
             <asp:TemplateField HeaderText="日程时间"> <ItemTemplate> <%# Eval("richengtime")%> </ItemTemplate>  </asp:TemplateField>
              <asp:TemplateField HeaderText="日程地点"> <ItemTemplate> <%# Eval("address") %> </ItemTemplate>  </asp:TemplateField>
            <asp:TemplateField HeaderText="创建日期"><ItemTemplate> <%# Eval("createDate") %> </ItemTemplate> <ControlStyle Width="92%" /> 
            </asp:TemplateField>
             <asp:ButtonField HeaderText="操作" ButtonType="Button" CommandName="chakan1"  Text="查看"  /> 
            <asp:ButtonField HeaderText="操作" ButtonType="Button" CommandName="delete1"  Text="删除"  /> 
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
