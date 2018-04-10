<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkLogEdit.aspx.cs" Inherits="CRM.page.PersonCenter.WorkLogEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="../../wangEditor-3.1.0/wangEditor.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="editContainer"></div>

        <script type="text/javascript">
            var E = window.wangEditor;
            var editor = new E('#editContainer');
            editor.customConfig.uploadImgShowBase64 = true;   // 使用 base64 保存图片
            editor.customConfig.emotions = [
                {
                    title: 'emoji',
                    // type -> 'emoji' / 'image'
                    type: 'emoji',
                    content: '😀 😃 😄 😁 😆 😅 😂 😊 😇 🙂 🙃 😉 😌 😍 😘 😗 😙 😚 😋 😜 😝 😛 🤑 🤗 🤓 😎 😏 😒 😞 😔 😟 😕 🙁  😣 😖 😫 😩 😤 😠 😡 😶 😐 😑 😯 😦 😧 😮 😲 😵 😳 😱 😨 😰 😢 😥 😭 😓 😪 😴 🙄 🤔 😬 🤐'.split(/\s/)
                },
                {
                    title: '手势',
                    type: 'emoji',
                    content: ['🙌', '👏', '👋', '👍', '👎', '👊', '✊', '️👌', '✋', '👐', '💪', '🙏', '️👆', '👇', '👈', '👉', '🖕', '🖐', '🤘']
                }
            ];
            editor.create();
        </script>
    </form>
</body>
</html>
