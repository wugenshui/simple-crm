<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrivilegeControl.aspx.cs" Inherits="CRM.EmployeeControl.PrivilegeControl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> </title>
       <meta http-equiv="REFRESH" content="302">
    <link rel="stylesheet" type="text/css" href="../Styles/BaseStyle.css" />
    <script type="text/javascript" src="../JS/jsFunction.js"></script>
    <script type="text/javascript">
        function FillText( Name, department) {
   
            this.form1.txtName.value = Name;

            this.form1.TextBox2.value = department;
        }
    </script>
    <style type="text/css">
        .style1
        {
            height: 17px;
        }
        .style2
        {
            height: 21px;
            width: 986px;
        }
        .style3
        {
            width: 986px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="pagetop" class="pagetop">
        <div class="pagetopleft">
             </div>
        <div class="pagetopright">
        </div>
    </div>
    <table style="width: 100%">
        <tr align="center" >
            <td class="style2">
                 
            </td>
            <td style="height: 21px">
                 
            </td>
        </tr>
        <tr align="center" valign="top">
            <td class="style3">
                <asp:GridView ID="gvDefine" runat="server" AutoGenerateColumns="False" DataKeyNames="name"
                    Width="100%" onrowcommand="gvDefine_RowCommand" BackColor="White" 
                    BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    GridLines="Horizontal">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="账号" SortExpression="Name" />
                         <asp:BoundField DataField="Team" HeaderText="团队" 
                            SortExpression="团队" />
                         <asp:TemplateField HeaderText="Action">
                    <itemtemplate>                    
                    <asp:LinkButton ID="lbtnConfigMenu"   CommandArgument='<%# Eval("name") %>'  CommandName="cmdConfigMenu" runat="server">Menu</asp:LinkButton>
                   
                    </itemtemplate> 
                </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
               
                </asp:GridView>
                <table style="width: 100%;">
                    <tr>
                        <td class="style1">
                             EmpId 
                             <asp:TextBox ID="txtSysRoleID" runat="server" CssClass="InputCss"></asp:TextBox>
                        </td>
              
                        <td class="style1">
                             Department<asp:TextBox ID="TextBox2" runat="server" CssClass="InputCss"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="btnModify0" runat="server" CssClass="InputCss" Text="Query" />
                &nbsp;
                <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="ButtonCss" 
                    OnClick="btnAdd_Click" Width="52px" />&nbsp;
                &nbsp;<asp:Button ID="btnDel" runat="server" CssClass="InputCss" Text="Delete" OnClick="btnDel_Click"
                    OnClientClick="Delete this empId?" />
                &nbsp;
                <asp:Button ID="btnSetMenu" runat="server" CssClass="InputCss" Text="Set Menu" OnClick="btnSetMenu_Click" />
            </td>
            <td>
                <asp:GridView ID="gvDefault" runat="server" AutoGenerateColumns="False" DataKeyNames="name"
                    Width="100%" onrowcommand="gvDefault_RowCommand" BackColor="White" 
                    BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    GridLines="Horizontal">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="账号" SortExpression="Name" />
                         <asp:TemplateField HeaderText="Action">
                    <itemtemplate>                    
                    <asp:LinkButton ID="lbtnConfigMenu2"   CommandArgument='<%# Eval("name") %>'  CommandName="cmdConfigMenu2" runat="server">Menu</asp:LinkButton>
                    <asp:LinkButton ID="lbtnConfigRight2"   CommandArgument='<%# Eval("name") %>'  CommandName="cmdConfigRight2" runat="server">Privilege</asp:LinkButton>
                    </itemtemplate> 
                </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    
                </asp:GridView>
                <br />
                <br />
            </td>
        </tr>
    </table>
    <br />
     
    </form>
</body>
</html>
