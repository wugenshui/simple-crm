<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetPrivilege.aspx.cs" Inherits="CRM.EmployeeControl.SetPrivilege" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title> </title>
    <link rel="stylesheet" type="text/css" href="../Styles/BaseStyle.css"  />
    <script type="text/javascript" src="../JS/jsFunction.js"></script>
   <script type="text/javascript">
       function public_GetParentByTagName(element, tagName) {
           var parent = element.parentNode;
           var upperTagName = tagName.toUpperCase();
           while (parent && (parent.tagName.toUpperCase() != upperTagName)) {
               parent = parent.parentNode ? parent.parentNode : parent.parentElement;
           }
           return parent;
       }

       function setParentChecked(objNode) {
           var objParentDiv = public_GetParentByTagName(objNode, "div");
           if (objParentDiv == null || objParentDiv == "undefined") {
               return;
           }
           var objID = objParentDiv.getAttribute("ID");
           objID = objID.substring(0, objID.indexOf("Nodes"));
           objID = objID + "CheckBox";
           var objParentCheckBox = document.getElementById(objID);
           if (objParentCheckBox == null || objParentCheckBox == "undefined") {
               return;
           }
           if (objParentCheckBox.tagName != "INPUT" && objParentCheckBox.type == "checkbox")
               return;
           objParentCheckBox.checked = true;
           setParentChecked(objParentCheckBox);
       }

       function setChildUnChecked(divID) {
           var objchild = divID.children;
           var count = objchild.length;
           for (var i = 0; i < objchild.length; i++) {
               var tempObj = objchild[i];
               if (tempObj.tagName == "INPUT" && tempObj.type == "checkbox") {
                   tempObj.checked = false;
               }
               setChildUnChecked(tempObj);
           }
       }

       function setChildChecked(divID) {
           var objchild = divID.children;
           var count = objchild.length;
           for (var i = 0; i < objchild.length; i++) {
               var tempObj = objchild[i];
               if (tempObj.tagName == "INPUT" && tempObj.type == "checkbox") {
                   tempObj.checked = true;
               }
               setChildChecked(tempObj);
           }
       }

       //触发事件
       function CheckEvent() {

           var objNode = event.srcElement;

           if (objNode.tagName != "INPUT" || objNode.type != "checkbox")
               return;

           if (objNode.checked == true) {
               setParentChecked(objNode);
               var objID = objNode.getAttribute("ID");
          
               var objID = objID.substring(0, objID.indexOf("CheckBox"));
               var objParentDiv = document.getElementById(objID + "Nodes");
               if (objParentDiv == null || objParentDiv == "undefined") {
                   return;
               }
               setChildChecked(objParentDiv);
           }
           else {
               var objID = objNode.getAttribute("ID");
               var objID = objID.substring(0, objID.indexOf("CheckBox"));
               var objParentDiv = document.getElementById(objID + "Nodes");
               if (objParentDiv == null || objParentDiv == "undefined") {
                   return;
               }
               setChildUnChecked(objParentDiv);
           }
       }

</script>

</head>
<body style="background-image: url(../Images/Main_bg.gif)">
    <form id="form1" runat="server">
<table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse;height:27px" 

 
				width="100%" >
				<tr>
					<td width="3%" bgcolor="#c0d9e6" class="GbText" 

 ><font color="#006699" size="3"><img src="../Images/moduleheaher.gif" alt="" width="16" height="16" \></font></td>
					<td bgcolor="#c0d9e6" class="GbText" 

  style="width: 207px"><b>&nbsp; employeeMenuSet</b></td>

                    <td   bgcolor="#c0d9e6" class="GbText" 

align="right" >
                        
                        <a href="javascript:window.location.reload()">Refresh</a> 
                      </td>
				</tr>
			</table>
        <table width="100%">
            <tr>
                <td style="width: 260px; height: 339px; text-align: center;">
                   <p>
                       <asp:Label ID="lbRole" runat="server" Text=""></asp:Label>
               
                       <br />
               
                    <br /><asp:Button ID="btnConfigMenu" runat="server" OnClick="btnConfigMenu_Click" 
                            Text="提交" CssClass="ButtonCss" Width="113px" />
                       <br />
                       <br />
                       <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" 
                            Text="返回" CssClass="ButtonCss" Width="113px" />
                    </p>
               
              
                    
                    

                      
                    
                    

                 
                    </td>
                <td valign="middle" >
                    <asp:TreeView ID="MainMenuTreeView" runat="server" ShowCheckBoxes="All" ExpandDepth="0" 
                         >
                    </asp:TreeView>
                    <br />
                    &nbsp; &nbsp;&nbsp;
                                        
                    </td>
            </tr>
        </table>
    </form>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
</body>
</html>
