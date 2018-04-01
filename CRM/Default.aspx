<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRM.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><%=appName %></title>
    <link href="css/common.css" rel="stylesheet" />
    <script src="js/jquery.js"></script>
    <style>
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

        .main {
            margin-left: 80px;
            height: 100%;
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
        </div>
        <div class="main"></div>
    </div>
</body>
</html>
