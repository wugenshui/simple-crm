<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="CRM.EmployeeControl.AddEmployee" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
 <!DOCTYPE html>
<html lang="en">
<head>
<title>添加业务人员</title>
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
<script type="text/javascript">
    function getValue() {
        //  alert("11111");
        var companylist = '<%=GetCompany() %>'
        var employeelist = '<%=GetEmployee() %>'
        var teamlist = '<%=GetTeam() %>'
        // alert(companylist);
        var companylistone = companylist.split(","); //字符分割 
        var employeelistone = employeelist.split(","); //字符分割 
        var teamlistone = teamlist.split(","); //字符分割 
        var objcompany = document.getElementById('company');
        var objsupervisor = document.getElementById('supervisor');
        var objteam = document.getElementById('team');
 

        for (kk = 0; kk < companylistone.length; kk++) {

            //添加一个选项  

            objcompany.options.add(new Option(companylistone[kk], companylistone[kk])); //这个兼容IE与firefox  
        }
        for (kk1 = 0; kk1 < employeelistone.length; kk1++) {

            //添加一个选项  

            objsupervisor.options.add(new Option(employeelistone[kk1], employeelistone[kk1])); //这个兼容IE与firefox  
        }
        for (kk2 = 0; kk2 < teamlistone.length; kk2++) {

            //添加一个选项  

            objteam.options.add(new Option(teamlistone[kk2], teamlistone[kk2])); //这个兼容IE与firefox  
        }
    }
    function getselect() {
        var obj = document.getElementById('company'); //定位id

        var index = obj.selectedIndex; // 选中索引

        var text = obj.options[index].text; // 选中文本

        var value = obj.options[index].value; // 选中值
        document.getElementById("HiddenFieldcompany").value = value;
       
    }
    function getselectteam() {
        var obj = document.getElementById('team'); //定位id

        var index = obj.selectedIndex; // 选中索引

        var text = obj.options[index].text; // 选中文本

        var value = obj.options[index].value; // 选中值
        document.getElementById("HiddenFieldteam").value = value;
       
    }
    function getselectemp() {
        var obj = document.getElementById('supervisor'); //定位id

        var index = obj.selectedIndex; // 选中索引

        var text = obj.options[index].text; // 选中文本

        var value = obj.options[index].value; // 选中值
        document.getElementById("HiddenFieldemp").value = value;
    }
    </script>
     <style  type="text/css">
html,body{background:#FFFFFF;}
</style>
</head>
<body onload="getValue()">

<!--Header-part-->
 
<!--close-Header-part--> 

<!--top-Header-menu-->
 

 

<div id="content1">
 
<div id="content-header">
  <div id="breadcrumb"  > <a href="index.aspx" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="#" class="tip-bottom">员工管理</a> <a href="#" class="current">添加业务人员</a> </div>
</div>
<div class="container-fluid">
   
  <div class="row-fluid">
    <div class="span12">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>业务人员资料</h5>
        </div>
        <div class="widget-content nopadding">
          <form id="Form1" action="#" method="post" class="form-horizontal" runat="server">
             <asp:HiddenField ID="HiddenFieldcompany" runat="server" />
                <asp:HiddenField ID="HiddenFieldteam" runat="server" />
                   <asp:HiddenField ID="HiddenFieldemp" runat="server" />
            <div class="control-group">
              <label class="control-label">账号 :</label>
              <div class="controls">
                <input style="width:220px;" runat="server"  id="name"   type="text" class="span11" placeholder="账号" />
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
              <label class="control-label">所属团队</label>
              <div class="controls">
                <select style="width:220px;"  runat="server"  id="team">
                  
                </select>
              </div>
            </div>  
            <div class="control-group">
              <label class="control-label">员工职务</label>
              <div class="controls">
                <select style="width:220px;"  runat="server"  id="post">
                  <option>业务</option>
                  <option>主管</option>
                  <option>经理</option>
                </select>
              </div>
            </div>
           <div class="control-group">
              <label class="control-label">上级领导</label>
              <div class="controls">
                <select style="width:220px;"  runat="server"  id="supervisor">
         
                </select>
              </div>
            </div>     
           <div class="control-group">
              <label class="control-label">所属公司</label>
              <div class="controls">
                <select style="width:220px;"  runat="server"  id="company">
              
                </select>
              </div>
            </div>    
    
              <div class="control-group">
              <label class="control-label">入职时间</label>
              <div class="controls">
                <div  data-date="12-02-2015" class="input-append date datepicker">
                  <input style="width:220px;"  runat="server"  id="txtdate" type="text" value="04-22-2015"  data-date-format="mm-dd-yyyy" class="span11" >
                  <span class="add-on"><i class="icon-th"></i></span> </div>
              </div>
            </div>          
            <div id="Div1" class="form-actions" runat="server">
                           <asp:button ID="Button1" class="btn btn-primary" type="submit" runat="server" Text="确认" 
                  OnClientClick="getselect();getselectteam();getselectemp()"   onclick="Unnamed1_Click" Width="97px"></asp:button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  
</div>
 

<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; MatAdmin.</div>
</div>
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
