<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Updatecustweiqueren.aspx.cs" Inherits="CRM.customer.Updatecustweiqueren" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
 <!DOCTYPE html>
<html lang="en">
<head>
<title>添加客户</title>
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
  <div id="breadcrumb"  > <a href="index.aspx" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="#" class="tip-bottom">客户管理</a> <a href="#" class="current">客户列表</a> </div>
  <h1>修改客户</h1>
</div>
<div class="container-fluid">
   
  <div class="row-fluid">
    <div class="span12">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>客户资料</h5>
        </div>
        <div class="widget-content nopadding">
          <form id="Form1" action="#" class="form-horizontal" runat="server">

                 <div class="control-group" >
                  <label class="control-label">客户类型 :</label>
                 <div class="controls">
                <label style="float:left">
                  <input runat="server"  id="cust"  type="radio" name="radios" />
                  客户单子</label>
                <label style="float:left">
                  <input runat="server"  id="emp" type="radio" name="radios" />
                  员工单子</label>
                <label  style="float:left">
                  <input runat="server"  id="buss" type="radio" name="radios" />
                  商家单子</label>
                  <label >
                  <input runat="server"  id="bc" type="radio" name="radios" />
                  商城单子</label>
                  </div>
              </div>
            <div class="control-group">
              <label class="control-label">客户名称 :</label>
              <div class="controls">
                <input style="width:220px;" runat="server"  id="name"   type="text" class="span11" placeholder="客户名称" />
              </div>
            </div>
             <div class="control-group">
              <label class="control-label">电话 :</label>
              <div class="controls">
                <input style="width:220px;"  runat="server"  id="phone"   type="text" class="span11" placeholder="电话" />
              </div>
              </div>
              <div class="control-group">
              <label class="control-label">QQ :</label>
              <div class="controls">
                <input style="width:220px;"  runat="server"  id="qq"   type="text" class="span11" placeholder="QQ" />
              </div>
              </div>
              <div class="control-group">
              <label class="control-label">邮箱 :</label>
              <div class="controls">
                <input style="width:220px;"  runat="server"  id="mail"   type="text" class="span11" placeholder="邮箱" />
              </div>
              </div>
              <div class="control-group">
              <label class="control-label">身份证号码 :</label>
              <div class="controls">
                <input style="width:220px;"  runat="server"  id="custID"   type="text" class="span11" placeholder="身份证号码" />
              </div>
              </div>
              <div class="control-group">
              <label class="control-label">家庭住址 :</label>
              <div class="controls">
                <input style="width:420px;"  runat="server"  id="home"   type="text" class="span11" placeholder="家庭住址" />
              </div>
              </div>

           <div class="control-group">
              <label class="control-label">所属业务</label>
              <div class="controls">
                <select style="width:220px;"  runat="server"  id="team">
                  <option>A</option>
                  <option>Second </option>
                  <option>Third </option>
                  <option>Fourth </option>
                  <option>Fifth </option>
                  <option>Sixth </option>
                  <option>Seventh </option>
                  <option>Eighth </option>
                </select>
              </div>
            </div>  
             <div class="control-group">
              <label class="control-label">合同附件上传</label>
              <div class="controls">
                <input style="width:180px;"  runat="server"  id="uploadfile"  type="file" />
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

