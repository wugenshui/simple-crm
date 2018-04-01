<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CRM.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录</title>
    <link href="css/common.css" rel="stylesheet" />
    <script src="js/jquery.js"></script>
    <%-- 浮云效果 --%>
    <script src="js/cloud.js"></script>
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



        .centerbox {
            width: 700px;
            height: 410px;
            position: absolute;
            left: 50%;
            top: 50%;
            margin-left: -350px;
            margin-top: -220px;
        }

            .centerbox .systemlogo {
                background: url('./image/login/loginlogo.png') no-repeat center;
                width: 100%;
                height: 70px;
                position: absolute;
            }

            .centerbox ul {
                margin-top: 88px;
                margin-left: 285px;
            }

            .centerbox li {
                margin-bottom: 25px;
            }

            .centerbox .loginbox {
                background: url('./image/login/loginbox.png') no-repeat;
                width: 100%;
                height: 340px;
                position: absolute;
                top: 70px;
            }

        .loginuser, .loginpwd {
            width: 342px;
            height: 48px;
            line-height: 48px;
            padding-left: 44px;
            font-size: 14px;
            border: none;
        }

        .loginuser {
            background: url('./image/login/loginuser.png') no-repeat center center;
            font-weight: bold;
        }

        .loginpwd {
            background: url('./image/login/loginpassword.png') no-repeat center center;
            color: #90a2bc;
        }

        .loginbtn {
            width: 111px;
            height: 35px;
            background: rgb(60,149,200);
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
            color: #fff;
            cursor: pointer;
            line-height: 35px;
        }

        .centerbox ul li label {
            margin-left: 44px;
            color: #687f92;
        }

            .centerbox ul li label a {
                color: #687f92;
            }
    </style>
</head>
<body onselectstart="return false;">
    <div class="logintop">
        <span>欢迎登录员工客户管理平台</span>
        <ul class="fr">
            <li><a href="#">客服</a></li>
            <li><a href="#">帮助</a></li>
            <li><a href="#">关于</a></li>
        </ul>
    </div>
    <div class="loginbody">
        <div class="centerbox">
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
    </div>
</body>
</html>
