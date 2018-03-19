<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EntryTop.aspx.vb" Inherits="warehouse.EntryTop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link  rel="stylesheet" type="text/css" href="../Styles/styletop.css" />

  
      <script  type="text/javascript">
          function hidemenu() {
              document.oncontextmenu = function () { return false; }
          }   
</script>

    <style type="text/css">
        .style1
        {
            width: 125px;
        }
        .style2
        {
            width: 271px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td style="height: 55px; width: 488px; font-weight: normal; font-size: 15pt; color: Red; font-weight: bold; background: url(../Images/index/top1.gif) repeat-x">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lbSoftCnName" runat="server"></asp:Label>
            </td>
            <td style="background: url(../Images/index/top2.gif)">
                &nbsp;</td>
            <td style="width: 502px; background:  url(../Images/index/top3.gif) repeat-x;">
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" 
                   
                    height="55" width="501">
                    <param name="Movie" value="../Images/index/topbanner1.swf" />
                    <param name="Src" value="../Images/index/topbanner1.swf" />
                    <param name="wmode" value="transparent" />
                    <param name="Play" value="-1" />
                    <param name="Loop" value="-1" />
                    <param name="Quality" value="High" />
                    <param name="AllowFullScreen" value="false" />
                    <embed height="55" 
                   
                        src="../Images/index/topbanner1.swf"
                        type="application/x-shockwave-flash" width="501" wmode="transparent"></embed></embed>
</object>
            </td>
        </tr>
    </table>
    <table align="center" border="0" cellpadding="0" cellspacing="0" 
        style="background:  url(../Images/index/title_mid.jpg);" 
        width="100%">
        <tr>
            <td height="27" 
                style="background: url(../Images/index/title_bk.jpg) no-repeat" 
                class="style2">
                <font color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hello,<asp:Label ID="lbEmpName" runat="server" 
                    Text="Name"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </font>
            </td>
          <td  style="background: url(../Images/index/title_mid.jpg)">
              &nbsp;</td>
         <td style="width:505px;background: url(../Images/index/nav_r.gif) no-repeat">
                <table border="0" cellpadding="0" cellspacing="0" 
                    style="height: 19px; width: 505px">
                    <tr>
                        <td style="width: 380px; text-align:center;">
                            <font color="#ffffff">Account：<asp:Label ID="lbAccount" runat="server" Text=""></asp:Label>
                            &nbsp;Company：<asp:Label ID="lbCompanyName" runat="server" Text="IGS"></asp:Label>
                            &nbsp;Dept：<asp:Label ID="lbDepartmentName" runat="server" Text="Dept"></asp:Label>
                            &nbsp;
                            </font>
                        </td>
                        <td class="style1">
                            <!--a href="Desktop.aspx" target="ifrmMain">Desk</a-->
                            <a href="javascript:history.back()">Back</a>
                            <a href="javascript:history.forward();">Forward</a>
                            <a href="Quit.aspx" onclick="return confirm('Do you really want to exit?')">Exit</a>
                           </td>
                    </tr>
                </table>
            </td>
            <td style="background: url(../Images/index/nav_r_2.jpg)">
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
