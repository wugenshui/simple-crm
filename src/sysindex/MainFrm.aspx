<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="MainFrm.aspx.vb" Inherits="warehouse.MainFrm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <link rel="icon" type="image/gif" href="animated_favicon.gif" />
</head>

   <frameset name="BackFrame" id="BackFrame" rows="80,*" cols="*"  border="0" framespacing="0" frameborder="0"> 
  <frame name="top"  noresize="noresize" scrolling="no"  src="EntryTop.aspx" />

  <frameset name="MainFrame" id="MainFrame" cols="162,6,*" rows="*" frameborder="0" border="0" framespacing="0"> 
    <frame name="left" src="EntryLeft.aspx" frameborder="0"   scrolling="auto" />
    <frame name="HideFrame" src="HideBar.aspx"  scrolling="no"  frameborder="0" noresize="noresize" />
    <frame name="ifrmMain" src="Desktop.aspx" frameborder="0"  />
  </frameset>

  </frameset>
<noframes>
<body>
您的浏览器不支持frameset
</body>
</noframes>
</html>
