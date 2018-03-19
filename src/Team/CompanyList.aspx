<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyList.aspx.cs" Inherits="CRM.Team.CompanyList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

 <!DOCTYPE html>
<html lang="en">
<head>
<title>公司列表</title>
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
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'/>
 <style  type="text/css">
html,body{background:#FFFFFF;}
</style>
</head>
<body>
 
<div id="content1">
 
<div id="content-header">
  <div id="breadcrumb"  > <a href="index.aspx" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="#" class="tip-bottom">公司团队</a> <a href="#" class="current">公司列表</a> </div>
</div>
<div class="container-fluid">
   
  <div class="row-fluid">
    <div class="span12">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>公司列表</h5>
        </div>
            <div class="widget-content nopadding">
             <form id="Form1" action="#"  class="form-horizontal" runat="server">
            <div class="control-group">
              <label class="control-label">公司名称 :</label>
              <div class="controls">
                <input style="width:220px;" runat="server"  id="name"   type="text" class="span11" placeholder="公司名称" />
                <asp:Button ID="Button1" runat="server" Text="查询" onclick="Button1_Click" 
                      Height="29px" Width="66px" />
              </div>
            </div>
            
            <table class="table table-bordered table-striped"  >
      
              <asp:GridView ID="GridView1"   runat="server" AllowPaging="True" 
        BackColor="White" bordercolor="#DBDBDB" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" Width="100%" AutoGenerateColumns="False" 
        onrowcancelingedit="GridView1_RowCancelingEdit" 
        onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
                    onrowupdating="GridView1_RowUpdating">
        <Columns>
            <asp:TemplateField HeaderText="公司名称"> <ItemTemplate> <%# Eval("CompanyName") %> </ItemTemplate> 
                   </asp:TemplateField>
            <asp:TemplateField HeaderText="法人代表"><ItemTemplate> <%# Eval("Owner") %> </ItemTemplate> <EditItemTemplate>
                    <asp:TextBox ID="Owner" runat="server"  text=<%# Eval("Owner") %>></asp:TextBox></asp:TextBox>
                </EditItemTemplate><ControlStyle Width="92%" /></asp:TemplateField>
            <asp:TemplateField HeaderText="电话"><ItemTemplate> <%# Eval("Phone")%> </ItemTemplate><EditItemTemplate>
                    <asp:TextBox ID="Phone" runat="server"  text=<%# Eval("Phone") %>></asp:TextBox></asp:TextBox>
                </EditItemTemplate><ControlStyle Width="92%" /></asp:TemplateField>
            <asp:TemplateField HeaderText="公司网站"><ItemTemplate> <%# Eval("website") %> </ItemTemplate><EditItemTemplate>
                    <asp:TextBox ID="website" runat="server"  text=<%# Eval("website") %>></asp:TextBox></asp:TextBox>
                </EditItemTemplate><ControlStyle Width="92%" /></asp:TemplateField>
            <asp:TemplateField HeaderText="成立时间"><ItemTemplate> <%# Eval("createdate") %> </ItemTemplate><EditItemTemplate>
                    <asp:TextBox ID="createdate" runat="server"  text=<%# Eval("createdate") %>></asp:TextBox></asp:TextBox>
                </EditItemTemplate><ControlStyle Width="92%" /></asp:TemplateField>
             <asp:TemplateField HeaderText="营业执照"><ItemTemplate> <%# Eval("companyID") %> </ItemTemplate><EditItemTemplate>
                    <asp:TextBox ID="companyID" runat="server"  text=<%# Eval("companyID") %>></asp:TextBox></asp:TextBox>
                </EditItemTemplate><ControlStyle Width="92%" /></asp:TemplateField>
            <asp:CommandField HeaderText="操作" ShowEditButton="True" SelectText="查看" 
                ShowDeleteButton="True" ShowSelectButton="True" ></asp:CommandField>
        </Columns>
        <FooterStyle  ForeColor="#000000" />
        <HeaderStyle BackColor="#DBDBDB" Font-Bold="True" ForeColor="#000000" />
        <PagerStyle BackColor="#DBDBDB" ForeColor="#000000" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#000000" />
        <SelectedRowStyle BackColor="#DBDBDB" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
            </table>
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
