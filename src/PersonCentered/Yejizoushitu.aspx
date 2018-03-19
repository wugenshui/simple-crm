<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Yejizoushitu.aspx.cs" Inherits="CRM.PersonCentered.Yejizoushitu" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
 
 
<head>
<title>业绩走势图</title>
 
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="../css/matrix-style.css" />
<link rel="stylesheet" href="../css/matrix-media.css" />
<link href="../font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.useso.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'/>
    <script src="http://www.pureexample.com/js/lib/jquery-1.8.3.min.js" type='text/javascript'></script>  
    <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="/js/flot/excanvas.min.js"></script><![endif]-->
     
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.flot.min.js"></script>
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.flot.time.js"></script>    
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.flot.symbol.js"></script>
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.flot.axislabels.js"></script>
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jshashtable-2.1.js"></script>    
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.numberformatter-1.2.3.min.js"></script> 
     
 <script type="text/javascript">


     function getcompany() {

         var rsl = CRM.PersonCentered.CompanyData.GetCompanyInfro().value;

         var companyinfo = rsl.split("^"); //字符分割 
         var value_1 = document.getElementById("faren");
         value_1.innerHTML = companyinfo[0];
         var value_2 = document.getElementById("phone");
         value_2.innerHTML = companyinfo[1];
         var value_3 = document.getElementById("website");
         value_3.innerHTML = companyinfo[2];
         var value_4 = document.getElementById("create");
         value_4.innerHTML = companyinfo[3];
         var value_5 = document.getElementById("address");
         value_5.innerHTML = companyinfo[4];
         var value_6 = document.getElementById("companyName");
         value_6.innerHTML = "以下为 " + companyinfo[5] + " 的基本信息";
         var value_7 = document.getElementById("companyName2");
         value_7.innerHTML = "以下为 " + companyinfo[5] + " 最近30天业绩走势图";
         document.getElementById("HiddenField1").value = companyinfo[5];
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
    }  ,   {
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
  <style  type="text/css">
html,body{background:#FFFFFF;}
</style>
</head>
<body onload="getcompany();getpanel()">
 
   <form id="Form1" action="#" method="post" class="form-horizontal" runat="server">
      <asp:HiddenField ID="HiddenField1" runat="server" />
<div id="content1">
 
<div id="content-header">
  <div id="breadcrumb"  > <a href="#" title="返回首页" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="#" class="tip-bottom">个人中心</a> <a href="#" class="current">业绩走势图</a> </div>
</div>
<div class="container-fluid">
   
  <div class="row-fluid">
 
   <div class="widget-box">
        <div class="widget-content nopadding">
        <div class="row-fluid">
          <div class="span12">
          <div class="widget-content1">   
            <div style="width:100%;height:300px;text-align:center;">        
                  <div id="flot-placeholder" style="width:100%;height:300px;"></div>  
          </div>
      </div>
 
        </div>
        </div>
   </div>


 
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5 id="companyName2"></h5>
        </div>

        <div class="widget-content nopadding">

         <div class="row-fluid">

          <div class="widget-content">
       <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" Width="100%" AutoGenerateColumns="False" 
          >
        <Columns>
            <asp:TemplateField HeaderText="日期"> <ItemTemplate> <%# Eval("times")%> </ItemTemplate> </asp:TemplateField>
            <asp:TemplateField HeaderText="已添加"><ItemTemplate> <%# Eval("tianjia")%> </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="已分配"><ItemTemplate> <%# Eval("feipei")%> </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="已联系"><ItemTemplate> <%# Eval("lianxi")%> </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="已确认"><ItemTemplate> <%# Eval("queren")%> </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="已完成"><ItemTemplate> <%# Eval("wancheng")%> </ItemTemplate></asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399"  HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
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

