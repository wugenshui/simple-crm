<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CRM.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>CRM客户管理系统</title>
    <script src="js/jquery.js"></script>
    <%-- 浮云效果 --%>
    <script src="js/cloud.js"></script>
    <style>
        html, body {
            width: 100%;
            height: 100%;
        }

        body {
            background: url('./image/login/bg.png') no-repeat center center fixed;
            background-size: cover;
        }

        .logintop {
            height: 50px;
        }
    </style>
</head>
<body>
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
