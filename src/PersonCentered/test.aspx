<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="CRM.PersonCentered.test" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "<a href="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" target="_blank">http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd</a>">

<html xmlns="<a href="http://www.w3.org/1999/xhtml" target="_blank">http://www.w3.org/1999/xhtml</a>">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>竖形菜单</title>

<style type="text/css">

body {

font-family: arial, 宋体, serif;

font-size:12px;

}

*{margin:0px; padding:0px;}

#nav {

width:174px;

    line-height: 24px;

list-style-type: none;

text-align:left;

    /*定义整个ul菜单的行高和背景色*/

}

/*==================一级目录===================*/

#nav a {

width: 174px;

display: block;

padding-left:20px;

/*Width(一定要)，否则下面的Li会变形*/

}

#nav li {

border-bottom:#FFF 1px solid; /*下面的一条白边*/

float:left;

background-color: #FECFD6;

color:#DD1336;

font-weight:bold;

background: url(../images/dot_o.gif) no-repeat 8px 8px;

}

#nav li a:hover{

background:#F85B78; /*一级目录onMouseOver显示的背景色*/

}

#nav a:link {

color:#DD1336; text-decoration:none;

}

#nav a:visited {

color:#DD1336;text-decoration:none;

}

#nav a:hover {

color:#FFF;text-decoration:none;font-weight:bold;

}

/*==================二级目录===================*/

#nav li ul {

list-style:none;

text-align:left;

}

#nav li ul li{

background: #F5F5F5; /*二级目录的背景色*/

font-weight:normal;

}

#nav li ul a{

         padding-left:20px;

         width:174px;

/* padding-left二级目录中文字向右移动，但Width必须重新设置=(总宽度-padding-left)*/

}

/*下面是二级目录的链接样式*/

#nav li ul a:link {

color:#666; text-decoration:none;

}

#nav li ul a:visited {

color:#666;text-decoration:none;

}

#nav li ul a:hover {

color:#F3F3F3;

text-decoration:none;

font-weight:normal;

background:#FFAA1C;

/* 二级onmouseover的字体颜色、背景色*/

}

/*==============================*/

#nav li:hover ul {

left: auto;

}

#nav li.sfhover ul {

left: auto;

}

#content {

clear: left;

}

#nav ul.collapsed {

display: none;

}

#PARENT{

width:174px;

}

</style>

</head>

<body>

<div id="PARENT" style="background-color:#999999; color:#CC0000">

<ul id="nav">

<li><a href="#Menu=ChildMenu1" onClick="DoMenu('ChildMenu1')">菜单一</a>

    <ul id="ChildMenu1" class="collapsed">

<li><a href=##Menu=ChildMenu1>菜单一</a></li>

<li><a href=##Menu=ChildMenu1>菜单一</a></li>

<li><a href=##Menu=ChildMenu1>菜单一</a></li>

<li><a href=##Menu=ChildMenu1>菜单一</a></li>

<li><a href=##Menu=ChildMenu1>菜单一</a></li>

<li><a href=##Menu=ChildMenu1>菜单一</a></li>

<li><a href=##Menu=ChildMenu1>菜单一</a></li>

<li><a href=##Menu=ChildMenu1>菜单一</a></li>

<li><a href=##Menu=ChildMenu1>菜单一</a></li>

<li><a href=##Menu=ChildMenu1>菜单一</a></li>

<li><a href=##Menu=ChildMenu1>菜单一</a></li>

<li><a href=##Menu=ChildMenu1>菜单一</a></li>

   </ul>

</li>

<li><a href="#Menu=ChildMenu2" onClick="DoMenu('ChildMenu2')">菜单二</a>

    <ul id="ChildMenu2" class="collapsed">

<li><a href=##Menu=ChildMenu2>菜单二</a></li>

<li><a href=##Menu=ChildMenu2>菜单二</a></li>

<li><a href=##Menu=ChildMenu2>菜单二</a></li>

<li><a href=##Menu=ChildMenu2>菜单二</a></li>

<li><a href=##Menu=ChildMenu2>菜单二</a></li>

   </ul>

</li>

<li><a href="#Menu=ChildMenu3" onClick="DoMenu('ChildMenu3')">菜单三</a>

    <ul id="ChildMenu3" class="collapsed">

<li><a href=##Menu=ChildMenu3>菜单三</a></li>

<li><a href=##Menu=ChildMenu3>菜单三</a></li>

<li><a href=##Menu=ChildMenu3>菜单三</a></li>

<li><a href=##Menu=ChildMenu3>菜单三</a></li>

<li><a href=##Menu=ChildMenu3>菜单三</a></li>

<li><a href=##Menu=ChildMenu3>菜单三</a></li>

   </ul>

</li>

<li><a href="#Menu=ChildMenu4" onClick="DoMenu('ChildMenu4')">菜单四</a>

    <ul id="ChildMenu4" class="collapsed">

<li><a href=##Menu=ChildMenu4>菜单四</a></li>

<li><a href=#Menu=ChildMenu4>菜单四</a></li>

<li><a href=##Menu=ChildMenu4>菜单四</a></li>

<li><a href=##Menu=ChildMenu4>菜单四</a></li>

<li><a href=##Menu=ChildMenu4>菜单四</a></li>

<li><a href=##Menu=ChildMenu4>菜单四</a></li>

   </ul>

</li>

<li><a href="#Menu=ChildMenu5" onClick="DoMenu('ChildMenu5')">菜单五</a>

    <ul id="ChildMenu5" class="collapsed">

<li><a href=##Menu=ChildMenu5>菜单五</a></li>

<li><a href=##Menu=ChildMenu5>菜单五</a></li>

<li><a href=##Menu=ChildMenu5>菜单五</a></li>

<li><a href=##Menu=ChildMenu5>菜单五</a></li>

<li><a href=##Menu=ChildMenu5>菜单五</a></li>

<li><a href=##Menu=ChildMenu5>菜单五</a></li>

<li><a href=##Menu=ChildMenu5>菜单五</a></li> <li><a href=##Menu=ChildMenu5>菜单五</a></li>

<li><a href=##Menu=ChildMenu5>菜单五</a></li>

<li><a href=#C#Menu=ChildMenu5>菜单五</a></li>

<li><a href=##Menu=ChildMenu5>菜单五</a></li>

   <li><a href=##Menu=ChildMenu5>菜单五</a></li>

   </ul>

</li>

<li><a href="#Menu=ChildMenu6" onClick="DoMenu('ChildMenu6')">菜单六</a>

    <ul id="ChildMenu6" class="collapsed">

<li><a href=##Menu=ChildMenu6>菜单六</a></li>

<li><a href=##Menu=ChildMenu6>菜单六</a></li>

<li><a href=##Menu=ChildMenu6>菜单六</a></li>

   </ul>

</li>

<li><a href="#Menu=ChildMenu7" onClick="DoMenu('ChildMenu7')">菜单七</a>

    <ul id="ChildMenu7" class="collapsed">

<li><a href=##Menu=ChildMenu7>菜单七</a></li>

<li><a href=##Menu=ChildMenu7>菜单七</a></li>

   </ul>

</li>

<li><a href="#Menu=ChildMenu8" onClick="DoMenu('ChildMenu8')">菜单八</a>

    <ul id="ChildMenu8" class="collapsed">

<li><a href=##Menu=ChildMenu8>菜单八</a></li>

<li><a href=##Menu=ChildMenu8>菜单八</a></li>

<li><a href=##Menu=ChildMenu8>菜单八</a></li>

   </ul>

</li>

<li><a href="#Menu=ChildMenu9" onClick="DoMenu('ChildMenu9')">菜单九</a>

    <ul id="ChildMenu9" class="collapsed">

<li><a href=##Menu=ChildMenu9>菜单九</a></li>

<li><a href=##Menu=ChildMenu9>菜单九</a></li>

<li><a href=##Menu=ChildMenu9>菜单九</a></li>

   </ul>

</li>

<li><a href="#Menu=ChildMenu10" onClick="DoMenu('ChildMenu10')">菜单十</a>

    <ul id="ChildMenu10" class="collapsed">

<li><a href=##Menu=ChildMenu10>菜单十</a></li>

   </ul>

</li>

</ul>

</div>

    <script type=text/javascript><!--

        var LastLeftID = "";

        function menuFix() {

            var obj = document.getElementById("nav").getElementsByTagName("li");

            for (var i = 0; i < obj.length; i++) {

                obj[i].onmouseover = function () {

                    this.className += (this.className.length > 0 ? " " : "") + "sfhover";

                }

                obj[i].onMouseDown = function () {

                    this.className += (this.className.length > 0 ? " " : "") + "sfhover";

                }

                obj[i].onMouseUp = function () {

                    this.className += (this.className.length > 0 ? " " : "") + "sfhover";

                }

                obj[i].onmouseout = function () {

                    this.className = this.className.replace(new RegExp("( ?|^)sfhover//b"), "");

                }

            }

        }

        function DoMenu(emid) {

            var obj = document.getElementById(emid);

            obj.className = (obj.className.toLowerCase() == "expanded" ? "collapsed" : "expanded");

            if ((LastLeftID != "") && (emid != LastLeftID)) //关闭上一个Menu
            {

                document.getElementById(LastLeftID).className = "collapsed";

            }

            LastLeftID = emid;

        }

        function GetMenuID() {

            var MenuID = "";

            var _paramStr = new String(window.location.href);

            var _sharpPos = _paramStr.indexOf("#");

            if (_sharpPos >= 0 && _sharpPos < _paramStr.length - 1) {

                _paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length);

            }

            else {

                _paramStr = "";

            }

            if (_paramStr.length > 0) {

                var _paramArr = _paramStr.split("&");

                if (_paramArr.length > 0) {

                    var _paramKeyVal = _paramArr[0].split("=");

                    if (_paramKeyVal.length > 0) {

                        MenuID = _paramKeyVal[1];

                    }

                }

                /*

                if (_paramArr.length>0)

                {

                var _arr = new Array(_paramArr.length);

                }

  

                //取所有#后面的，菜单只需用到Menu

                //for (var i = 0; i < _paramArr.length; i++)

                {

                var _paramKeyVal = _paramArr[i].split('=');

   

                if (_paramKeyVal.length>0)

                {

                _arr[_paramKeyVal[0]] = _paramKeyVal[1];

                }  

                }

                */

            }

            if (MenuID != "") {

                DoMenu(MenuID)

            }

        }

        GetMenuID(); //*这两个function的顺序要注意一下，不然在Firefox里GetMenuID()不起效果

        menuFix();

--></script>

</html>