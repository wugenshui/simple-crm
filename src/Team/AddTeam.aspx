<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTeam.aspx.cs" Inherits="CRM.Team.AddTeam" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
 <!DOCTYPE html>
<html lang="en">
<head>
<title>添加团队</title>
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
 <script type="text/javascript">
     function getValue() {
       //  alert("11111");
         var companylist = '<%=GetCompany() %>'
        // alert(companylist);
         var companylistone = companylist.split(","); //字符分割 
         var obj = document.getElementById('company');  

         
         if (obj.options.length > 1)
         { return;  }
        
         for (kk = 0; kk < companylistone.length; kk++) {
 
             //添加一个选项  

             obj.options.add(new Option(companylistone[kk], companylistone[kk])); //这个兼容IE与firefox  
         }
     }
     function getselect() {
         var obj = document.getElementById('company'); //定位id

         var index = obj.selectedIndex; // 选中索引

         var text = obj.options[index].text; // 选中文本

         var value = obj.options[index].value; // 选中值
         document.getElementById("HiddenField1").value = value;
   
     }
    </script>
     <style  type="text/css">
html,body{background:#FFFFFF;}
</style>
</head>
<body  onload="getValue()">

 

<div id="content1">
 
<div id="content-header">
  <div id="breadcrumb"  > <a href="../ifrmMain.aspx" title="返回首页" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="#" class="tip-bottom">公司团队</a> <a href="#" class="current">添加团队</a> </div>
  <h1>添加团队资料</h1>
</div>
<div class="container-fluid">
   
  <div class="row-fluid">
    <div class="span6111">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>团队资料明细</h5>
        </div>
        <div class="widget-content nopadding">
          <form action="#" method="post" class="form-horizontal" runat="server">
              <asp:HiddenField ID="HiddenField1" runat="server" />
            <div class="control-group">
              <label class="control-label">团队名称 :</label>
              <div class="controls">
                <input style="width:220px;" runat="server"  id="name"   type="text" class="span11" placeholder="团队名称" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">团队负责人 :</label>
              <div class="controls">
                <input style="width:220px;"  runat="server"  id="owner"  type="text" class="span11" placeholder="团队负责人" />
              </div>
            </div>
             <div class="control-group">
              <label class="control-label">负责人电话 :</label>
              <div class="controls">
                <input style="width:220px;"  runat="server"  id="pbone"   type="text" class="span11" placeholder="负责人电话" />
              </div>
              </div>
                  <div class="control-group">
                    <label class="control-label">所属公司：</label>
                      <div class="controls">
                      <select style="width:220px;" id="company" tabindex="1"  runat="server"    data-placeholder="选择这里.." 
                              class="span7" name="D3">
                              <option value=""></option>
                       </select>     
                        
                           
                    
                     </div>
                  </div>
            <div class="control-group">
              <label class="control-label">团队口号：</label>
              <div class="controls">
                <textarea  runat="server"  id="slogan" style="width:520px;" class="span11" ></textarea>
              </div>
            </div>
            <div class="form-actions" runat="server">
                           <asp:button ID="Button1" class="btn btn-primary" type="submit" runat="server" Text="确认" 
                 OnClientClick="getselect()"  onclick="Unnamed1_Click"  Width="97px"></asp:button>
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

