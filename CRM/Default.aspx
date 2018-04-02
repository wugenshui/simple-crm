<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRM.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><%=appName %></title>
    <link href="css/common.css" rel="stylesheet" />
    <script src="js/jquery.js"></script>
    <style>
        body {
            overflow: hidden;
        }

        .header {
            height: 70px;
            background-color: lightblue;
        }

        .center {
            position: absolute;
            top: 70px;
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

        .menu dl dt {
            background: rgb(212,231,240);
            background-repeat: no-repeat;
            line-height: 35px;
            font-weight: bold;
            font-size: 14px;
            border-right: solid 1px #b7d5df;
            background-position: 10px;
            text-indent: 35px;
            cursor: pointer;
        }

        .menu dl dd {
            /*background: url('./image/default/list.gif') no-repeat 35px;*/
            text-indent: 35px;
            line-height: 35px;
            font-size: 14px;
            border-right: solid 1px #b7d5df;
            cursor: pointer;
        }

            .menu dl dd cite {
                background: url('./image/default/list.gif') no-repeat;
                width: 12px;
                height: 12px;
                display: inline-block;
            }

            .menu dl dd.active cite {
                background: url('./image/default/whitelist.gif') no-repeat;
            }

            .menu dl dd.active {
                background: url('./image/default/active.png') no-repeat;
                background-size: cover;
            }

                .menu dl dd.active a {
                    color: white;
                }

                .menu dl dd.active i {
                    background: url(./image/default/sj.png) no-repeat;
                    width: 6px;
                    height: 11px;
                    position: absolute;
                    z-index: 10000;
                    margin-left: 67px;
                    margin-top: 13px;
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
<body>
    <div class="header">
        <span><%=user.UserName %></span>
    </div>
    <div class="center">
        <div class="menu">
            <div class="menutop">
                <i></i>
                控制中心
            </div>
            <dl>
                <% foreach (var menu in menus)
                    { %>
                <dt style="background-image: url('<%=menu.Class %>');"><%=menu.LinkName %></dt>
                <%  foreach (var item in menu.Childs)
                    { %>
                <dd class="<%=item.Class %>">
                    <cite></cite>
                    <a href="<%=item.LinkURL %>" target="main"><%=item.LinkName %></a>
                    <i></i>
                </dd>
                <%  } %>
                <% } %>
            </dl>
        </div>
        <div class="main">
            <iframe name="main"></iframe>
        </div>
    </div>

    <script>
        $(".menu dd").click(function () {
            $(".active").removeClass("active");
            $(this).addClass("active");
        });
    </script>
</body>
</html>
