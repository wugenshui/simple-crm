<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyData.aspx.cs" Inherits="CRM.PersonCentered.CompanyData" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>公司资料</title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="../css/matrix-style.css" />
<link rel="stylesheet" href="../css/matrix-media.css" />
<link href="../font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.useso.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'/>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-responsive.min.css" />
<link rel="stylesheet" type="text/css" href="../css/uniform.css" />
<link rel="stylesheet" type="text/css" href="../css/matrix-style.css" />
<link rel="stylesheet" type="text/css" href="../css/matrix-media.css" />
<link rel="stylesheet" type="text/css" href="../css/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="../css/jquery.gritter.css" />
 <link rel="stylesheet" type="text/css" href="../css/select2.css" />


<link rel="stylesheet" type="text/css" href="../css/jquery-ui-1.10.4.custom.min.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-responsive.min.css" />
<link rel="stylesheet" type="text/css" href="../css/uniform.css" />
<link rel="stylesheet" type="text/css" href="../css/matrix-style.css" />
<link rel="stylesheet" type="text/css" href="../css/matrix-media.css" />
<link rel="stylesheet" type="text/css" href="../css/font-awesome.css" />
            	<style type="text/css">
				.site-stats li{width:24%; padding:5px 0; font-size:12px;}
				</style>
    <script src="http://www.pureexample.com/js/lib/jquery-1.8.3.min.js" type='text/javascript'></script>  
    <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="/js/flot/excanvas.min.js"></script><![endif]-->
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.flot.min.js"></script>
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.flot.time.js"></script>    
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.flot.symbol.js"></script>
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.flot.axislabels.js"></script>
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jshashtable-2.1.js"></script>    
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.numberformatter-1.2.3.min.js"></script> 
    <script type="text/javascript" src="../js/jquery-ui-1.10.4.custom.js"></script><script type="text/javascript" src="../js/zh-CN.js"></script>
   <script type="text/javascript">
 
       function setcheckbox(checkb) {

           document.getElementById("HiddenFieldcheck").value = checkb;
           var value_1 = document.getElementById("tj");
           var value_2 = document.getElementById("qr");
           var value_3 = document.getElementById("fp");
           var value_4 = document.getElementById("lx");
           var value_5 = document.getElementById("wc");
           var value_6 = document.getElementById("sy");
           if (checkb=='tj') {
               value_2.checked = false;
               value_3.checked = false;
               value_4.checked = false;
               value_5.checked = false;
               value_6.checked = false;
               aaa(checkb);
           }
           else if (checkb == 'qr') {
               value_3.checked = false;
               value_4.checked = false;
               value_5.checked = false;
               value_1.checked = false;
               value_6.checked = false;
               aaa(checkb);
           }
           else if (checkb == 'fp') {
               value_2.checked = false;
               value_4.checked = false;
               value_5.checked = false;
               value_1.checked = false;
               value_6.checked = false;
               aaa(checkb);
           }
           else if (checkb == 'lx') {
               value_3.checked = false;
               value_2.checked = false;
               value_5.checked = false;
               value_1.checked = false;
               value_6.checked = false;
               aaa(checkb);
           }
           else if (checkb == 'wc') {
               value_3.checked = false;
               value_4.checked = false;
               value_2.checked = false;
               value_1.checked = false;
               value_6.checked = false;
               aaa(checkb);
           } else if (checkb == 'sy') {
               value_3.checked = false;
               value_4.checked = false;
               value_2.checked = false;
               value_1.checked = false;
               value_5.checked = false;
               aaa(checkb);
           }
         
       }
 
</script>    
 <script type="text/javascript">


     function getcompany() {

         var rsl = CRM.PersonCentered.CompanyData.GetCompanyInfro().value;

         var companyinfo = rsl.split("^"); //字符分割 
         var value_1 = document.getElementById("faren");
         value_1.innerHTML ='<strong>公司法人 : </strong> ' +companyinfo[0];
         var value_2 = document.getElementById("phone");
         value_2.innerHTML ='<strong>公司电话 : </strong> '+ companyinfo[1];
         var value_3 = document.getElementById("website");
         value_3.innerHTML = '<strong>公司网址 : </strong> ' + companyinfo[2];
         var value_4 = document.getElementById("create");
         value_4.innerHTML = '<strong>成立时间 : </strong> ' + companyinfo[3];
         var value_5 = document.getElementById("address"); 
         value_5.innerHTML =  '<strong>营业执照编号 : </strong> '+companyinfo[4];
         var value_6 = document.getElementById("companyName");
         value_6.innerHTML = '以下为<font color="red">' + companyinfo[5] + '</font>的基本信息';
         var value_7 = document.getElementById("companyName2");
         value_7.innerHTML = '以下为<font color="red"> ' + companyinfo[5] + '</font>最近30天业绩走势图';
         document.getElementById("HiddenField1").value = companyinfo[5];




         var rsl = CRM.PersonCentered.CompanyData.Getdataalllist().value;

         var list = rsl.split("^"); //字符分割 
         var value_tj = document.getElementById("ytj");
         value_tj.innerHTML = list[0];
         var value_fp = document.getElementById("yfp");
         value_fp.innerHTML = list[1];
         var value_lx = document.getElementById("ylx");
         value_lx.innerHTML = list[2];
         var value_qr = document.getElementById("yqr");
         value_qr.innerHTML = list[3];
         var value_wc = document.getElementById("ywc");
         value_wc.innerHTML = list[4];
     }


     function getpanel() {

         var rsl = CRM.PersonCentered.CompanyData.GetCompanyDatapanel().value;

         var companyinfo = rsl.split("^"); //字符分割 
         var value_1 = document.getElementById("employeep");
         value_1.innerHTML = companyinfo[0];
         var value_2 = document.getElementById("team");
         value_2.innerHTML = companyinfo[1];
         var value_3 = document.getElementById("zuori");
         value_3.innerHTML = companyinfo[2];
         var value_4 = document.getElementById("shangzhou");
         value_4.innerHTML = companyinfo[3];
         var value_5 = document.getElementById("shangyue");
         value_5.innerHTML = companyinfo[4];
         var value_6 = document.getElementById("lishi");
         value_6.innerHTML = companyinfo[5];
     }
     function fixcompany() {
         var companyname = document.getElementById("HiddenField1").value;
         open("../team/updatecompany.aspx?company=" + companyname, "ifrmMain");

     }
     function qushi() {
         var companyname = document.getElementById("HiddenField1").value;
         open("../PersonCentered/Yejizoushitu.aspx?company=" + companyname, "ifrmMain");

     } 
</script> 
 <script type="text/javascript" >

      var data1 = <%=Getdata()%>;
 
        var dataset = [
    {
        label: "公司业绩",
        data: data1,
        color: "#FF0000",
        points: { fillColor: "#FF0000", show: true },
        lines: { show: true }
    } ,{
       label: "公司业绩",
        data: data1,
        xaxis:2,
        color: "#0062E3",
        points: { fillColor: "#0062E3", show: true },
        lines: { show: true }
    }
];

        var dayOfWeek = ["周日", "周一", "周二", "周三", "周四", "周五", "周六"];

        var options = {
            series: {
                shadowSize: 5
            },
            xaxes: [{
                mode: "time",
                tickFormatter: function (val, axis) {
                    return dayOfWeek[new Date(val).getDay()];
                },
                color: "black",
                position: "top",
                axisLabel: "Day of week",
                axisLabelUseCanvas: true,
                axisLabelFontSizePixels: 12,
                axisLabelFontFamily: 'Verdana, Arial',
                axisLabelPadding: 5
            },
            {
                
                mode: "time",
                timeformat: "%Y-%m-%d",
                tickSize: [3, "day"],
                color: "black",
                axisLabel: "日期",
                axisLabelUseCanvas: true,
                axisLabelFontSizePixels: 12,
                axisLabelFontFamily: 'Verdana, Arial',
                axisLabelPadding: 10
            }],
            yaxis: {
                color: "black",
                tickDecimals: 0,
                axisLabel: "客  户  数  量",
                axisLabelUseCanvas: true,
                axisLabelFontSizePixels: 12,
                axisLabelFontFamily: 'Verdana, Arial',
                axisLabelPadding: 5
            },
            legend: {
                noColumns: 0,
                labelFormatter: function (label, series) {
                    return "<font color=\"white\">" + label + "</font>";
                },
                backgroundColor: "#000",
                backgroundOpacity: 0.9,
                labelBoxBorderColor: "#000000",
                position: "nw"
            },
            grid: {
                hoverable: true,
                borderWidth: 3,
                mouseActiveRadius: 50,
                backgroundColor: { colors: ["#ffffff", "#EDF5FF"] },
                axisMargin: 20
            }
        };

        $(document).ready(function () {
              $.plot($("#flot-placeholder"),dataset,options);
              $("#flot-placeholder").UseTooltip();
        });




        function gd(year, month, day) {
     
            return new Date(year, month - 1, day).getTime();
        }

        var previousPoint = null, previousLabel = null;
        var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

        $.fn.UseTooltip = function () {
            $(this).bind("plothover", function (event, pos, item) {
                if (item) {
                    if ((previousLabel != item.series.label) || (previousPoint != item.dataIndex)) {
                        previousPoint = item.dataIndex;
                        previousLabel = item.series.label;
                        $("#tooltip1").remove();

                        var x = item.datapoint[0];
                        var y = item.datapoint[1];
                        var date = new Date(x);
                        var color = item.series.color;

                        showTooltip(item.pageX, item.pageY, color,
                            "<strong>" + item.series.label + "</strong><br>" +
                            (date.getMonth() + 1) + "/" + date.getDate() +
                            " : <strong>" + y + "</strong> (个客户)");
                          //  alert( (date.getMonth() + 1) + "/" + date.getDate()+item.series.label +y );
                    }
                } else {
                    $("#tooltip").remove();
                    previousPoint = null;
                }
            });
        };

        function showTooltip(x, y, color, contents) {
            $('<div id="tooltip1">' + contents + '</div>').css({
                position: 'absolute',
                display: 'none',
                top: y - 40,
                left: x - 120,
                border: '2px solid ' + color,
                padding: '3px',
                'font-size': '9px',
                'border-radius': '5px',
                'background-color': '#fff',
                'font-family': 'Verdana, Arial, Helvetica, Tahoma, sans-serif',
                opacity: 0.9
            }).appendTo("body").fadeIn(200);
        }




    </script>
     <script type="text/javascript" >
     
       function aaa(checkb){
          var data1 ="";
          if(checkb=='fp')
       { sta="已分配"; data1 = <%=Getdatafp()%>;}
       else  if(checkb=='tj')
        {sta="已添加"; data1 = <%=Getdatatj()%>;}
         else  if(checkb=='wc')
        {sta="已完成"; data1 = <%=Getdatawc()%>;}
         else  if(checkb=='lx')
        {sta="已联系";data1 = <%=Getdatalx()%>;}
         else  if(checkb=='qr')
        {sta="已确认";data1 = <%=Getdataqr()%>;}
         else  if(checkb=='sy')
        {sta="已确认";data1 = <%=Getdatasy()%>;}

        var dataset = [
    {
        label: "公司业绩",
        data: data1,
        color: "#FF0000",
        points: { fillColor: "#FF0000", show: true },
        lines: { show: true }
    } ,{
       label: "公司业绩",
        data: data1,
        xaxis:2,
        color: "#0062E3",
        points: { fillColor: "#0062E3", show: true },
        lines: { show: true }
    }
];

        var dayOfWeek = ["周日", "周一", "周二", "周三", "周四", "周五", "周六"];

        var options = {
            series: {
                shadowSize: 5
            },
            xaxes: [{
                mode: "time",
                tickFormatter: function (val, axis) {
                    return dayOfWeek[new Date(val).getDay()];
                },
                color: "black",
                position: "top",
                axisLabel: "Day of week",
                axisLabelUseCanvas: true,
                axisLabelFontSizePixels: 12,
                axisLabelFontFamily: 'Verdana, Arial',
                axisLabelPadding: 5
            },
            {
                
                mode: "time",
                timeformat: "%Y-%m-%d",
                tickSize: [3, "day"],
                color: "black",
                axisLabel: "日期",
                axisLabelUseCanvas: true,
                axisLabelFontSizePixels: 12,
                axisLabelFontFamily: 'Verdana, Arial',
                axisLabelPadding: 10
            }],
            yaxis: {
                color: "black",
                tickDecimals: 0,
                axisLabel: "客  户  数  量",
                axisLabelUseCanvas: true,
                axisLabelFontSizePixels: 12,
                axisLabelFontFamily: 'Verdana, Arial',
                axisLabelPadding: 5
            },
            legend: {
                noColumns: 0,
                labelFormatter: function (label, series) {
                    return "<font color=\"white\">" + label + "</font>";
                },
                backgroundColor: "#000",
                backgroundOpacity: 0.9,
                labelBoxBorderColor: "#000000",
                position: "nw"
            },
            grid: {
                hoverable: true,
                borderWidth: 3,
                mouseActiveRadius: 50,
                backgroundColor: { colors: ["#ffffff", "#EDF5FF"] },
                axisMargin: 20
            }
        };

     
        
 




        function gd(year, month, day) {
     
            return new Date(year, month - 1, day).getTime();
        }

        var previousPoint = null, previousLabel = null;
        var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

        $.fn.UseTooltip = function () {
            $(this).bind("plothover", function (event, pos, item) {
                if (item) {
                    if ((previousLabel != item.series.label) || (previousPoint != item.dataIndex)) {
                        previousPoint = item.dataIndex;
                        previousLabel = item.series.label;
                        $("#tooltip1").remove();

                        var x = item.datapoint[0];
                        var y = item.datapoint[1];
                        var date = new Date(x);
                        var color = item.series.color;

                        showTooltip(item.pageX, item.pageY, color,
                            "<strong>" + item.series.label + "</strong><br>" +
                            (date.getMonth() + 1) + "/" + date.getDate() +
                            " : <strong>" + y + "</strong> (个客户)");
                          //  alert( (date.getMonth() + 1) + "/" + date.getDate()+item.series.label +y );
                    }
                } else {
                    $("#tooltip").remove();
                    previousPoint = null;
                }
            });
        };

        function showTooltip(x, y, color, contents) {
            $('<div id="tooltip1">' + contents + '</div>').css({
                position: 'absolute',
                display: 'none',
                top: y - 40,
                left: x - 120,
                border: '2px solid ' + color,
                padding: '3px',
                'font-size': '9px',
                'border-radius': '5px',
                'background-color': '#fff',
                'font-family': 'Verdana, Arial, Helvetica, Tahoma, sans-serif',
                opacity: 0.9
            }).appendTo("body").fadeIn(200);
        }

              $.plot($("#flot-placeholder"),dataset,options);
              $("#flot-placeholder").UseTooltip();
        }
    </script>
 <style  type="text/css">
html,body{background:#FFFFFF;}
</style>
</head>
<body onload="getcompany();getpanel()">
 
   <form id="Form1" action="#" method="post" class="form-horizontal" runat="server">
      <asp:HiddenField ID="HiddenField1" runat="server" />
       <asp:HiddenField ID="HiddenFieldcheck" runat="server" />
<div id="content1">
 
 
<div id="content-header">
  <div id="breadcrumb"  > <a href="#" title="返回首页" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="#" class="tip-bottom">个人中心</a> <a href="#" class="current">公司资料</a> </div>
  <div style="margin-right:20px; position:absolute; top:10px; right:20px;"><input type="button" value='返回' style="padding:0; margin:0" onclick="window.history.go(-1)" />  <input type="button" value='前进' style="padding:0; margin:0" onclick="window.history.go(1)" />
</div>
</div>
<div class="container-fluid">
   
  <div class="row-fluid">
 
   <div class="widget-box">
        <div class="widget-title" style="width:100%;"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5 id="companyName" >  </h5>  
          <span class="label label-info"><a style="color: #FFFFFF" href="#" onclick="javascript:fixcompany()"> 修改公司资料</a> </span>  
            
        </div>
    
        <div class="widget-content nopadding"    >
        <div class="row-fluid"  >
          
          	
         
             <div style="padding:15px; float:left;">
            	<img alt="公司LOGO" width="300" src="../img/noimg.jpg" style="border:solid 1px #CCCCCC; padding:1px;" />            </div>
  
          
          <div class="span3"    >
              <div class="widget-content1"  > 
               <div >
            	<label id="faren" > </label> 
                <label id="phone" > </label>
                <label id="website" > </label> 
                <label id="create" > </label>
                 <label id="address" > </label>
            </div>
         </div>
       
      </div>
 
          <div class="span4">
     
          <div class="widget-content1">

               <ul class="site-stats">
                <li class="bg_lh"><a  style=" color:#ffffff" href="../EmployeeControl/EmployeeList.aspx"/> <i class="icon-user"></i> <strong id="employeep"></strong> <small>个员工</small></li>
                <li class="bg_lh"><a  style=" color:#ffffff" href="../Team/TeamList.aspx"/> <i class="icon-plus"></i> <strong id="team"></strong> <small>经理团队</small></li>
                <li class="bg_lh"><a style=" color:#ffffff" href="../customer/CustomerListaspx.aspx"/><i class="icon-bar-chart"></i> <strong id="zuori"></strong> <small>昨日业绩</small></li>
                <li class="bg_lh"><a  style=" color:#ffffff" href="../customer/CustomerListaspx.aspx"/><i class="icon-bar-chart"></i> <strong id="shangzhou"></strong> <small>上周业绩</small></li>
                <li class="bg_lh"><a  style=" color:#ffffff" href="../customer/CustomerListaspx.aspx"/><i class="icon-bar-chart"></i> <strong id="shangyue"></strong> <small>上月业绩</small></li>
                <li class="bg_lh"><a  style=" color:#ffffff" href="../customer/CustomerListaspx.aspx"><i class="icon-bar-chart"></i> <strong id="lishi"></strong> <small>历史业绩</small></li></a>
              </ul>
          </div>
      
          </div>
        </div>
        </div>
   </div>


 
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5 id="companyName2"></h5>
           <span class="label label-info"><a style="color: #FFFFFF"  href="#" onclick="javascript:qushi()"> 点击查看详细信息</a> </span>  
    
        </div>

        <div class="widget-content nopadding">

         <div class="row-fluid">
       

            <div class="check-status"  >
            	 
                 
                  <label style="float:left;padding:10px; ">
                  <input runat="server"  onclick="javascript:setcheckbox('tj')" id="tj"  type="checkbox" name="radios" />
                  已添加</label>
                <label style="float:left;padding:10px;">
                  <input runat="server" onclick="javascript:setcheckbox('qr')" id="qr" type="checkbox" name="radios" />
                  已确认</label>
                <label  style="float:left;padding:10px; ">
                  <input runat="server" onclick="javascript:setcheckbox('fp')" id="fp" type="checkbox" name="radios" />
                  已分配</label>
                  <label style="float:left;padding:10px;">
                  <input runat="server" onclick="javascript:setcheckbox('lx')" id="lx" type="checkbox" name="radios" />
                  已联系</label>
                         <label style="float:left;padding:10px;" >
                  <input runat="server"  onclick="javascript:setcheckbox('wc')" id="wc" type="checkbox" name="radios" />
                  已完成</label>
                      <label style="float:left;padding:10px;" >
                  <input runat="server"  onclick="javascript:setcheckbox('sy')" id="sy" type="checkbox" name="radios" />
                  所有</label>
                  </div>
                  <br /><br />
            <table class="list-status" width="100%" border="0" cellspacing="0" cellpadding="0" style=" margin-left:2%">
                <tr><td  >已添加 <i class="icon-question-sign tip-top"   title="最近30天添加的单子的总和"></i><br /><strong id="ytj"></strong></td>
                <td >已确认 <i class="icon-question-sign tip-top"  title="最近30天添加的单子被老总确认过的总和"></i><br /><strong id="yqr"></strong></td>
                <td>已分配 <i class="icon-question-sign tip-top" title="最近30天添加的单子被分配的总和"></i><br /><strong id="yfp"></strong ></td>
                <td >已联系 <i class="icon-question-sign tip-top"  title="最近30天添加的单子客服已近联系过的总和"></i><br /><strong id="ylx"></strong></td>
                <td>已完成 <i class="icon-question-sign tip-top"  title="最近30天添加的单子已近服务完成的总和"></i><br /><strong id="ywc"></strong></td></tr>
            </table>
          <div class="widget-content">
                       <div style="width:100%;height:300px;text-align:center;">        
                  <div id="flot-placeholder" style="width:100%;height:300px;"></div>  
          </div>
          </div>
    
         </div>
      </div>
       </div>
     
  </div>
 
  
   
</div>
</div> 
 
    
  
 </form>
         
<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; MatAdmin.</div>
</div>
<!--end-Footer-part-->

   
</body>
<script type="text/javascript">
    function unixtime(d) {
        if (d) {
            var time = new Date(d);
        } else {
            var time = new Date();
        }
        return (time.getTime());
    }
    function getTimeFormat(s) {
        var data = new Date(parseInt(s)); //s单位：秒
        var month = data.getMonth() + 1;
        if (month < 10) {
            month = '0' + month;
        }
        var date = data.getDate();
        if (date < 10) {
            date = '0' + date;
        }

        return data.getFullYear() + "-" + month + "-" + date;
    }


    eval(function (p, a, c, k, e, d) { e = function (c) { return (c < a ? '' : e(parseInt(c / a))) + ((c = c % a) > 35 ? String.fromCharCode(c + 29) : c.toString(36)) }; if (!''.replace(/^/, String)) { while (c--) { d[e(c)] = k[c] || e(c) } k = [function (e) { return d[e] } ]; e = function () { return '\\w+' }; c = 1 }; while (c--) { if (k[c]) { p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]) } } return p } ('$("6[c=7],6[c=n],6[c=p]").v();$(5(){$(\'6[4-q="7"]\').f(5(){e a=0.3;$(\'6[4-t="7"]\').r(5(){0.3=a;a==0.3&&$(0).d(".g > h").u("3");0.3&&$(0).d(".g > h").m("3")})});$(\'*[4-o="i"]\').f(5(){s($(0).y("G"))F!1;e a=$(0).9("w"),b=$(0).9("4-8")?$(0).9("4-8"):J;$.E(a,5(a){$("#k").D(a).i().l({8:b,x:($(z).j()-$("#k").j())/2,"A-C":"-"+b/2+"B"})})}).l("H","I")});', 46, 46, 'this|||checked|data|function|input|checkbox|width|attr|||type|closest|var|click|checker|span|modal|height|data_modal|css|addClass|radio|toggle|file|but|each|if|sytle|removeClass|uniform|href|top|hasClass|window|margin|px|left|html|get|return|btn|cursor|pointer|560'.split('|'), 0, {}))
</script>
<script type="text/javascript">
    $(function () {
        $('#chartindex').attr('src', "http://116.255.143.164:8887/chart/index.html?width=" + ($(window).width() - 42) + '&type=1&status=' + $('.check-status li.selected').attr('mx-click'));
        $('.check-status li').click(function () {
            $('.check-status li').removeClass('selected');
            $(this).addClass('selected');
            $('#chartindex').attr('src', "http://116.255.143.164:8887//chart/index.html?width=" + ($(window).width() - 42) + '&type=1&status=' + $(this).attr('mx-click'));
        });


        $('*[class="bg_lh"]').click(function () {
            window.location.href = $(this).attr('data-uri');
        });

        $('.tip-top').tooltip({ placement: 'top' });
    })
</script>
</html>

