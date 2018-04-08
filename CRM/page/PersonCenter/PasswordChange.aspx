<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordChange.aspx.cs" Inherits="CRM.page.PersonCenter.PasswordChange" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>修改密码</title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../css/common.css" rel="stylesheet" />
    <style>
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                修改密码
            </div>
            <div class="card-body">
                <form>
                    <input name="type" value="change" hidden="hidden" />
                    <div class="form-group row">
                        <label for="txtOld" class="col-sm-2 col-form-label text-right">原密码:</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="txtOld" name="txtOld" placeholder="原密码" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="txtNew" class="col-sm-2 col-form-label text-right">新密码:</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="txtNew" name="txtNew" placeholder="新密码" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="txtNewRepeat" class="col-sm-2 col-form-label text-right">重复输入新密码:</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="txtNewRepeat" placeholder="重复输入新密码" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="card-footer">
                <button type="button" class="btn btn-primary" id="btnSave">保存</button>
            </div>
        </div>
    </div>

    <script src="../../Scripts/jquery-3.0.0.min.js"></script>
    <script src="../../Scripts/umd/popper.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
    <script src="../../js/layer3.1.1/layer.js"></script>
    <script>
        $("#btnSave").click(function () {
            var txtNew = $("#txtNew").val();
            var txtNewRepeat = $("#txtNewRepeat").val();
            if (txtNew != null && txtNew != "") {
                if (txtNew == txtNewRepeat) {
                    var data = $("form").serialize();
                    $.post("", data).always(function (response) {
                        layer.alert(response);
                    });
                } else {
                    layer.alert('重复输入新密码有误！');
                }
            } else {
                layer.alert('新密码不能为空！');
            }
        })
    </script>
</body>
</html>
