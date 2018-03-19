<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QueryMessage.aspx.cs" Inherits="CRM.xiaoxi.QueryMessage" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
 <!DOCTYPE html>
<html lang="en">
<head>
<title>发送新消息</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="../css/colorpicker.css" />
<link rel="stylesheet" href="../css/datepicker.css" />
<link rel="stylesheet" href="../css/uniform.css" />
<link rel="stylesheet" href="../css/select2.css" />
<link rel="stylesheet" href="../css/matrix-style.css" />
<link rel="stylesheet" href="../css/matrix-media.css" />
<link rel="stylesheet" href="../css/bootstrap-wysihtml5.css" />
<link href="font-awesome/../css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
  <style  type="text/css">
html,body{background:#FFFFFF;}
</style>
</head>
<body >

 

<div id="content1">
 
<div id="content-header">
  <div id="breadcrumb"  > <a href="../ifrmMain.aspx" title="返回首页" class="tip-bottom"><i class="icon-home"></i>消息</a> <a href="#" class="tip-bottom">查看消息</a></div>
  <div><input type="button" onclick="javascript:window.history.go(-1);"value="返回上一页"/></div>
  <h1>查看消息</h1>
</div>
<div class="container-fluid">
   
  <div class="row-fluid">
    <div class="span6111">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>新消息</h5>
        </div>
        <div class="widget-content nopadding">
          <form id="Form1" action="#" method="post" class="form-horizontal" runat="server" Autocomplete ="On">
              <asp:HiddenField ID="HiddenField1" runat="server" />
            <div class="control-group">
              <label class="control-label">消息发送人 :</label>
              <div class="controls">
                <input style="width:220px;" runat="server"  id="sends"   type="text" class="span11" placeholder="消息接收人" />
              </div>
            </div>
             <div class="control-group">
              <label class="control-label">消息接收人 :</label>
              <div class="controls">
                <input style="width:220px;" runat="server"  id="name"   type="text" class="span11" placeholder="消息接收人" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">消息主题 :</label>
              <div class="controls">
                <input style="width:220px;"   runat="server"  id="subject"  type="text" class="span11" placeholder="消息主题" />
              </div>
            </div>
              
            <div class="control-group">
              <label class="control-label">消息内容：</label>
              <div class="controls">
                <textarea    runat="server"  id="messagecontent"   class="span11" ></textarea>
              </div>
            </div>
            <div id="Div1" class="form-actions" runat="server">
                           <asp:button ID="Button1" class="btn btn-primary" type="submit" runat="server" Text="回复" 
                 OnClientClick="#"  onclick="Unnamed1_Click"  Width="97px"></asp:button>
                                   <asp:button ID="Button2" class="btn btn-primary" type="submit" runat="server" Text="发送" 
                 OnClientClick="#"  onclick="Unnamed2_Click"  disabled="true" Width="97px"></asp:button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  
</div>
 
</div>
<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; MatAdmin.</div>
</div>
<!--end-Footer-part--> 
<script src="../js/jquery.min.js"></script> 
<script src="../js/jquery.ui.custom.js"></script> 
<script src="../js/bootstrap.min.js"></script> 
<script src="../js/bootstrap-colorpicker.js"></script> 
<script src="../js/bootstrap-datepicker.js"></script> 
<script src="../js/jquery.toggle.buttons.html"></script> 
<script src="../js/masked.js"></script> 
<script src="../js/jquery.uniform.js"></script> 
<script src="../js/select2.min.js"></script> 
<script src="../js/matrix.js"></script> 
<script src="../js/matrix.form_common.js"></script> 
<script src="../js/wysihtml5-0.3.0.js"></script> 
<script src="../js/jquery.peity.min.js"></script> 
<script src="../js/bootstrap-wysihtml5.js"></script> 
<script>
    $('.textarea_editor').wysihtml5();
</script>
</body>
</html>

