<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerVisit.aspx.cs" Inherits="CRM.customer.CustomerVisit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="en">
<head>
<title>客户回访</title>
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
<script language="javascript" type="text/javascript">

    
    function yiwanchenghuifangf() { //获取鼠标点击的元素

        var e = event.srcElement;
        //获取元素所在的行的行号（表头行号从0开始）。注意：parentElement只适用于IE浏览器，而parentNode则符合DOM标准。 
        //var rowIndex=eparentElementparentElementrowIndex ; 
        var rowIndex = e.parentNode.parentNode.rowIndex;
        //获取GridView控件 
        var gdview = document.getElementById("<%=GridViewyiwancheng.ClientID %>");
        var value = GridViewyiwancheng.rows[rowIndex].cells[1].innerText;
        var name = GridViewyiwancheng.rows[rowIndex].cells[1].innerText;  //.cells(0)innerText
        var phone = GridViewyiwancheng.rows[rowIndex].cells[2].innerText;
        var qq = GridViewyiwancheng.rows[rowIndex].cells[3].innerText;
        var tid = GridViewyiwancheng.rows[rowIndex].cells[8].innerText;
        var value_1 = document.getElementById("yiwanchenghuifangphone");
        value_1.innerHTML = phone + "   ";
        var value_2 = document.getElementById("yiwanchenghuifangname");
        value_2.innerHTML = name + "   ";
        var value_3 = document.getElementById("yiwanchenghuifangqq");
        value_3.innerHTML = qq;
        var value_4 = document.getElementById("yiwanchenghuifangtableid");
        value_4.InnerText = tid;
        value_4.innerHTML = tid;
        id2 = tid;
        document.getElementById("HiddenField1").value = tid;
        var hfEmployeeID = document.getElementById("<%= HiddenField1.ClientID %>");
        document.getElementById("yiwanchenghuifang").click();
        //分别获取选定行指定列的值

    }
</script> 
 <style  type="text/css">
html,body{background:#FFFFFF;}
</style>
</head>
<body>

 

<div id="content1">
 
<div id="content-header">
  <div id="breadcrumb"  > <a href="index.aspx" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="#" class="tip-bottom">客户管理</a> <a href="#" class="current">需要回访客户列表</a> </div>
</div>
<div class="container-fluid">
   
  <div class="row-fluid">
    <div class="span12">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>需要回访客户列表</h5>
        </div>
            <div class="widget-content nopadding">
             <form id="Form1" action="#"  class="form-horizontal" runat="server">
            <div class="control-group">
              <label class="control-label">客户姓名 :</label>
              <div class="controls">
                <input style="width:220px;" runat="server"  id="name"   type="text" class="span11" placeholder="客户姓名" />
                    <asp:Button ID="Button2" runat="server" Text="查询" 
                      Height="29px" Width="66px" />
              </div>
            </div>
      
            <table class="table table-bordered table-striped" >
      
              <asp:GridView ID="GridViewyiwancheng" runat="server" AllowPaging="True" 
        BackColor="White"  CssClass="GridViewStyle"  BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" Width="1017px" AutoGenerateColumns="False" 
         OnRowCommand= "btnOpenClick" >
        <Columns>
            <asp:TemplateField HeaderText="添加时间"> <ItemTemplate> <%# Eval("createdate")%> </ItemTemplate> </asp:TemplateField>
            <asp:TemplateField HeaderText="姓名"><ItemTemplate> <%# Eval("customername")%> </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="手机"><ItemTemplate> <%# Eval("customerphone")%> </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="QQ"><ItemTemplate> <%# Eval("customerqq")%> </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="邮箱"><ItemTemplate> <%# Eval("mail") %> </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="客户类型"><ItemTemplate> <%# Eval("customertype")%> </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="状态"><ItemTemplate> <%# Eval("status") %> </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="合同附件"><ItemTemplate> <%# Eval("contract") %> </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="表单号"><ItemTemplate> <%# Eval("id") %> </ItemTemplate></asp:TemplateField>
            <asp:ButtonField HeaderText="操作" ButtonType="Button" CommandName="yiwanchengchakan"  Text="查看"  /> 
 
            <asp:TemplateField HeaderText="操作">
                       <ItemTemplate>
                       <input id="yiquerenhuifangbtn" type="button" value="回访" onclick="yiwanchenghuifangf()"    />
                       </ItemTemplate>
            </asp:TemplateField>
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
      <asp:HiddenField ID="HiddenField1" runat="server" />
        <a id="yiwanchenghuifang" data-toggle="modal"  href="#modal-yiwanchenghuifang" ><i class="btn-inverse"></i> </a>  
              <div  class="modal hide" id="modal-yiwanchenghuifang"   >
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">×</button>
                  <h3>回访操作</h3>
                </div>
                <div class="modal-body"  >

                  <p>
                   表单ID:<a runat="server" id="yiwanchenghuifangtableid" style="color:blue"></a>
                  </p>
                  <p> 客户姓名: <a  style="color:blue;" id="yiwanchenghuifangname"></a >  电话: <a style="color:blue;" id="yiwanchenghuifangphone"></a>  QQ: <a style="color:blue;" id="yiwanchenghuifangqq"></a></p>
            
                  <p>
                   <a id="A26">备注</a>  <input id="yiwanchenghuifangremark" type="text" runat="server" />
                  </p>   
                </div>
                <div class="modal-footer"  >  <button type="button" class="close" data-dismiss="modal">取消</button><asp:Button ID="Button16" runat="server" OnClick="Buttonyiwanchenghuifang_Click" Text="确认"/> </div>
              </div>
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

</html>
