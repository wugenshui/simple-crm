<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainFrm.aspx.cs" Inherits="CRM.MainFrm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head" runat="server">
    <title></title>

   <link rel="icon" type="image/gif" href="animated_favicon.gif" />
</head>

   <frameset  rows="88,*" cols="*" frameborder="no" border="0" framespacing="0"> 
   <frame name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame"  src="EntryTop.aspx" />
   
  <frameset cols="187,*" frameborder="no" border="0" framespacing="0"> 
    <frame   src="EntryLeft.aspx" scrolling="No" noresize="noresize" id="leftFrame" title="leftFrame" />
    
    <frame name="ifrmMain"   id="rightFrame" title="rightFrame" />
  </frameset>

  </frameset>
<noframes>
<body>
您的浏览器不支持frameset
</body>
</noframes>
</html>
