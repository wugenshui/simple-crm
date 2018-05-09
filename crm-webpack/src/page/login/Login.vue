<template>
    <div onselectstart="return false;">
        <div class="logintop">
            <span>欢迎登录员工客户管理平台</span>
            <ul class="float-right">
                <li>
                    <a href="#">客服</a>
                </li>
                <li>
                    <a href="#">帮助</a>
                </li>
                <li>
                    <a href="#">关于</a>
                </li>
            </ul>
        </div>
        <div class="loginbody">
            <div class="centerbox">
                <span class="systemlogo"></span>
                <div class="loginbox">
                    <form id="loginform" runat="server">
                        <ul>
                            <li>
                                <input id="inputName" class="loginuser" runat="server" type="text" placeholder="用户名" /></li>
                            <li>
                                <input id="inputPassword" class="loginpwd" runat="server" type="password" placeholder="密码" /></li>
                            <li>
                                <asp:Button ID="Button1" type="submit" runat="server" class="loginbtn" Text="登录" OnClick="Button1_Click" Width="97px"></asp:Button>
                                <label>
                                    <input name="" type="checkbox" value="" checked="checked" />记住密码</label>
                                <label>
                                    <a href="#">忘记密码？</a>
                                </label>
                            </li>
                        </ul>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
  data: function() {
    return {}
  }
}
</script>

<style scoped>

</style>