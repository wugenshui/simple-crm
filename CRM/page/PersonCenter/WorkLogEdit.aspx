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
        <div id="div1">
            <p>欢迎使用 wangEditor 富文本编辑器</p>
        </div>

        <script type="text/javascript">
            var E = window.wangEditor;
            var editor = new E('#div1');
            editor.customConfig.uploadImgShowBase64 = true;   // 使用 base64 保存图片
            editor.customConfig.emotions = [
                {
                    // tab 的标题
                    title: 'emoji',
                    // type -> 'emoji' / 'image'
                    type: 'emoji',
                    // content -> 数组
                    content: '😀 😃 😄 😁 😆 😅 😂 😊 😇 🙂 🙃 😉 😌 😍 😘 😗 😙 😚 😋 😜 😝 😛 🤑 🤗 🤓 😎 😏 😒 😞 😔 😟 😕 🙁  😣 😖 😫 😩 😤 😠 😡 😶 😐 😑 😯 😦 😧 😮 😲 😵 😳 😱 😨 😰 😢 😥 😭 😓 😪 😴 🙄 🤔 😬 🤐'.split(/\s/)
                },
                {
                    // tab 的标题
                    title: 'emoji手势',
                    // type -> 'emoji' / 'image'
                    type: 'emoji',
                    // content -> 数组
                    content: ['🙌', '👏', '👋', '👍', '👎', '👊', '✊', '️👌', '✋', '👐', '💪', '🙏', '️👆', '👇', '👈', '👉', '🖕', '🖐', '🤘']
                }
            ];
            editor.create();
    </script>
    </form>
</body>
</html>
