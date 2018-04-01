<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CRM.Login" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>CRM客户管理系统</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.loginbox').css({ 'position': 'absolute', 'left': ($(window).width() - 692) / 2 });
            $(window).resize(function () {
                $('.loginbox').css({ 'position': 'absolute', 'left': ($(window).width() - 692) / 2 });
            })
        });
    </script>
    <%-- 浮云效果 --%>
    <%--<script src="js/cloud.js" type="text/javascript"></script>--%>
</head>
<body style="background-color: #1c77ac; background-image: url(images/light.png); background-repeat: no-repeat; background-position: center top; overflow: hidden;">
    <div id="mainBody">
        <div id="cloud1" class="cloud"></div>
        <div id="cloud2" class="cloud"></div>
    </div>
    <div class="logintop">
        <span>欢迎登录员工客户管理平台</span>
        <ul>
            <li><a href="#">客服</a></li>
            <li><a href="#">帮助</a></li>
            <li><a href="#">关于</a></li>
        </ul>
    </div>
    <div class="loginbody">
        <span class="systemlogo"></span>
        <div class="loginbox">
            <form id="loginform" runat="server">
                <ul>
                    <li>
                        <input id="inputName" class="loginuser" runat="server" type="text" placeholder="用户名" /></li>
                    <li>
                        <input id="inputPassword" class="loginpwd" runat="server" type="password" placeholder="密码" /></li>
                    <li>
                        <asp:Button ID="Button1" type="submit" runat="server" class="loginbtn" Text="登录"
                            OnClick="Button1_Click" Width="97px"></asp:Button>
                        <label>
                            <input name="" type="checkbox" value="" checked="checked" />记住密码</label><label><a href="#">忘记密码？</a></label>
                    </li>
                </ul>
            </form>
        </div>
    </div>
</body>
</html>
