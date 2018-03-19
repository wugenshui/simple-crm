<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="CRM.test" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script src="http://www.pureexample.com/js/lib/jquery-1.8.3.min.js" type='text/javascript'></script>  
    <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="/js/flot/excanvas.min.js"></script><![endif]-->
     
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.flot.min.js"></script>
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.flot.time.js"></script>    
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.flot.symbol.js"></script>
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.flot.axislabels.js"></script>
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jshashtable-2.1.js"></script>    
    <script type="text/javascript" src="http://www.pureexample.com/js/flot/jquery.numberformatter-1.2.3.min.js"></script> 
     
    
 
    <script type="text/javascript" >

         var data1 = <%=Getdata()%>;

   
        //Buy
        var data2 = [
    [gd(2013, 1, 2), 1674.15], [gd(2013, 1, 3), 1680.15], [gd(2013, 1, 4), 1643.8],
    [gd(2013, 1, 7), 1652.25], [gd(2013, 1, 8), 1640.3], [gd(2013, 1, 9), 1652.75],
    [gd(2013, 1, 10), 1652.25], [gd(2013, 1, 11), 1664.2], [gd(2013, 1, 14), 1660.7],
    [gd(2013, 1, 15), 1664.7], [gd(2013, 1, 16), 1673.65], [gd(2013, 1, 17), 1671.15],
    [gd(2013, 1, 18), 1682.1], [gd(2013, 1, 21), 1680.65], [gd(2013, 1, 22), 1685.1],
    [gd(2013, 1, 23), 1684.6], [gd(2013, 1, 24), 1670.65], [gd(2013, 1, 25), 1664],
    [gd(2013, 1, 28), 1652.75], [gd(2013, 1, 29), 1655.25], [gd(2013, 1, 30), 1659.7],
    [gd(2013, 1, 31), 1668.2]
];
 

        var dataset = [
    {
        label: "公司业绩",
        data: data1,
        color: "#FF0000",
        points: { fillColor: "#FF0000", show: true },
        lines: { show: true }
    }  ,   {
       // label: "Buy in",
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
                        $("#tooltip").remove();

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
            $('<div id="tooltip">' + contents + '</div>').css({
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
</head>
<body>
    <div style="width:300px;height:200px;text-align:center;">        
        <div id="flot-placeholder" style="width:300px;height:200px;"></div>        
    </div>
</body>
</html>