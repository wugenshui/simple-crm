<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gerenziliao.aspx.cs" Inherits="CRM.PersonCentered.Gerenziliao" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
 
 
<head>
<title>个人资料</title>
 
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="../css/matrix-style.css" />
<link rel="stylesheet" href="../css/matrix-media.css" />
<link href="../font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.useso.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'/>


<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta HTTP-EQUIV="pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<meta HTTP-EQUIV="expires" CONTENT="0">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-responsive.min.css" />
<link rel="stylesheet" type="text/css" href="../css/uniform.css" />
<link rel="stylesheet" type="text/css" href="../css/matrix-style.css" />
<link rel="stylesheet" type="text/css" href="../css/matrix-media.css" />
<link rel="stylesheet" type="text/css" href="../css/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="../css/jquery.gritter.css" />
<style type="text/css">
html,body{background:#FFFFFF;}
</style>
<style type="text/css">
.my_info_box{margin:20px 20px 0 20px; position:relative;}
.my_info_box .my_info{width:280px; height:250px; position:absolute; padding:27px 0 0; left:0px; top:0px; border:1px solid #CDCDCD; border-right:none; background:#FFFFFF; text-align: center;}

.ibx-uc-uimg {
  padding-top: 13px;
  margin-bottom: 5px;
  height: 78px;
  position: relative;
}
.ibx-uc-img {
  width: 72px;
  height: 72px;
  padding: 2px;
  border: 1px solid #dddddd;
}
.ibx-uc-uimg-mask {
  position: absolute;
  z-index: 2;
  top: 13px;
  left: 50%;
  margin-left: -39px;
  width: 78px;
  height: 78px;
  cursor: pointer;
}
.ibx-uc-uimg-mask:hover .ibx-uc-ulink {
  display: block;
}
.ibx-uc-ulink {
  display: none;
  width: 78px;
  position: absolute;
  left: 50%;
  bottom: 0;
  line-height: 24px;
  color: #FFFFFF;
  font-size: 12px;
  text-decoration: none;
  cursor: pointer;
  margin-left: -39px;
  z-index: 5;
  background: rgba(0, 0, 0, 0.6);
  background: black\9;
  filter: alpha(opacity=70) \9;
}
.ibx-uc-unick {
  line-height: 24px;
  font-size: 16px;
  margin-bottom: 2px;
}
.ibx-uc-nick {
  color: #4b4b4b;
  text-decoration: none;
  cursor: pointer;
  display: inline-block;
  font-size: 14px;
}
.ibx-uc-nick:hover {
  color: #1892f0;
  text-decoration: none;
}
.ibx-uc-nick:active {
  color: #0981e7;
  text-decoration: none;
}
.ibx-uc-utool {
  color: #BCBCBC;
  font-size: 12px;
  width: 156px;
  height: 60px;
  margin: 8px auto 0;
  border-top: solid #e8e8e8 1px;
  position: relative;
}
.ibx-uc-utool .ibx-uc-utool-cover {
  position: absolute;
  top: -8px;
  left: 76px;
  width: 0;
  height: 0;
  border: 4px solid #e8e8e8;
  border-color: transparent transparent #e8e8e8 transparent;
}
.ibx-uc-utool .ibx-uc-utool-cover.ibx-uc-utool-cover-mask {
  top: -7px;
  border: 4px solid #FFFFFF;
  border-color: transparent transparent #FFFFFF transparent;
}
.ibx-uc-utool .ibx-uc-utool-title,
.ibx-uc-utool .ibx-uc-utool-content {
  float: left;
  margin-top: 10px;
}
.ibx-uc-utool .ibx-uc-utool-title {
  width: 36px;
  text-align: left;
}
.ibx-uc-utool .ibx-uc-utool-content {
  width: 112px;
  padding-left: 8px;
  text-align: left;
}
.ibx-uc-uop {
  width: 184px;
  height: 30px;
  margin: 20px auto 0;
}
.ibx-uc-uop-item {
  float: left;
  width: 92px;
  font-size: 14px;
}
.ibx-uc-uop-item.first {
  border-right: 1px dotted #e0e0e0;
  margin-right: -1px;
}
.ibx-uc-uop-item a {
  color: #4b4b4b;
  text-decoration: none;
}
.ibx-uc-uop-item a:hover,
.ibx-uc-uop-item a:active {
  text-decoration: underline;
}




.my_info_box .widget-box li{ position:relative;height:70px; width:70px; text-align:center;}
.my_info_box .widget-box .widget-title li a{line-height:54px;}
.my_info_box .widget-box .widget-title li span.ibx-cal-tl-bg{position:absolute;top:-1px;right:-1px;width:0;height:0;border:16px solid #1796F9; border-color:#1796F9 #1796F9 transparent transparent;display:none}
.my_info_box .widget-box .widget-title li span.ibx-cal-tl-num{position:absolute;top:3px;right:2px;line-height:14px;width:14px;text-align:center;color:#FFF;font-size:12px;display:none; font-weight: 700;}
.my_info_box .widget-box .widget-title li.active span{display:block;}

.ibx-cal-time {
    height: 150px;
    padding-top: 20px;
    text-align: center;
    width: 15%;
}
.ibx-cal-tdate {
    margin-bottom: 20px;
}
.ibx-cal-tdate, .ibx-cal-tday {
    color: #444444;
    font-size: 14px;
    font-weight: 700;
    line-height: 16px;
}

.ibx-cal-nl {
    color: #919191;
    font-size: 11px;
    margin-bottom: 9px;
}

.ibx-cal-tloc-ctx {
    display: inline-block;
    text-align: left;
	cursor: pointer;
    font-size: 12px;
    line-height: 18px;
}

.ibx-cal-tloc-ctx .ibx-cal-tloc-ctx-zn {
    background: url("../images/icon.png") no-repeat;
    color: #444444;
    display: inline-block;
    font-size: 14px;
    font-weight: 700;
    line-height: 22px;
    padding-left: 20px;
}

.ibx-cal-detail {
    height: 204px;
    left: 15%;
    overflow: hidden;
    position: absolute;
    right: 0;
    top: 20px;
    width: 85%;
}
.ibx-cal-detail-item {
    float: left;
    height: 170px;
    list-style: none outside none;
    margin-right: 1.25%;
    position: relative;
    width: 8.75%;
}
.ibx-cal-dic-weather {
    background: url("../images/cal_weather_bg.jpg") no-repeat;
}
.ibx-cal-dic {
    border: 1px solid #F6F8FB;
    height: 168px;
}

.ibx-cal-detail-close {
    background: url("../images/ibx_cal.png") no-repeat 0 -150px;
    cursor: pointer;
    display: none;
    height: 20px;
    position: absolute;
    right: 1px;
    text-decoration: none;
    top: 1px;
    width: 20px;
}
.ibx-cal-di-ntoday {
    color: #FFFFFF;
    display: none;
    font-size: 12px;
    left: 0;
    padding-top: 34px;
    position: absolute;
    text-align: center;
    top: 0;
    width: 100%;
}
.ibx-cal-detail-item.nToday .ibx-cal-di-ntoday {
    display: block;
}
.ibx-cal-din-logo {
    margin-bottom: 13px;
}
.ibx-cal-din-logo img {
    max-height: 72px;
    max-width: 72px;
}

.ibx-cal-din-du {
    font-size: 20px;
    margin-bottom: 12px;
}
.ibx-cal-ditw-wind {
    margin-bottom: 10px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    width: 100%;
}
.ibx-cal-di-ntoday .ibx-cal-ditw-wind {
    display: inline-block;
}
.ibx-cal-ditwq-logo, .ibx-cal-ditww-logo {
    background: url("../images/weather_quality.png") no-repeat;
    height: 18px;
    margin-right: 6px;
    text-align: center;
    width: 18px;
}
.ibx-cal-ditww-logo {
    background-position: 0 -180px;
    display: inline-block;
    vertical-align: -30%;
}
.ibx-cal-detail-item {
    float: left;
    height: 170px;
    list-style: none outside none;
    margin-right: 1.25%;
    position: relative;
    width: 8.75%;
}

.ibx-cal-addCal {
    background-color: #F7F9FB;
    border: 1px dashed #D2D7D8;
    cursor: pointer;
    display: block;
    height: 168px;
    text-align: center;
    text-decoration: none;
}

.ibx-cal-ac-add {
    background: url("../images/add_cal.png") no-repeat center 45px;
    height: 132px;
}
.ibx-cal-addCal:hover .ibx-cal-ac-add{background-position:center -106px;}
.ibx-cal-ac-txt {
    color: #878686;
    font-size: 12px;
}
</style>
  <script src="http://www.pureexample.com/js/lib/jquery-1.8.3.min.js" type='text/javascript'></script>  
    <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="/js/flot/excanvas.min.js"></script><![endif]-->
     
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.flot.min.js"></script>
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.flot.time.js"></script>    
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.flot.symbol.js"></script>
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.flot.axislabels.js"></script>
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jshashtable-2.1.js"></script>    
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.numberformatter-1.2.3.min.js"></script> 
    
   <script type="text/javascript">

          function setcheckbox(checkb) {
 
              var value_1 = document.getElementById("tj");
              var value_2 = document.getElementById("qr");
              var value_3 = document.getElementById("fp");
              var value_4 = document.getElementById("lx");
              var value_5 = document.getElementById("wc");
              var value_6 = document.getElementById("sy");
              if (checkb == 'tj') {
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

         var rsl = CRM.PersonCentered.Gerenziliao.GetPersonInfro().value;

         var companyinfo = rsl.split("^"); //字符分割 
      
         var value_11 = document.getElementById("name1");
 
   
         value_11.innerHTML = companyinfo[0];
      
    
         var value_21 = document.getElementById("phone1");
 
         value_21.innerHTML = companyinfo[1];
   
         var value_31 = document.getElementById("qq1");
      
         value_31.innerHTML = companyinfo[2];
      
         document.getElementById("HiddenField1").value = companyinfo[5];


         var rsdate = CRM.PersonCentered.Gerenziliao.GetChineseDate().value;
         var datelist = rsdate.split("^"); //字符分割 
         var value_gl = document.getElementById("gongli");
         value_gl.innerHTML = datelist[0];
         var value_nl = document.getElementById("nongli");
         value_nl.innerHTML = datelist[1];
         var value_xq = document.getElementById("xingqi");
         value_xq.innerHTML = datelist[2];
         var value_jiasan = document.getElementById("jiasan");
         value_jiasan.innerHTML = datelist[3];
         var value_jiasi = document.getElementById("jiasi");
         value_jiasi.innerHTML = datelist[4];
         var value_jiawu = document.getElementById("jiawu");
         value_jiawu.innerHTML = datelist[5];
         var value_jialiu = document.getElementById("jialiu");
         value_jialiu.innerHTML = datelist[6];



         var rsl = CRM.PersonCentered.Gerenziliao.Getdataalllist().value;

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

     function qushi() {
         var companyname = document.getElementById("HiddenField1").value;
         open("../PersonCentered/Yejizoushitu.aspx?company=" + companyname, "ifrmMain");

     } 
 
 
</script> 
  <script type="text/javascript" >

        var data1 = <%=Getdata()%>;
    
        var dataset = [
    {
        label: "个人业绩",
        data: data1,
        color: "#FF0000",
        points: { fillColor: "#FF0000", show: true },
        lines: { show: true }
    }  ,   {
       label: "个人业绩",
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
            $.plot($("#flot-placeholder"), dataset, options);
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
        label: "个人业绩",
        data: data1,
        color: "#FF0000",
        points: { fillColor: "#FF0000", show: true },
        lines: { show: true }
    } ,{
       label: "个人业绩",
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

 <link rel="stylesheet" type="text/css" href="../css/select2.css" />


<link rel="stylesheet" type="text/css" href="../css/jquery-ui-1.10.4.custom.min.css" />
<script type="text/javascript" src="../js/jquery-ui-1.10.4.custom.js"></script><script type="text/javascript" src="../js/zh-CN.js"></script>
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
<script type="text/javascript" src="../js/jquery.gritter.min.js"></script>     
<script type="text/javascript">
    function aa() {
        $('.ibx-cal-tl-item').click(function () {
            //alert($(this).attr('class'));
            $('.ibx-cal-tl-item').removeClass('active');
            $(this).addClass('active');
            $(this).attr('data-time');


        });

        var type = 4;
        $('#chartindex').attr('src', "/chart/index.html?width=" + ($(window).width() - 42) + '&type=' + type + '&status=' + $('.check-status li.selected').attr('mx-click'));
        $('.check-status li').click(function () {
            $('.check-status li').removeClass('selected');
            $(this).addClass('selected');
            $('#chartindex').attr('src', "/chart/index.html?width=" + ($(window).width() - 42) + '&type=' + type + '&status=' + $(this).attr('mx-click'));
        });

        $('.tip-top').tooltip({ placement: 'top' });
        $('.nToday').hover(function () {
            $('.ibx-cal-detail-close').show();
        }, function () {
            $('.ibx-cal-detail-close').hide();
        });
    }
</script>

</head>
<body onload="getcompany()">
 
   <form id="Form1" action="#" method="post" class="form-horizontal" runat="server">
      <asp:HiddenField ID="HiddenField1" runat="server" />
<div id="content1">
 
<div id="content-header">
  <div id="breadcrumb" style="  top:10px; " > <a href="#" title="返回首页" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="#" class="tip-bottom">个人中心</a> <a href="#" class="current">个人资料</a> </div>
  <div style="margin-right:20px; position:absolute; top:10px; right:20px;"><input type="button" value='返回' style="padding:0; margin:0" onClick="window.history.go(-1)" />  <input type="button" value='前进' style="padding:0; margin:0" onClick="window.history.go(1)" />
</div>
</div>




<div class="my_info_box">
	<div class="my_info">
        <div class="ibx-uc-uimg">
            <div class="ibx-uc-uimg-mask">
                <a class="ibx-uc-ulink" href="/index/avatar.html">更换头像</a>
            </div>
            <img class="ibx-uc-img" src="/Public/Uploads/avatar/default_user_portrait.gif">
        </div>
		<div class="ibx-uc-unick">
        	<a class="ibx-uc-nick" href="/index/profile.html" id="name1"> </a>
        </div>
        
        <div class="ibx-uc-utool">
            <span class="ibx-uc-utool-cover"></span>
            <span class="ibx-uc-utool-cover ibx-uc-utool-cover-mask"></span>
            <div id="ibx-uc-ur-level" class="ibx-uc-utool-title">电话 :</div>
            <div class="ibx-uc-utool-content" style="height:30px;" id="phone1">
    			  
            </div>
            <div class="ibx-uc-utool-title">QQ:</div>
            <div class="ibx-uc-utool-content clr" id="qq1">
                             </div>
        </div>
        <div class="ibx-uc-uop">
            <div class="ibx-uc-uop-item first">
            	<a title="我的客户" href="/consumer/index.html"> 我的客户 </a>
            </div>
            <div class="ibx-uc-uop-item">
            	<a title="修改资料" href="/index/profile.html"> 修改资料 </a>
            </div>
        </div>
        
        
        
    </div>
    <div class="widget-box" style="margin-left:281px;">
      <div class="widget-title" style="height:70px;">
        <ul class="nav nav-tabs">
          <li class="ibx-cal-tl-item active" data-time="1431681773">
          	<span class="ibx-cal-tl-bg"></span><span class="ibx-cal-tl-num">0</span>
			<a href="javascript:aa();">今天</a>
		  </li>
          <li class="ibx-cal-tl-item" data-time="1431681773"><span class="ibx-cal-tl-bg"></span><span class="ibx-cal-tl-num">0</span><a href="javascript:aa();">明天</a></li>
          <li class="ibx-cal-tl-item" data-time="1431681773"><span class="ibx-cal-tl-bg"></span><span class="ibx-cal-tl-num">0</span><a href="javascript:aa();">后天</a></li>
          <li class="ibx-cal-tl-item" data-time="1431681773"><span class="ibx-cal-tl-bg"></span><span class="ibx-cal-tl-num">0</span><a href="javascript:aa();" id="jiasan"></a></li>
          <li class="ibx-cal-tl-item" data-time="1431681773"><span class="ibx-cal-tl-bg"></span><span class="ibx-cal-tl-num">0</span><a href="javascript:aa();" id="jiasi"></a></li>
          <li class="ibx-cal-tl-item" data-time="1431681773"><span class="ibx-cal-tl-bg"></span><span class="ibx-cal-tl-num">0</span><a href="javascript:aa();" id="jiawu"></a></li>
          <li class="ibx-cal-tl-item" data-time="1431681773"><span class="ibx-cal-tl-bg"></span><span class="ibx-cal-tl-num">0</span><a href="javascript:aa();" id="jialiu"></a></li>
        </ul>
      </div>
      <div class="widget-content tab-content" id="ibx-cal-list" style="height:176px; position:relative; overflow:hidden;">
		



		<div class="ibx-cal-time">
        	<div class="ibx-cal-tday" id="gongli"></div>
        	<div class="ibx-cal-nl" id="xingqi"></div>
        	<div class="ibx-cal-tdate"id="nongli"></div>
            <span class="ibx-cal-tloc-ctx">
                <span class="ibx-cal-tloc-ctx-zn">福建省厦门市思明区</span>
            </span>
        	<div class="ibx-cal-tcar"></div>
        </div>
        
        <div id="ibx-cal-detail" class="ibx-cal-detail">
            <ul id="ibx-cal-detail-list" class="ibx-cal-dlist clr" style="width: 954px; margin-left: 0px;">
                
                
                
                <li class="ibx-cal-detail-item nToday" style="width: 208px; margin-right: 30px;">
                    <div class="ibx-cal-dic ibx-cal-dic-weather"></div>
                    <div class="ibx-cal-di-ntoday">
                        <div class="ibx-cal-din-logo">
                            <img  src="http://www.baidu.com/aladdin/img/new_weath/icon/3.png" title="阴"/>
                        </div>
                        <div class="ibx-cal-din-du"></div>
                        <div class="ibx-cal-ditw-wind">
                            <span class="ibx-cal-ditww-logo"></span>
                            <span title="微风">微风</span>
                        </div>
                    </div>
                    <a class="ibx-cal-detail-close" href="javascript:aa();" data-uuid="19179b10f95d2625f67cb71905dc5c25" data-uri="calendars/ucvs/weather" title="关闭"></a>
                </li>
                
                <li class="ibx-cal-detail-item" style="width: 208px; margin-right: 30px;">
                    <a class="ibx-cal-addCal" href="javascript:aa();" onclick="{"act":"cal_add"}">
                    	<div class="ibx-cal-ac-add"></div>
                    	<div class="ibx-cal-ac-txt">添加日程</div>
                    </a>
                </li> 
                
            </ul>
        </div>

      </div>
    </div>

</div>








<div class="container-fluid">
   
  <div class="row-fluid">
 



 
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5 id="companyName2">最近30天业绩走势图</h5>
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

</html>

