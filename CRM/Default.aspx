<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRM.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><%=Common.CommonHelper.AppName %></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="css/common.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/umd/popper.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="js/fullscreen.js"></script>
    <style>
        body {
            overflow: hidden;
        }

        .center {
            position: absolute;
            top: 60px;
            bottom: 0;
            left: 0;
            right: 0;
        }

        .menu {
            width: 180px;
            height: 100%;
            background: #f0f9fd;
        }

        .menutop {
            height: 40px;
            line-height: 40px;
            color: #fff;
            background: rgb(63,150,201);
        }

            .menutop i {
                margin-left: 8px;
                margin-top: 10px;
                margin-right: 8px;
                background: url('./image/default/leftico.png') no-repeat;
                width: 20px;
                height: 20px;
                float: left;
            }

        .root-menu > li > div {
            background: rgb(212,231,240);
            background-repeat: no-repeat;
            line-height: 35px;
            font-weight: bold;
            font-size: 14px;
            border-right: solid 1px #b7d5df;
            border-bottom: solid 1px #b7d5df;
            background-position: 10px;
            text-indent: 35px;
            cursor: pointer;
        }

        .second-menu {
            display: none;
        }

            .second-menu li {
                line-height: 35px;
                height: 35px;
                font-size: 14px;
                border-right: solid 1px #b7d5df;
                cursor: pointer;
                position: relative;
            }

            .second-menu cite {
                background: url(./image/default/list.gif) no-repeat;
                width: 12px;
                height: 12px;
                display: block;
                float: left;
                margin-left: 35px;
                margin-top: 10px;
                margin-right: 5px;
            }

            .second-menu a {
                display: block;
            }

            .second-menu li.active cite {
                background: url('./image/default/whitelist.gif') no-repeat;
            }

            .second-menu li.active {
                background: url('./image/default/active.png') no-repeat;
                background-size: cover;
            }

                .second-menu li.active a {
                    color: white;
                }

                .second-menu li.active i {
                    background: url(./image/default/sj.png) no-repeat;
                    width: 6px;
                    height: 11px;
                    position: absolute;
                    right: -1px;
                    top: 13px;
                }

        .main {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 180px;
            right: 0;
            border: none;
        }

            .main iframe {
                width: 100%;
                height: 100%;
                border: 0px solid;
            }
    </style>
</head>
<body onselectstart="return false;">
    <%-- 顶部导航栏 --%>
    <nav class="navbar navbar-expand navbar-dark" style="background-color: #0e90d2;">
        <a class="navbar-brand" href="#"><%=Common.CommonHelper.AppName %></a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link text-white" href="#">待办任务</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link text-white dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=user.UserName %></a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">资料</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">设置</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="./Logout.aspx">退出</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" id="fullscreeBtn" href="javascript:return void;">开启全屏</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="center">
        <%-- 左侧菜单 --%>
        <div class="menu">
            <div class="menutop">
                <i></i>
                控制中心
            </div>
            <% foreach (var menu in menus)
                { %>
            <ul class="root-menu">
                <li>
                    <div style="background-image: url('<%=menu.Class %>');"><%=menu.LinkName %></div>
                    <ul class="second-menu">
                        <%  foreach (var item in menu.Childs)
                            { %>
                        <li>
                            <cite></cite>
                            <a href="<%=item.LinkURL %>" target="main"><%=item.LinkName %></a>
                            <i></i>
                        </li>
                        <%  } %>
                    </ul>
                </li>
            </ul>
            <% } %>
        </div>
        <%-- 右侧页面主体 --%>
        <div class="main">
            <iframe name="main"></iframe>
        </div>
    </div>

    <script>
        // 一级菜单点击
        $(".root-menu > li > div").click(function () {
            $('.root-menu > li > div').next().slideUp(); // 全部收起
            var ele = $(this).next();
            if (ele.is(':visible')) {
                ele.slideUp();
            } else {
                ele.slideDown();
            }
        });

        // 二级菜单点击
        $(".second-menu li").click(function () {
            $(".active").removeClass("active");
            $(this).addClass("active");
        });
    </script>
</body>
</html>
