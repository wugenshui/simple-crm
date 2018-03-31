<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CRM.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>CRM客户管理系统</title>
    <link href="css/common.css" rel="stylesheet" />
    <script src="js/jquery.js"></script>
    <%-- 浮云效果 --%>
    <%--<script src="js/cloud.js"></script>--%>
    <style>
        body {
            background: url('./image/login/light.png') no-repeat;
            background-size: cover;
            background-color: #1c77ac;
            position: relative;
        }

        .logintop {
            background: url('./image/login/shadow.png');
            height: 50px;
            line-height: 50px;
            color: white;
        }

            .logintop span {
                float: left;
                background: url('./image/login/minilogo.png') no-repeat 30px;
                text-indent: 50px;
            }

            .logintop li {
                float: left;
                margin-right: 20px;
            }

                .logintop li a {
                    color: white;
                }

        .loginbody {
            position: absolute;
            top: 50px;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('./image/login/bg.png') no-repeat center center fixed;
        }

        .systemlogo {
            background: url('./image/login/loginlogo.png') no-repeat center;
            width: 100%;
            height: 72px;
            margin-top: 82px;
            position: absolute;
        }

        .loginbox {
            width: 700px;
            height: 340px;
            position: absolute;
            left: 50%;
            top: 50%;
            margin-left: -350px;
            margin-top: -170px;
            background: url('./image/login/loginbox.png') no-repeat;
        }

            .loginbox ul {
                margin-top: 88px;
                margin-left: 285px;
            }

            .loginbox li {
                margin-bottom: 25px;
            }

        .loginuser {
            width: 299px;
            height: 48px;
            background: url('./image/login/loginuser.png') no-repeat;
            border: none;
            line-height: 48px;
            padding-left: 44px;
            font-size: 14px;
            font-weight: bold;
        }

        .loginpwd {
            width: 299px;
            height: 48px;
            background: url('./image/login/loginpassword.png') no-repeat;
            border: none;
            line-height: 48px;
            padding-left: 44px;
            font-size: 14px;
            color: #90a2bc;
        }
    </style>
</head>
<body>
    <div class="logintop">
        <span>欢迎登录员工客户管理平台</span>
        <ul class="fr">
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
