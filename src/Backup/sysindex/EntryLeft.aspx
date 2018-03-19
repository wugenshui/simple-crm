<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EntryLeft.aspx.vb" Inherits="warehouse.EntryLeft" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head   runat="server">
    <title>Menu</title>

    <link href="../styles/styleindex.css" type="text/css" rel="stylesheet" />
    <script  type="text/javascript" language="javascript">
<!--

        //当前打开的
        //var nowtitle;
        var nowcontent;
        function switchtab(ttab, ctab) {
            ctab.style.display = (ctab.style.display == "none" ? "block" : "none");
            if (nowcontent != null) {
                if (nowcontent != ctab) {
                   // nowcontent.style.display = "none";
                    // nowtitle.className = "titletd-col"
                }

            }

            // ctab.style.display = "block";  
            //ttab.className = "titletd-exp";
            //nowtitle = ttab;
            nowcontent = ctab

        }
-->
</script>

<script  type="text/javascript">
    function hidemenu() {
        document.oncontextmenu = function () { return false; }
    }   
</script>


</head>
<body onload="hidemenu();" style="margin:0;"   scroll="no">
    <form id="form1" runat="server">
    <div>
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    </div>
    </form>
</body>
</html>
