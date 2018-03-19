<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Quit.aspx.cs" Inherits="CRM.Quit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head  runat="server">
    <title>退出系统</title>
<script type="text/javascript">
    top.location.href = "LogIn.aspx"
</script>
   
</head>
<body>
    <form id="form1" runat="server">
    <div>
        你已经退出系统......</div>
    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
    </form>
</body>
</html>
<script type="text/javascript">    setTimeout('self.close()', 1000);</script>

