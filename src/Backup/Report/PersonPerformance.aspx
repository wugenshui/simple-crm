<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonPerformance.aspx.cs" Inherits="CRM.Report.PersonPerformance" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="en">
<head>
<title>个人业绩排行榜</title>
<meta charset="gb2312" />
<meta http-equiv="Content-Type"; content="text/html";charset="gb2312"> 
<meta http-equiv="pragma" content="no-cache">  
<meta http-equiv="cache-control" content="no-cache">  
<meta http-equiv="expires" content="0">
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
<script language="javascript" type="text/javascript">

    function Get(sss) {

        var str = sss;
        document.getElementById("HiddenField1").value = sss;
        document.getElementById("Button2").click();
        var hello = '<%= RadioClick() %>';



    }

   </script>
    <style  type="text/css">
html,body{background:#FFFFFF;}
</style>
</head>
<body>

 

<div id="content1">
 
<div id="content-header">
  <div id="breadcrumb"  > <a href="index.aspx" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="#" class="tip-bottom">统计报表</a> <a href="#" class="current">个人业绩排行榜</a> </div>
</div>
<div class="container-fluid">
   
  <div class="row-fluid">
    <div class="span12">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>个人业绩排行榜</h5>
        </div>
            <div class="widget-content nopadding" >
             <form id="Form1" action="#" method="post"  class="form-horizontal" runat="server"  style="float:left; margin-right: 0px;   margin-left: 0px; width: 100%;">
            <div class="control-group" style="float:left; margin-right: 0px;   margin-left: 0px; width: 100%;" >
              <div class="controls" style="float:left; margin-right: 0px;   margin-left: 0px; width: 100%;  " >
               <label style="float:left;">
                  <input runat="server"  onclick="Get('jinri')"  id="jinri"  type="radio" name="radios" />
                  今日</label>
                <label  style="float:left;">
                  <input runat="server"  onclick="Get('zuori')" id="zuori" type="radio" name="radios" />
                  昨日</label>
                <label  style="float:left;" >
                  <input runat="server"  onclick="Get('qianri')" id="qianri" type="radio" name="radios" />
                  前日</label>
                  <label  style="float:left;">
                  <input runat="server"  onclick="Get('benzhou')" id="benzhou" type="radio" name="radios" />
                  本周</label>
                 <label   style="float:left;">
                  <input runat="server" onclick="Get('qitian')"  id="qitian" type="radio" name="radios" />
                  最近7天</label>
                   <label   style="float:left;">
                  <input runat="server" onclick="Get('benyue')"  id="benyue" type="radio" name="radios" />
                  本月</label>
                   <label  style="float:left;" >
                  <input runat="server" onclick="Get('sanshitian')"  id="sanshitian" type="radio" name="radios" />
                  最近30天</label>
                   <label   style="float:left;">
                  <input runat="server" onclick="Get('benji')"  id="benji" type="radio" name="radios" />
                  本季</label>
                   <label   style="float:left;">
                  <input runat="server" onclick="Get('bennian')"   id="bennian" type="radio" name="radios" />
                  本年</label>
                   <label  style="float:left;">
                  <input runat="server" onclick="Get('lishi')"   id="lishi" type="radio" name="radios" />
                  历史</label>
                <label  style="float:left;">
                 &nbsp  &nbsp  &nbsp 日期 </label>     <div   data-date="12-02-2012" class="input-append date datepicker">
                  <input style="width:50%; "  runat="server"  id="datestart" type="text" value="04-22-2015"  data-date-format="mm-dd-yyyy" class="span11"  placeholder="开始日期" >  <span class="add-on"><i class="icon-th"></i></span>
                  <span class="add-on"><i class="icon-th"></i></span> </div>
                <div   data-date="12-02-2012" class="input-append date datepicker">
                   -  <input style="width:50%; float:left; "  runat="server"  id="dateend" type="text" value="05-22-2015"  data-date-format="mm-dd-yyyy" class="span11"  placeholder="结束日期" >
                  <span class="add-on"><i class="icon-th"></i></span> </div>
                    <asp:Button ID="Button2" runat="server" Text="查询" 
                      Height="29px" Width="66px" OnClick="Button2_Click"  />
                    <asp:Button ID="Button3" runat="server" Text="下载" 
                      Height="29px" Width="66px" OnClick="Button3_Click" />
              </div>
            </div>
      
            <table class="table table-bordered table-striped"  >
      
              <asp:GridView ID="GridViewyiwancheng" runat="server" AllowPaging="True" 
        BackColor="White"  CssClass="GridViewStyle"  BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" Width="100%" AutoGenerateColumns="False" 
         OnRowCommand= "btnOpenClick"  >
        <Columns>
            <asp:TemplateField HeaderText="名次"> <ItemTemplate> <%# Eval("名次")%> </ItemTemplate> </asp:TemplateField>
            <asp:TemplateField HeaderText="员工名称"><ItemTemplate> <%# Eval("员工名称")%> </ItemTemplate></asp:TemplateField>
            
       
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
            <asp:Button ID="Button1" runat="server" OnClick="RadioClick_Click" 
                 Text="RadioClick" Visible="False"/> 
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

