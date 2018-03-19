<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCompany.aspx.cs" Inherits="CRM.Team.AddCompany" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
 <!DOCTYPE html>
<html lang="en">
<head>
<title>添加公司</title>
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
<link href="../font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
 <style  type="text/css">
html,body{background:#FFFFFF;}
</style>
</head>
<body>

 

<div id="content1">
 
<div id="content-header">
  <div id="breadcrumb"  > <a href="index.aspx" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="#" class="tip-bottom">公司团队</a> <a href="#" class="current">添加公司</a> </div>
  <h1>添加公司资料</h1>
</div>
<div class="container-fluid">
   
  <div class="row-fluid">
    <div class="span12">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>公司资料明细</h5>
        </div>
        <div class="widget-content nopadding">
          <form id="Form1" action="#" method="get" class="form-horizontal" runat="server">
            <div class="control-group">
              <label class="control-label">公司名字 :</label>
              <div class="controls">
                <input style="width:220px;" runat="server"  id="name"   type="text" class="span11" placeholder="公司名字" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">法人代表 :</label>
              <div class="controls">
                <input style="width:220px;"  runat="server"  id="owner"  type="text" class="span11" placeholder="法人代表" />
              </div>
            </div>
             <div class="control-group">
              <label class="control-label">电话 :</label>
              <div class="controls">
                <input style="width:220px;"  runat="server"  id="pbone"   type="text" class="span11" placeholder="电话" />
              </div>
              </div>
             <div class="control-group">
              <label class="control-label">公司网站 :</label>
              <div class="controls">
                <input style="width:220px;"  runat="server"  id="web"   type="text" class="span11" placeholder="公司网站" />
              </div>
              </div>
              <div class="control-group">
              <label class="control-label">营业执照编号 :</label>
              <div class="controls">
                <input style="width:220px;"  runat="server"  id="number"   type="text" class="span11" placeholder="营业执照编号" />
              </div>
              </div>
            <div class="control-group">
              <label class="control-label">公司创办时间</label>
              <div class="controls">
                <div  data-date="12-02-2012" class="input-append date datepicker">
                  <input style="width:220px;"  runat="server"  id="txtdate" type="text" value="04-22-2015"  data-date-format="mm-dd-yyyy" class="span11" >
                  <span class="add-on"><i class="icon-th"></i></span> </div>
              </div>
            </div>       
            <div id="Div1" class="form-actions" runat="server">
                           <asp:button ID="Button1" class="btn btn-primary" type="submit" runat="server" Text="确认" 
                   onclick="Unnamed1_Click" Width="97px"></asp:button>
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
