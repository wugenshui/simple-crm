<%@ Page Language="vb" AutoEventWireup="false"  EnableEventValidation="true"  CodeBehind="Desktop.aspx.vb" Inherits="warehouse.Desktop_aspx" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 155px">
    <form id="form1" runat="server">
    <div style="height: 68px" Align="center">
    
        <p style="language:zh-CN;margin-top:0pt;margin-bottom:0pt;margin-left:0in;
text-align:left;direction:ltr;unicode-bidi:embed;mso-line-break-override:none;
word-break:normal;punctuation-wrap:hanging">
            <span style="font-size:36.0pt;
font-family:Calibri;mso-ascii-font-family:Calibri;mso-fareast-font-family:宋体;
mso-bidi-font-family:+mn-cs;color:#002060;mso-font-kerning:12.0pt;language:
en-US">Welcome Use IGS </span>
            <span style="font-size:36.0pt;font-family:Calibri;
mso-ascii-font-family:Calibri;mso-fareast-font-family:+mn-ea;mso-bidi-font-family:
+mn-cs;color:#002060;mso-font-kerning:12.0pt;language:en-US">Shop Floor Integrated System</span><span style="font-size:36.0pt;font-family:Calibri;
mso-ascii-font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:
+mn-cs;color:#002060;mso-font-kerning:12.0pt;language:zh-CN"> </span>
        </p>
    
    </div>
    <p style="language: zh-CN; text-align: left; direction: ltr; unicode-bidi: embed; mso-line-break-override: none; word-break: normal; punctuation-wrap: hanging; margin-left: 0in; margin-top: 0pt; margin-bottom: 0pt">
        <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" Text=""></asp:Label>
    </p>
    <p style="language: zh-CN; text-align: left; direction: ltr; unicode-bidi: embed; mso-line-break-override: none; word-break: normal; punctuation-wrap: hanging; margin-left: 0in; margin-top: 0pt; margin-bottom: 0pt">
        <asp:Label ID="Label2" runat="server" Font-Size="XX-Large" Text=""></asp:Label>
    </p>
    <p style="language: zh-CN; text-align: left; direction: ltr; unicode-bidi: embed; mso-line-break-override: none; word-break: normal; punctuation-wrap: hanging; margin-left: 0in; margin-top: 0pt; margin-bottom: 0pt">
        <asp:Label ID="Label3" runat="server" Font-Size="XX-Large" Text=""></asp:Label>
        <asp:GridView ID="GridView1" runat="server" BackColor="White" 
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            EnableModelValidation="True"   >
            <Columns>
                <asp:TemplateField HeaderText="Agree" ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="false" 
                            CommandName="Update" Text="Agree" onclick="Button1_Click"  CommandArgument='<%# Eval("id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Reject" ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button2" runat="server" CausesValidation="false" CommandName="" 
                            Text="Reject" onclick="Button2_Click"   CommandArgument='<%# Eval("id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
      
        </asp:GridView>
    </p>
    <p style="language: zh-CN; text-align: left; direction: ltr; unicode-bidi: embed; mso-line-break-override: none; word-break: normal; punctuation-wrap: hanging; margin-left: 0in; margin-top: 0pt; margin-bottom: 0pt">
        <asp:Label ID="Label4" runat="server" Font-Size="XX-Large" Text=""></asp:Label>
    </p>
    <p style="language: zh-CN; text-align: left; direction: ltr; unicode-bidi: embed; mso-line-break-override: none; word-break: normal; punctuation-wrap: hanging; margin-left: 0in; margin-top: 0pt; margin-bottom: 0pt">
        <asp:Label ID="Label5" runat="server" Font-Size="XX-Large" Text=""></asp:Label>
    </p>
    <p style="language: zh-CN; text-align: left; direction: ltr; unicode-bidi: embed; mso-line-break-override: none; word-break: normal; punctuation-wrap: hanging; margin-left: 0in; margin-top: 0pt; margin-bottom: 0pt">
        <asp:Label ID="Label6" runat="server" Font-Size="XX-Large" Text=""></asp:Label>
    </p>
    <p style="language: zh-CN; text-align: left; direction: ltr; unicode-bidi: embed; mso-line-break-override: none; word-break: normal; punctuation-wrap: hanging; margin-left: 0in; margin-top: 0pt; margin-bottom: 0pt">
        <asp:Label ID="Label7" runat="server" Font-Size="XX-Large" Text=""></asp:Label>
    </p>
    <p style="language: zh-CN; text-align: left; direction: ltr; unicode-bidi: embed; mso-line-break-override: none; word-break: normal; punctuation-wrap: hanging; margin-left: 0in; margin-top: 0pt; margin-bottom: 0pt">
        <asp:Label ID="Label8" runat="server" Font-Size="XX-Large" Text=""></asp:Label>
    </p>
    <p style="language: zh-CN; text-align: left; direction: ltr; unicode-bidi: embed; mso-line-break-override: none; word-break: normal; punctuation-wrap: hanging; margin-left: 0in; margin-top: 0pt; margin-bottom: 0pt">
        <asp:Label ID="Label9" runat="server" Font-Size="XX-Large" Text=""></asp:Label>
    </p>
    <p style="language: zh-CN; text-align: left; direction: ltr; unicode-bidi: embed; mso-line-break-override: none; word-break: normal; punctuation-wrap: hanging; margin-left: 0in; margin-top: 0pt; margin-bottom: 0pt">
        <asp:Label ID="Label10" runat="server" Font-Size="XX-Large" Text=""></asp:Label>
    </p>
    <p style="language: zh-CN; text-align: left; direction: ltr; unicode-bidi: embed; mso-line-break-override: none; word-break: normal; punctuation-wrap: hanging; margin-left: 0in; margin-top: 0pt; margin-bottom: 0pt">
        <asp:Label ID="Label11" runat="server" Font-Size="XX-Large" Text=""></asp:Label>
    </p>
    <p style="language: zh-CN; text-align: left; direction: ltr; unicode-bidi: embed; mso-line-break-override: none; word-break: normal; punctuation-wrap: hanging; margin-left: 0in; margin-top: 0pt; margin-bottom: 0pt">
        <asp:Label ID="Label12" runat="server" Font-Size="XX-Large" Text=""></asp:Label>
    </p>
    <p style="language: zh-CN; text-align: left; direction: ltr; unicode-bidi: embed; mso-line-break-override: none; word-break: normal; punctuation-wrap: hanging; margin-left: 0in; margin-top: 0pt; margin-bottom: 0pt">
        <asp:Label ID="Label13" runat="server" Font-Size="XX-Large" Text=""></asp:Label>
    </p>
    <p style="language: zh-CN; text-align: left; direction: ltr; unicode-bidi: embed; mso-line-break-override: none; word-break: normal; punctuation-wrap: hanging; margin-left: 0in; margin-top: 0pt; margin-bottom: 0pt">
        <asp:Label ID="Label14" runat="server" Font-Size="XX-Large" Text=""></asp:Label>
    </p>
    <p style="language: zh-CN; text-align: left; direction: ltr; unicode-bidi: embed; mso-line-break-override: none; word-break: normal; punctuation-wrap: hanging; margin-left: 0in; margin-top: 0pt; margin-bottom: 0pt">
        <asp:Label ID="Label15" runat="server" Font-Size="XX-Large" Text=""></asp:Label>
    </p>
    </form>
    </body>
</html>
