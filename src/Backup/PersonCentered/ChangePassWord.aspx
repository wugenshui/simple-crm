<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassWord.aspx.cs" Inherits="CRM.PersonCentered.ChangePassWord" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head >
  
  <title>Change Password</title>
<meta charset="UTF-8" /> 
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="../css/fullcalendar.css" />
<link rel="stylesheet" href="../css/matrix-style.css" />
<link rel="stylesheet" href="../css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="../css/jquery.gritter.css" />
<link href='http://fonts.useso.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
<style type="text/css">
body
{ 
   background:#eeeeee;
}
</style>
</head>
<body >
 
   <div id="content">
     <div class="container-fluid">
  <div class="row-fluid">
    <div class="span6">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>修改密码</h5>
        </div>
        <div class="widget-content nopadding">
          <form action="#" method="get" class="form-horizontal" runat="server">
            <div class="control-group">
              <label class="control-label">原密码:</label>
              <div class="controls">
                <input  runat="server" id="oldPassword" type="password" class="span11" placeholder="原密码" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">新密码:</label>
              <div class="controls">
                <input   runat="server"  id="newPassword" type="password" class="span11" placeholder="新密码" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">重复输入新密码</label>
              <div class="controls">
                <input type="password"  runat="server"   id="repeatNewPassword" class="span11" placeholder="重复输入新密码"  />
              </div>
            </div>
           
            <div class="form-actions" runat="server" >
             
               <asp:button ID="Button3" class="btn btn-success" type="submit" runat="server" Text="保存" 
                   onclick="Unnamed1_Click" Width="97px"></asp:button>
            </div>
          </form>
        </div>
      </div>
 </div>
     </div>
 </div>
       </div>
  
  <script src="../js/excanvas.min.js"></script> 
<script src="../js/jquery.min.js"></script> 
<script src="../js/jquery.ui.custom.js"></script> 
<script src="../js/bootstrap.min.js"></script> 
<script src="../js/jquery.flot.min.js"></script> 
<script src="../js/jquery.flot.resize.min.js"></script> 
<script src="../js/jquery.peity.min.js"></script> 
<script src="../js/fullcalendar.min.js"></script> 
<script src="../js/matrix.js"></script> 
<script src="../js/matrix.dashboard.js"></script> 
<script src="../js/jquery.gritter.min.js"></script> 
<script src="../js/matrix.interface.js"></script> 
<script src="../js/matrix.chat.js"></script> 
<script src="../js/jquery.validate.js"></script> 
<script src="../js/matrix.form_validation.js"></script> 
<script src="../js/jquery.wizard.js"></script> 
<script src="../js/jquery.uniform.js"></script> 
<script src="../js/select2.min.js"></script> 
<script src="../js/matrix.popover.js"></script> 
<script src="../js/jquery.dataTables.min.js"></script> 
<script src="../js/matrix.tables.js"></script> 

<script type="text/javascript">
    // This function is called from the pop-up menus to transfer to
    // a different page. Ignore if the value returned is a null string:
    function goPage(newURL) {

        // if url is empty, skip the menu dividers and reset the menu selection to default
        if (newURL != "") {

            // if url is "-", it is this page -- reset the menu:
            if (newURL == "-") {
                resetMenu();
            }
            // else, send page to designated URL            
            else {
                document.location.href = newURL;
            }
        }
    }

    // resets the menu selection upon entry to this page:
    function resetMenu() {
        document.gomenu.selector.selectedIndex = 2;
    }
</script>   
</body>
</html>
