<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddRiCheng.aspx.cs" validateRequest="false"  Inherits="CRM.PersonCentered.AddRiCheng" %>
 
<html xmlns="http://www.w3.org/1999/xhtml">
 
 
<head>
<title>个人资料</title>
 
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
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'/>
  <script type="text/javascript">


      function getSubject() {



          var value_1 = document.getElementById("times");
          value_1.value = CurentTime() ;



      }
      function CurentTime() {
          var now = new Date();

          var year = now.getFullYear();       //年
          var month = now.getMonth() + 1;     //月
          var day = now.getDate();            //日



          var clock = year + "-";

          if (month < 10)
              clock += "0";

          clock += month + "-";

          if (day < 10)
              clock += "0";

          clock += day + " ";


          return (clock);
      } 

 
 
</script> 
  <style  type="text/css">
html,body{background:#FFFFFF;}
</style>
</head>
<body onload="getSubject()">
 
<form id="Form1" runat="server">
      
<div id="content1">
 
<div id="content-header">
  <div id="breadcrumb" > <a href="#" title="返回首页" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="#" class="tip-bottom">我的日志</a> <a href="#" class="current">添加日志</a> </div>
  <div><input type="button" onclick="javascript:window.history.go(-1);"value="返回上一页"/></div>
</div>
<div class="container-fluid">
   
  <div class="row-fluid">
 
   <div class="widget-box">
        <div class="widget-title" style="width:100%;"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>添加日程</h5>  
 
        </div>
        <div class="widget-content nopadding">
        <div class="row-fluid">
          <div class="span12">
          <div class="widget-content">   
              <label class="control-label">日程:</label>
              <div class="controls">
                <input style="width:20%;"  runat="server"  id="richeng"   type="text" class="span" placeholder="日程"  />
                <label class="control-label">时间:</label>
                 <input style="width:20%;"  runat="server"  id="times"   type="text" class="span"   />
                   <label class="control-label">地点:</label>
                  <input style="width:20%;"  runat="server"  id="addr"   type="text" class="span" placeholder="地点"  />
                  <label class="control-label">详情:</label>
                  <textarea class="textarea_editor span12" rows="6" id="contents"  runat="server"   placeholder="详情"></textarea>
                       <asp:button ID="Button1" class="btn btn-primary" type="submit" runat="server" Text="保存" 
                 OnClientClick="#"  onclick="Unnamed1_Click"  Width="97px"></asp:button>
                    
              </div>
          </div>
      </div>
 
    
        </div>
        </div>
   </div>
 
      
     
  </div>
 
  
    
</div>
</div> 
 
    
 </form>
         
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

