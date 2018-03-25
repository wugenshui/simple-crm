<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EntryTop.aspx.cs" Inherits="CRM.EntryTop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CRM-Side</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="js/jquery.js"></script>
    <style>
        .top {
            height: 85px;
            background-color: lightblue;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            //导航切换
            $(".menuson li").click(function () {
                $(".menuson li.active").removeClass("active")
                $(this).addClass("active");
            });

            $('.title').click(function () {
                var $ul = $(this).next('ul');
                $('dd').find('ul').slideUp();
                if ($ul.is(':visible')) {
                    $(this).next('ul').slideUp();
                } else {
                    $(this).next('ul').slideDown();
                }
            });
        })
    </script>
</head>
<body style="background: #f0f9fd;" runat="server">
    <form runat="server">
        <asp:HiddenField runat="server" ID="HiddenField1" />
        <div class="top">
        </div>
    </form>
</body>
</html>


