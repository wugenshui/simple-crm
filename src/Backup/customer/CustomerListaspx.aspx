<%@ Page Language="C#" AutoEventWireup="true"  EnableEventValidation="false" CodeBehind="CustomerListaspx.aspx.cs" Inherits="CRM.customer.CustomerListaspx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
 <!DOCTYPE html>
<html lang="en">
<head>
<title>客户列表</title>
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
<script type="text/javascript">
    function getValue() {
        var companylist = '<%=Getemp() %>'
        var companylistone = companylist.split(","); //字符分割 
        var obj = document.getElementById('fenpeikefuselect');
        if (obj.options.length > 1)
        { return; }

        for (kk = 0; kk < companylistone.length; kk++) {

            //添加一个选项  

            obj.options.add(new Option(companylistone[kk], companylistone[kk])); //这个兼容IE与firefox  
        }
    }
    function getselect() {
        var obj = document.getElementById('fenpeikefuselect'); //定位id

        var index = obj.selectedIndex; // 选中索引

        var text = obj.options[index].text; // 选中文本

        var value = obj.options[index].value; // 选中值
        document.getElementById("HiddenFieldfenpeikefu").value = value;

    }
</script>
<script language="javascript" type="text/javascript">

    function ccc() { //获取鼠标点击的元素
 
        var e = event.srcElement;
        //获取元素所在的行的行号（表头行号从0开始）。注意：parentElement只适用于IE浏览器，而parentNode则符合DOM标准。 
        //var rowIndex=eparentElementparentElementrowIndex ; 
        var rowIndex = e.parentNode.parentNode.rowIndex;
        //获取GridView控件 
        var gdview = document.getElementById("<%=GridViewnoconfirmCust.ClientID %>");
        var value = GridViewnoconfirmCust.rows[rowIndex].cells[1].innerText;
        var name = GridViewnoconfirmCust.rows[rowIndex].cells[1].innerText;  //.cells(0)innerText
        var phone = GridViewnoconfirmCust.rows[rowIndex].cells[2].innerText;
        var qq = GridViewnoconfirmCust.rows[rowIndex].cells[3].innerText;
        var tid = GridViewnoconfirmCust.rows[rowIndex].cells[8].innerText;
        var value_1 = document.getElementById("custphone");
        value_1.innerHTML = phone+"   ";
        var value_2 = document.getElementById("custname");
        value_2.innerHTML = name+"   ";
        var value_3 = document.getElementById("custqq");
        value_3.innerHTML = qq;
        var value_4 = document.getElementById("tableidcust");
        value_4.InnerText = tid;
        value_4.innerHTML = tid;
        id2 = tid;
        document.getElementById("HiddenField1").value = tid;
        var hfEmployeeID = document.getElementById("<%= HiddenField1.ClientID %>");
        document.getElementById("add-event").click(); 
        //分别获取选定行指定列的值

    }
   
</script> 
 <script language="javascript" type="text/javascript">
     function zuofeitwof() { //获取鼠标点击的元素
        
         var e = event.srcElement;
         //获取元素所在的行的行号（表头行号从0开始）。注意：parentElement只适用于IE浏览器，而parentNode则符合DOM标准。 
         //var rowIndex=eparentElementparentElementrowIndex ; 
         var rowIndex = e.parentNode.parentNode.rowIndex;
         //获取GridView控件 
         var gdview = document.getElementById("<%=GridViewnoconfirmCust.ClientID %>");
         var value = GridViewnoconfirmCust.rows[rowIndex].cells[1].innerText;
         var name = GridViewnoconfirmCust.rows[rowIndex].cells[1].innerText;  //.cells(0)innerText
         var phone = GridViewnoconfirmCust.rows[rowIndex].cells[2].innerText;
         var qq = GridViewnoconfirmCust.rows[rowIndex].cells[3].innerText;
         var tid = GridViewnoconfirmCust.rows[rowIndex].cells[8].innerText;
         var value_1 = document.getElementById("phonezuofei2");
         value_1.innerHTML = phone + "   ";
         var value_2 = document.getElementById("namezuofei2");
         value_2.innerHTML = name + "   ";
         var value_3 = document.getElementById("qqzuofei2");
         value_3.innerHTML = qq;
         var value_4 = document.getElementById("zuofeitableid2");
         value_4.InnerText = tid;
         value_4.innerHTML = tid;
         id2 = tid;
         document.getElementById("HiddenField1").value = tid;
         var hfEmployeeID = document.getElementById("<%= HiddenField1.ClientID %>");
         document.getElementById("zuofeitwo").click();
         //分别获取选定行指定列的值

     }
     function querentwof() { //获取鼠标点击的元素
         
         var e = event.srcElement;
         //获取元素所在的行的行号（表头行号从0开始）。注意：parentElement只适用于IE浏览器，而parentNode则符合DOM标准。 
         //var rowIndex=eparentElementparentElementrowIndex ; 
         var rowIndex = e.parentNode.parentNode.rowIndex;
         //获取GridView控件 
         var gdview = document.getElementById("<%=GridViewnoconfirmCust.ClientID %>");
         var value = GridViewnoconfirmCust.rows[rowIndex].cells[1].innerText;
         var name = GridViewnoconfirmCust.rows[rowIndex].cells[1].innerText;  //.cells(0)innerText
         var phone = GridViewnoconfirmCust.rows[rowIndex].cells[2].innerText;
         var qq = GridViewnoconfirmCust.rows[rowIndex].cells[3].innerText;
         var tid = GridViewnoconfirmCust.rows[rowIndex].cells[8].innerText;
         var value_1 = document.getElementById("phonequeren2");
         value_1.innerHTML = phone + "   ";
         var value_2 = document.getElementById("namequeren2");
         value_2.innerHTML = name + "   ";
         var value_3 = document.getElementById("qqqueren2");
         value_3.innerHTML = qq;
         var value_4 = document.getElementById("querentableid");
         value_4.InnerText = tid;
         value_4.innerHTML = tid;
         id2 = tid;
         document.getElementById("HiddenField1").value = tid;
         var hfEmployeeID = document.getElementById("<%= HiddenField1.ClientID %>");

         document.getElementById("querentwo").click();
         //分别获取选定行指定列的值

     }
     function tabchange(name) {
       
         document.getElementById("HiddenFieldTab").value = name;
        
     }
</script> 
<script language="javascript" type="text/javascript">

    function yiquerengenjinf() { //获取鼠标点击的元素

        var e = event.srcElement;
        //获取元素所在的行的行号（表头行号从0开始）。注意：parentElement只适用于IE浏览器，而parentNode则符合DOM标准。 
        //var rowIndex=eparentElementparentElementrowIndex ; 
        var rowIndex = e.parentNode.parentNode.rowIndex;
        //获取GridView控件 
        var gdview = document.getElementById("<%=GridViewyiqueren.ClientID %>");
        var value = GridViewyiqueren.rows[rowIndex].cells[1].innerText;
        var name = GridViewyiqueren.rows[rowIndex].cells[1].innerText;  //.cells(0)innerText
        var phone = GridViewyiqueren.rows[rowIndex].cells[2].innerText;
        var qq = GridViewyiqueren.rows[rowIndex].cells[3].innerText;
        var tid = GridViewyiqueren.rows[rowIndex].cells[8].innerText;
        var value_1 = document.getElementById("yiquerengenjinphone");
        value_1.innerHTML = phone + "   ";
        var value_2 = document.getElementById("yiquerengenjinname");
        value_2.innerHTML = name + "   ";
        var value_3 = document.getElementById("yiquerengenjinqq");
        value_3.innerHTML = qq;
        var value_4 = document.getElementById("yiquerengenjintableid");
        value_4.InnerText = tid;
        value_4.innerHTML = tid;
        id2 = tid;
        document.getElementById("HiddenField1").value = tid;
        var hfEmployeeID = document.getElementById("<%= HiddenField1.ClientID %>");
        document.getElementById("yiquerengenjin").click();
        //分别获取选定行指定列的值

    }
    function yiquerenfenpeif() { //获取鼠标点击的元素
        
        var e = event.srcElement;
        //获取元素所在的行的行号（表头行号从0开始）。注意：parentElement只适用于IE浏览器，而parentNode则符合DOM标准。 
        //var rowIndex=eparentElementparentElementrowIndex ; 
        var rowIndex = e.parentNode.parentNode.rowIndex;
        //获取GridView控件 
        var gdview = document.getElementById("<%=GridViewyiqueren.ClientID %>");
        var value = GridViewyiqueren.rows[rowIndex].cells[1].innerText;
        var name = GridViewyiqueren.rows[rowIndex].cells[1].innerText;  //.cells(0)innerText
        var phone = GridViewyiqueren.rows[rowIndex].cells[2].innerText;
        var qq = GridViewyiqueren.rows[rowIndex].cells[3].innerText;
        var tid = GridViewyiqueren.rows[rowIndex].cells[8].innerText;
        var value_1 = document.getElementById("yiquerenfenpeiphone");
        value_1.innerHTML = phone + "   ";
        var value_2 = document.getElementById("yiquerenfenpeiname");
        value_2.innerHTML = name + "   ";
        var value_3 = document.getElementById("yiquerenfenpeiqq");
        value_3.innerHTML = qq;
        var value_4 = document.getElementById("yiquerenfenpeitableid");
        value_4.InnerText = tid;
        value_4.innerHTML = tid;
        id2 = tid;
        document.getElementById("HiddenField1").value = tid;
        var hfEmployeeID = document.getElementById("<%= HiddenField1.ClientID %>");
        document.getElementById("yiquerenfenpei").click();
        //分别获取选定行指定列的值

    }
</script> 
<script language="javascript" type="text/javascript">

    function yifenpeigenjinf() { //获取鼠标点击的元素

        var e = event.srcElement;
        //获取元素所在的行的行号（表头行号从0开始）。注意：parentElement只适用于IE浏览器，而parentNode则符合DOM标准。 
        //var rowIndex=eparentElementparentElementrowIndex ; 
        var rowIndex = e.parentNode.parentNode.rowIndex;
        //获取GridView控件 
        var gdview = document.getElementById("<%=GridViewyifenpei.ClientID %>");
        var value = GridViewyifenpei.rows[rowIndex].cells[1].innerText;
        var name = GridViewyifenpei.rows[rowIndex].cells[1].innerText;  //.cells(0)innerText
        var phone = GridViewyifenpei.rows[rowIndex].cells[2].innerText;
        var qq = GridViewyifenpei.rows[rowIndex].cells[3].innerText;
        var tid = GridViewyifenpei.rows[rowIndex].cells[8].innerText;
        var value_1 = document.getElementById("yifenpeigenjinphone");
        value_1.innerHTML = phone + "   ";
        var value_2 = document.getElementById("yifenpeigenjinname");
        value_2.innerHTML = name + "   ";
        var value_3 = document.getElementById("yifenpeigenjinqq");
        value_3.innerHTML = qq;
        var value_4 = document.getElementById("yifenpeigenjintableid");
        value_4.InnerText = tid;
        value_4.innerHTML = tid;
        id2 = tid;
        document.getElementById("HiddenField1").value = tid;
        var hfEmployeeID = document.getElementById("<%= HiddenField1.ClientID %>");
        document.getElementById("yifenpeigenjin").click();
        //分别获取选定行指定列的值

    }
    function yifenpeihuifangf() { //获取鼠标点击的元素
         
        var e = event.srcElement;
        //获取元素所在的行的行号（表头行号从0开始）。注意：parentElement只适用于IE浏览器，而parentNode则符合DOM标准。 
        //var rowIndex=eparentElementparentElementrowIndex ; 
        var rowIndex = e.parentNode.parentNode.rowIndex;
        //获取GridView控件 
        var gdview = document.getElementById("<%=GridViewyifenpei.ClientID %>");
        var value = GridViewyifenpei.rows[rowIndex].cells[1].innerText;
        var name = GridViewyifenpei.rows[rowIndex].cells[1].innerText;  //.cells(0)innerText
        var phone = GridViewyifenpei.rows[rowIndex].cells[2].innerText;
        var qq = GridViewyifenpei.rows[rowIndex].cells[3].innerText;
        var tid = GridViewyifenpei.rows[rowIndex].cells[8].innerText;
        var value_1 = document.getElementById("yifenpeihuifangphone");
        value_1.innerHTML = phone + "   ";
        var value_2 = document.getElementById("yifenpeihuifangname");
        value_2.innerHTML = name + "   ";
        var value_3 = document.getElementById("yifenpeihuifangqq");
        value_3.innerHTML = qq;
        var value_4 = document.getElementById("yifenpeihuifangtableid");
        value_4.InnerText = tid;
        value_4.innerHTML = tid;
        id2 = tid;
        document.getElementById("HiddenField1").value = tid;
        var hfEmployeeID = document.getElementById("<%= HiddenField1.ClientID %>");
        document.getElementById("yifenpeihuifang").click();
        //分别获取选定行指定列的值

    }
</script> 
<script language="javascript" type="text/javascript">

    function yilianxigenjinf() { //获取鼠标点击的元素
        var e = event.srcElement;
        //获取元素所在的行的行号（表头行号从0开始）。注意：parentElement只适用于IE浏览器，而parentNode则符合DOM标准。 
        //var rowIndex=eparentElementparentElementrowIndex ; 
        var rowIndex = e.parentNode.parentNode.rowIndex;
        //获取GridView控件 
        var gdview = document.getElementById("<%=GridViewyilianxi.ClientID %>");

        var value = GridViewyilianxi.rows[rowIndex].cells[1].innerText;
       
        var name = GridViewyilianxi.rows[rowIndex].cells[1].innerText;  //.cells(0)innerText
        var phone = GridViewyilianxi.rows[rowIndex].cells[2].innerText;
        var qq = GridViewyilianxi.rows[rowIndex].cells[3].innerText;
        var tid = GridViewyilianxi.rows[rowIndex].cells[8].innerText;
        var value_1 = document.getElementById("yilianxigenjinphone");
        value_1.innerHTML = phone + "   ";
        var value_2 = document.getElementById("yilianxigenjinname");
        value_2.innerHTML = name + "   ";
        var value_3 = document.getElementById("yilianxigenjinqq");
        value_3.innerHTML = qq;
        var value_4 = document.getElementById("yilianxigenjintableid");
        value_4.InnerText = tid;
        value_4.innerHTML = tid;
        id2 = tid;
        document.getElementById("HiddenField1").value = tid;
        var hfEmployeeID = document.getElementById("<%= HiddenField1.ClientID %>");
        
        document.getElementById("yilianxigenjin").click();
        //分别获取选定行指定列的值

    }
    function yilianxihuifangf() { //获取鼠标点击的元素

        var e = event.srcElement;
        //获取元素所在的行的行号（表头行号从0开始）。注意：parentElement只适用于IE浏览器，而parentNode则符合DOM标准。 
        //var rowIndex=eparentElementparentElementrowIndex ; 
        var rowIndex = e.parentNode.parentNode.rowIndex;
        //获取GridView控件 
        var gdview = document.getElementById("<%=GridViewyilianxi.ClientID %>");
        var value = GridViewyilianxi.rows[rowIndex].cells[1].innerText;
        var name = GridViewyilianxi.rows[rowIndex].cells[1].innerText;  //.cells(0)innerText
        var phone = GridViewyilianxi.rows[rowIndex].cells[2].innerText;
        var qq = GridViewyilianxi.rows[rowIndex].cells[3].innerText;
        var tid = GridViewyilianxi.rows[rowIndex].cells[8].innerText;
        var value_1 = document.getElementById("yilianxihuifangphone");
        value_1.innerHTML = phone + "   ";
        var value_2 = document.getElementById("yilianxihuifangname");
        value_2.innerHTML = name + "   ";
        var value_3 = document.getElementById("yilianxihuifangqq");
        value_3.innerHTML = qq;
        var value_4 = document.getElementById("yilianxihuifangtableid");
        value_4.InnerText = tid;
        value_4.innerHTML = tid;
        id2 = tid;
        document.getElementById("HiddenField1").value = tid;
        var hfEmployeeID = document.getElementById("<%= HiddenField1.ClientID %>");
        document.getElementById("yilianxihuifang").click();
        //分别获取选定行指定列的值

    }
</script> 
<script language="javascript" type="text/javascript">

    function yiwanchenggenjinf() { //获取鼠标点击的元素
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
        var value_1 = document.getElementById("yiwanchenggenjinphone");
        value_1.innerHTML = phone + "   ";
        var value_2 = document.getElementById("yiwanchenggenjinname");
        value_2.innerHTML = name + "   ";
        var value_3 = document.getElementById("yiwanchenggenjinqq");
        value_3.innerHTML = qq;
        var value_4 = document.getElementById("yiwanchenggenjintableid");
        value_4.InnerText = tid;
        value_4.innerHTML = tid;
        id2 = tid;
        document.getElementById("HiddenField1").value = tid;
        var hfEmployeeID = document.getElementById("<%= HiddenField1.ClientID %>");

        document.getElementById("yiwanchenggenjin").click();
        //分别获取选定行指定列的值

    }
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
</script> 
<script  language="javascript" type="text/javascript">
    function zanbulianxiyfpxx() { //获取鼠标点击的元素
       
        var e = event.srcElement;
        //获取元素所在的行的行号（表头行号从0开始）。注意：parentElement只适用于IE浏览器，而parentNode则符合DOM标准。 
        //var rowIndex=eparentElementparentElementrowIndex ; 
        var rowIndex = e.parentNode.parentNode.rowIndex;
        //获取GridView控件 
        var gdview = document.getElementById("<%=GridViewyiqueren.ClientID %>");  
        var value = GridViewyiwancheng.rows[rowIndex].cells[1].innerText; 
        var name = GridViewyiwancheng.rows[rowIndex].cells[1].innerText;  //.cells(0)innerText
        var phone = GridViewyiwancheng.rows[rowIndex].cells[2].innerText; 
        var qq = GridViewyiwancheng.rows[rowIndex].cells[3].innerText; 
        var mail = GridViewyiwancheng.rows[rowIndex].cells[4].innerText; 
        var tid = GridViewyiwancheng.rows[rowIndex].cells[8].innerText;
        var value_1 = document.getElementById("zanbulianxiyfpcphone");
        value_1.innerHTML = phone + "   ";  
        var value_2 = document.getElementById("zanbulianxiyfpcnamex"); 
        value_2.innerHTML = name + "   ";
        var value_3 = document.getElementById("zanbulianxiyfpcqq"); 
        value_3.innerHTML = qq;
        var value_4 = document.getElementById("zanbulianxiyfptid");
        value_4.InnerText = tid;  
        value_4.innerHTML = tid;
        id2 = tid;
        document.getElementById("HiddenField1").value = tid; 
        var hfEmployeeID = document.getElementById("<%= HiddenField1.ClientID %>");
        document.getElementById("zanbulianxiyfpcc").click(); 
       
        //分别获取选定行指定列的值
    }
</script>
 <style  type="text/css">
html,body{background:#FFFFFF;}
#zanbulianxidiv {
 
   
  
    width: 300px;
    margin:22px 22px;
}
 .datepicker {
	top: 0;
	left: 0;
	padding: 31px;
	margin-top: 1px; /*.dow { border-top: 1px solid #ddd !important; }*/
}
</style>
</head>
<body>

 

<div id="content1">
 
<div id="content-header">
  <div id="breadcrumb"  > <a href="index.aspx" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="#" class="tip-bottom">客户管理</a> <a href="#" class="current">客户列表</a> </div>
</div>

 

<div class="container-fluid">
   
  <div class="row-fluid">
    <div class="span12">
      <div class="widget-box">
        <form id="Form1" action="#"  class="form-horizontal" runat="server">
         <div class="widget-box">
          <div class="widget-title">
            <ul class="nav nav-tabs">
              <li runat="server"  id="t1"  onclick="tabchange('t1')"><a data-toggle="tab" href="#tab1">客户列表</a></li>
              <li runat="server"  id="t2" onclick="tabchange('t2')"><a data-toggle="tab" href="#tab2">未确认客户</a></li>
              <li runat="server"  id="t3" onclick="tabchange('t3')"><a data-toggle="tab" href="#tab3">已确认客户</a></li>
              <li runat="server"  id="t4" onclick="tabchange('t4')"><a data-toggle="tab" href="#tab4">已分配客户</a></li>
              <li runat="server"  id="t5" onclick="tabchange('t5')"><a data-toggle="tab" href="#tab5">已联系客户</a></li>
              <li runat="server"  id="t6" onclick="tabchange('t6')"><a data-toggle="tab" href="#tab6">已完成客户</a></li> 
            </ul>
          </div>
          <div class="widget-content tab-content">
            <div runat="server" id="tab1" class="tab-pane">
                <div class="control-group">
              <label class="control-label">客户名称 :</label>
              <div class="controls">
                <input style="width:220px;" runat="server"  id="name"   type="text" class="span11" placeholder="客户名称" />
                <asp:Button ID="Button1" runat="server" Text="查询" onclick="Button1_Click" 
                      Height="29px" Width="66px" />
                        </div>
                          </div>

              <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        BackColor="White"  CssClass="GridViewStyle"  BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" Width="100%" AutoGenerateColumns="False" 
        onrowcancelingedit="GridView1_RowCancelingEdit" OnRowCommand= "btnOpenClick"  
        onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing">
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
             <asp:ButtonField HeaderText="操作" ButtonType="Button" CommandName="chakan1"  Text="查看"  /> 
            
     

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
          
            </div>
            <div id="tab2" runat="server" class="tab-pane">
              <div class="control-group">
              <label class="control-label">客户名称 :</label>
              <div class="controls">
                <input style="width:220px;" runat="server"  id="noconfirmCust"   type="text" class="span11" placeholder="客户名称" />
                <asp:Button ID="Buttonweiqueren2" runat="server" Text="查询" onclick="Buttonweiqueren2_check" 
                      Height="29px" Width="66px" />
              </div>
              </div>

              <asp:GridView ID="GridViewnoconfirmCust" runat="server" AllowPaging="True" 
        BackColor="White"  CssClass="GridViewStyle"  BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" Width="100%" AutoGenerateColumns="False" 
        onrowcancelingedit="GridView1_RowCancelingEdit"  OnRowCommand= "btnOpenClick"   
        onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing">
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
            <asp:ButtonField HeaderText="操作" ButtonType="Button" CommandName="Details"  Text="查看"  /> 
 
                            <asp:TemplateField HeaderText="操作">
                                                    <ItemTemplate>
<input id="btnLocation" type="button" value="跟进" onclick="ccc()"    />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
         
             <asp:ButtonField HeaderText="操作" ButtonType="Button" CommandName="update2"  Text="修改"  /> 
                 <asp:TemplateField HeaderText="操作">
                                                    <ItemTemplate>
<input id="zuofei2" type="button" value="作废" onclick="zuofeitwof()"    />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
   <asp:TemplateField HeaderText="操作">
                                                    <ItemTemplate>
<input id="queren2" type="button" value="确认" onclick="querentwof()"    />
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
         <asp:HiddenField ID="HiddenFieldTab" runat="server" />
         <asp:HiddenField ID="HiddenFieldfenpeikefu" runat="server" />
      <a id="add-event" data-toggle="modal"  href="#modal-add-event" ><i class="btn-inverse"></i> </a>
    
           <div class="modal hide" id="modal-add-event">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">×</button>
                  <h3>客户跟进</h3>
                </div>
                <div class="modal-body">
                  <p>
                   表单ID:<a runat="server" id="tableidcust" style="color:blue"></a>
                  </p>
                  <p> 客户姓名: <a  style="color:blue;" id="custname"></a >  电话: <a style="color:blue;" id="custphone"></a>  QQ: <a style="color:blue;" id="custqq"></a></p>
                   <p></p>
                   <p></p>
                  <p>
                   <a id="A1">备注</a>  <input id="eventname" type="text" runat="server" />
                  </p>
                  <p>对客户跟进操作</p>
                </div>
                <div class="modal-footer"> <button type="button" class="close" data-dismiss="modal">取消</button><asp:Button ID="xiugai222" runat="server" OnClick="Buttongenjin2_Click" Text="确认"/> </div>
              </div>
        <a id="zuofeitwo" data-toggle="modal"  href="#modal-zuofei2" ><i class="btn-inverse"></i> </a>  
              <div class="modal hide" id="modal-zuofei2">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">×</button>
                  <h3>作废操作</h3>
                </div>
                <div class="modal-body">
                  <p>
                   表单ID:<a runat="server" id="zuofeitableid2" style="color:blue"></a>
                  </p>
                  <p> 客户姓名: <a  style="color:blue;" id="namezuofei2"></a >  电话: <a style="color:blue;" id="phonezuofei2"></a>  QQ: <a style="color:blue;" id="qqzuofei2"></a></p>
                   <p></p>
                   <p></p>
                  <p>
                   <a id="A6">作废原因</a>  <input id="Text1" type="text" runat="server" />
                  </p>
                  <p>对客户作废操作</p>
                </div>
                <div class="modal-footer"> <button type="button" class="close" data-dismiss="modal">取消</button><asp:Button ID="Button2" runat="server" OnClick="Buttonzuifei2_Click" Text="确认"/> </div>
              </div>
       <a id="querentwo" data-toggle="modal"  href="#modal-queren2" ><i class="btn-inverse"></i> </a>
    
           <div class="modal hide" id="modal-queren2">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">×</button>
                  <h3>客户确认</h3>
                </div>
                <div class="modal-body">
                  <p>
                   表单ID:<a runat="server" id="querentableid" style="color:blue"></a>
                  </p>
                  <p> 客户姓名: <a  style="color:blue;" id="namequeren2"></a >  电话: <a style="color:blue;" id="phonequeren2"></a>  QQ: <a style="color:blue;" id="qqqueren2"></a></p>
                   <p></p>
                   <p></p>
                  <p>
                   <a id="A8">备注</a>  <input id="Text2" type="text" runat="server" />
                  </p>
                  <p>对员工提交的客户进行核实，确认之后让客服联系，确认之前请核实清楚信息，以免处理流程中出现错误</p>
                </div>
                <div class="modal-footer"> <button type="button" class="close" data-dismiss="modal">取消</button><asp:Button ID="Button3" runat="server" OnClick="Buttonqueren2_Click" Text="确认"/> </div>
              </div>
            </div>
            <div id="tab3"  runat="server"  class="tab-pane">
                          <div class="control-group">
              <label class="control-label">客户名称 :</label>
              <div class="controls">
                <input style="width:220px;" runat="server"  id="yiquerencust"   type="text" class="span11" placeholder="客户名称" />
                <asp:Button ID="Button4" runat="server" Text="查询" onclick="Buttonyiqueren2_check" 
                      Height="29px" Width="66px" />
              </div>
              </div>

              <asp:GridView ID="GridViewyiqueren" runat="server" AllowPaging="True" 
        BackColor="White" CssClass="GridViewStyle"  BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" Width="100%" AutoGenerateColumns="False" 
        onrowcancelingedit="GridView1_RowCancelingEdit"  OnRowCommand= "btnOpenClick"   
        onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing">
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
            <asp:ButtonField HeaderText="操作" ButtonType="Button" CommandName="yiquerenchakan"  Text="查看"  /> 
 
            <asp:TemplateField HeaderText="操作">
                       <ItemTemplate>
                       <input id="yiquerengenjinbtn" type="button" value="跟进" onclick="yiquerengenjinf()"    />
                       </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                       <ItemTemplate>
                       <input id="yiquerenhuifangbtn" type="button" value="回访" onclick="yiquerenhuifangf()"    />
                       </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="操作">
                       <ItemTemplate>
                       <input id="yiquerenfenpeibtn" type="button" value="分配"   onclick="yiquerenfenpeif();getValue() "    />
                       </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                       <ItemTemplate>
                       <input id="zanbulianxiyfpbtn" type="button" value="暂不联系"   onclick="zanbulianxiyfpxx()"    />
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
          <a id="zanbulianxiyfpcc" data-toggle="modal"  href="#zanbulianxidiv" ><i class="btn-inverse"></i> </a>
    
           <div class="modal hide" id="zanbulianxidiv">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">×</button>
                  <h3>暂不联系</h3>
                </div>
                <div class="modal-body">
                  <p>
                   表单ID:<a runat="server" id="zanbulianxiyfptid" style="color:blue"></a>
                  </p>
                  <p> 客户姓名: <a  style="color:blue;"  runat="server" id="zanbulianxiyfpcnamex"></a >  电话: <a runat="server" style="color:blue;" id="zanbulianxiyfpcphone"></a>  QQ: <a runat="server" style="color:blue;" id="zanbulianxiyfpcqq"></a></p>
                   <p>联系时间:<div  id="rili" data-date="12-02-2012" class="input-append date datepicker">
                  <input style="width:220px;  "  runat="server"  id="txtdate" type="text" value="04-22-2015"  data-date-format="mm-dd-yyyy" class="span1" />
                  <span class="add-on"><i class="icon-th"></i></span> </div></p>
                   <p></p>
                  <p>
                   <a id="A14">备注</a>  <input id="zanbulianxiyfpremark" type="text" runat="server" />
                  </p>
                  <p>对客户暂不联系操作</p>
                </div>
                <div class="modal-footer"> <button type="button" class="close" data-dismiss="modal">取消</button><asp:Button ID="Button17" runat="server" OnClick="Buttonzanbulianxiyfp_Click" Text="确认"/> </div>
              </div>




      <a id="yiquerengenjin" data-toggle="modal"  href="#modal-yiqueren" ><i class="btn-inverse"></i> </a>
    
           <div class="modal hide" id="modal-yiqueren">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">×</button>
                  <h3>客户跟进</h3>
                </div>
                <div class="modal-body">
                  <p>
                   表单ID:<a runat="server" id="yiquerengenjintableid" style="color:blue"></a>
                  </p>
                  <p> 客户姓名: <a  style="color:blue;" id="yiquerengenjinname"></a >  电话: <a style="color:blue;" id="yiquerengenjinphone"></a>  QQ: <a style="color:blue;" id="yiquerengenjinqq"></a></p>
                   <p></p>
                   <p></p>
                  <p>
                   <a id="A9">备注</a>  <input id="Text4" type="text" runat="server" />
                  </p>
                  <p>对客户跟进操作</p>
                </div>
                <div class="modal-footer"> <button type="button" class="close" data-dismiss="modal">取消</button><asp:Button ID="Button5" runat="server" OnClick="Buttonyiquerengenjin_Click" Text="确认"/> </div>
              </div>
    <a id="yiquerenfenpei" data-toggle="modal"  href="#modal-fenpei" ><i class="btn-inverse"></i> </a>  
              <div  class="modal hide" id="modal-fenpei"   >
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">×</button>
                  <h3>分配操作</h3>
                </div>
                <div class="modal-body"  >

                  <p>
                   表单ID:<a runat="server" id="yiquerenfenpeitableid" style="color:blue"></a>
                  </p>
                  <p> 客户姓名: <a  style="color:blue;" id="yiquerenfenpeiname"></a >  电话: <a style="color:blue;" id="yiquerenfenpeiphone"></a>  QQ: <a style="color:blue;" id="yiquerenfenpeiqq"></a></p>
                   <p></p>
                   <p></p>
                  <p>
                   
                  </p>   
                </div>
                <div class="modal-footer"  > <a id="fenpeikefu">分配客服</a>  <select data-toggle="select" style="width:220px; z-index:99999;  "  runat="server"  id="fenpeikefuselect">
                
                </select>  <button type="button" class="close" data-dismiss="modal">取消</button><asp:Button ID="Button6" runat="server" OnClientClick="getselect()" OnClick="Buttonyiquerenfenpei_Click" Text="确认"/> </div>
              </div>
       <a id="A16" data-toggle="modal"  href="#modal-queren2" ><i class="btn-inverse"></i> </a>
    
           <div class="modal hide" id="Div3">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">×</button>
                  <h3>客户回访</h3>
                </div>
                <div class="modal-body">
                  <p>
                   表单ID:<a runat="server" id="A17" style="color:blue"></a>
                  </p>
                  <p> 客户姓名: <a  style="color:blue;" id="A18"></a >  电话: <a style="color:blue;" id="A19"></a>  QQ: <a style="color:blue;" id="A20"></a></p>
                   <p></p>
                   <p></p>
                  <p>
                   <a id="A21">备注</a>  <input id="Text6" type="text" runat="server" />
                  </p>
                  <p>对员工提交的客户进行核实，确认之后让客服联系，确认之前请核实清楚信息，以免处理流程中出现错误</p>
                </div>
                <div class="modal-footer"> <button type="button" class="close" data-dismiss="modal">取消</button><asp:Button ID="Button7" runat="server" OnClick="Buttonqueren2_Click" Text="确认"/> </div>
              </div>
            </div>
            <div id="tab4"  runat="server"  class="tab-pane">
             <div class="control-group">
              <label class="control-label">客户名称 :</label>
              <div class="controls">
                <input style="width:220px;" runat="server"  id="yifenpeicust"   type="text" class="span11" placeholder="客户名称" />
                <asp:Button ID="Button8" runat="server" Text="查询" onclick="Buttonyifenpei2_check" 
                      Height="29px" Width="66px" />
              </div>
              </div>

              <asp:GridView ID="GridViewyifenpei" runat="server" AllowPaging="True" 
        BackColor="White" CssClass="GridViewStyle"  BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" Width="100%" AutoGenerateColumns="False" 
        onrowcancelingedit="GridView1_RowCancelingEdit"  OnRowCommand= "btnOpenClick"   
        onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing">
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
            <asp:ButtonField HeaderText="操作" ButtonType="Button" CommandName="yifenpeichakan"  Text="查看"  /> 
 
            <asp:TemplateField HeaderText="操作">
                       <ItemTemplate>
                       <input id="yiquerengenjinbtn" type="button" value="跟进" onclick="yifenpeigenjinf()"    />
                       </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                       <ItemTemplate>
                       <input id="yiquerenhuifangbtn" type="button" value="回访" onclick="yifenpeihuifangf()"    />
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
     
      <a id="yifenpeigenjin" data-toggle="modal"  href="#modal-yifenpei" ><i class="btn-inverse"></i> </a>
    
           <div class="modal hide" id="modal-yifenpei">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">×</button>
                  <h3>客户跟进</h3>
                </div>
                <div class="modal-body">
                  <p>
                   表单ID:<a runat="server" id="yifenpeigenjintableid" style="color:blue"></a>
                  </p>
                  <p> 客户姓名: <a  style="color:blue;" id="yifenpeigenjinname"></a >  电话: <a style="color:blue;" id="yifenpeigenjinphone"></a>  QQ: <a style="color:blue;" id="yifenpeigenjinqq"></a></p>
                   <p></p>
                   <p></p>
                  <p>
                   <a id="A10">备注</a>  <input id="Text5" type="text" runat="server" />
                  </p>
                  <p>对客户跟进操作</p>
                </div>
                <div class="modal-footer"> <button type="button" class="close" data-dismiss="modal">取消</button><asp:Button ID="Button9" runat="server" OnClick="Buttonyifenpeigenjin_Click" Text="确认"/> </div>
              </div>
    <a id="yifenpeihuifang" data-toggle="modal"  href="#modal-fenpeihuifang" ><i class="btn-inverse"></i> </a>  
              <div  class="modal hide" id="modal-fenpeihuifang"   >
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">×</button>
                  <h3>回访操作</h3>
                </div>
                <div class="modal-body"  >

                  <p>
                   表单ID:<a runat="server" id="yifenpeihuifangtableid" style="color:blue"></a>
                  </p>
                  <p> 客户姓名: <a  style="color:blue;" id="yifenpeihuifangname"></a >  电话: <a style="color:blue;" id="yifenpeihuifangphone"></a>  QQ: <a style="color:blue;" id="yifenpeihuifangqq"></a></p>
            
                  <p>
                   <a id="A2">备注</a>  <input id="yifenpeihuifangremark" type="text" runat="server" />
                  </p>   
                </div>
                <div class="modal-footer"  >  <button type="button" class="close" data-dismiss="modal">取消</button><asp:Button ID="Button10" runat="server" OnClick="Buttonyifenpeihuifang_Click" Text="确认"/> </div>
              </div>
       
            </div>
            <div id="tab5"  runat="server" class="tab-pane">
                          <div class="control-group">
              <label class="control-label">客户名称 :</label>
              <div class="controls">
                <input style="width:220px;" runat="server"  id="yilianxicust"   type="text" class="span11" placeholder="客户名称" />
                <asp:Button ID="Button11" runat="server" Text="查询" onclick="Buttonyilianxi_check" 
                      Height="29px" Width="66px" />
              </div>
              </div>

              <asp:GridView ID="GridViewyilianxi" runat="server" AllowPaging="True" 
        BackColor="White"  CssClass="GridViewStyle"  BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" Width="100%" AutoGenerateColumns="False" 
        onrowcancelingedit="GridView1_RowCancelingEdit"  OnRowCommand= "btnOpenClick"   
        onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing">
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
            <asp:ButtonField HeaderText="操作" ButtonType="Button" CommandName="yilianxichakan"  Text="查看"  /> 
 
            <asp:TemplateField HeaderText="操作">
                       <ItemTemplate>
                       <input id="yiquerengenjinbtn" type="button" value="跟进" onclick="yilianxigenjinf()"    />
                       </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                       <ItemTemplate>
                       <input id="yiquerenhuifangbtn" type="button" value="回访" onclick="yilianxihuifangf()"    />
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
     
      <a id="yilianxigenjin" data-toggle="modal"  href="#modal-yilianxigenjin" ><i class="btn-inverse"></i> </a>
    
           <div class="modal hide" id="modal-yilianxigenjin">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">×</button>
                  <h3>客户跟进</h3>
                </div>
                <div class="modal-body">
                  <p>
                   表单ID:<a runat="server" id="yilianxigenjintableid" style="color:blue"></a>
                  </p>
                  <p> 客户姓名: <a  style="color:blue;" id="yilianxigenjinname"></a >  电话: <a style="color:blue;" id="yilianxigenjinphone"></a>  QQ: <a style="color:blue;" id="yilianxigenjinqq"></a></p>
                   <p></p>
                   <p></p>
                  <p>
                   <a id="A12">备注</a>  <input id="yilianxigenjinremark" type="text" runat="server" />
                  </p>
                  <p>对客户跟进操作</p>
                </div>
                <div class="modal-footer"> <button type="button" class="close" data-dismiss="modal">取消</button><asp:Button ID="Button12" runat="server" OnClick="Buttonyilianxigenjin_Click" Text="确认"/> </div>
              </div>
    <a id="yilianxihuifang" data-toggle="modal"  href="#modal-yilianxihuifang" ><i class="btn-inverse"></i> </a>  
              <div  class="modal hide" id="modal-yilianxihuifang"   >
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">×</button>
                  <h3>回访操作</h3>
                </div>
                <div class="modal-body"  >

                  <p>
                   表单ID:<a runat="server" id="yilianxihuifangtableid" style="color:blue"></a>
                  </p>
                  <p> 客户姓名: <a  style="color:blue;" id="yilianxihuifangname"></a >  电话: <a style="color:blue;" id="yilianxihuifangphone"></a>  QQ: <a style="color:blue;" id="yilianxihuifangqq"></a></p>
            
                  <p>
                   <a id="A24">备注</a>  <input id="yilianxihuifangremark" type="text" runat="server" />
                  </p>   
                </div>
                <div class="modal-footer"  >  <button type="button" class="close" data-dismiss="modal">取消</button><asp:Button ID="Button13" runat="server" OnClick="Buttonyilianxihuifang_Click" Text="确认"/> </div>
              </div>
            </div>

              <!--1111111111111111111-->
            <div id="tab6"  runat="server" class="tab-pane">
                                      <div class="control-group">
              <label class="control-label">客户名称 :</label>
              <div class="controls">
                <input style="width:220px;" runat="server"  id="yiwanchengcust"   type="text" class="span11" placeholder="客户名称" />
                <asp:Button ID="Button14" runat="server" Text="查询" onclick="Buttonyiwancheng_check" 
                      Height="29px" Width="66px" />
              </div>
              </div>

              <asp:GridView ID="GridViewyiwancheng" runat="server" AllowPaging="True" 
        BackColor="White"  CssClass="GridViewStyle"  BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" Width="100%" AutoGenerateColumns="False" 
        onrowcancelingedit="GridView1_RowCancelingEdit"  OnRowCommand= "btnOpenClick"   
        onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing">
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
                       <input id="yiquerengenjinbtn" type="button" value="跟进" onclick="yiwanchenggenjinf()"    />
                       </ItemTemplate>
            </asp:TemplateField>
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
     
      <a id="yiwanchenggenjin" data-toggle="modal"  href="#modal-yiwanchenggenjin" ><i class="btn-inverse"></i> </a>
    
           <div class="modal hide" id="modal-yiwanchenggenjin">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">×</button>
                  <h3>客户跟进</h3>
                </div>
                <div class="modal-body">
                  <p>
                   表单ID:<a runat="server" id="yiwanchenggenjintableid" style="color:blue"></a>
                  </p>
                  <p> 客户姓名: <a  style="color:blue;" id="yiwanchenggenjinname"></a >  电话: <a style="color:blue;" id="yiwanchenggenjinphone"></a>  QQ: <a style="color:blue;" id="yiwanchenggenjinqq"></a></p>
                   <p></p>
                   <p></p>
                  <p>
                   <a id="A13">备注</a>  <input id="yiwanchenggenjinremark" type="text" runat="server" />
                  </p>
                  <p>对客户跟进操作</p>
                </div>
                <div class="modal-footer"> <button type="button" class="close" data-dismiss="modal">取消</button><asp:Button ID="Button15" runat="server" OnClick="Buttonyiwanchenggenjin_Click" Text="确认"/> </div>
              </div>
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
