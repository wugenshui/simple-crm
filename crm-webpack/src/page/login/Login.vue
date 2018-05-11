<template>
  <div onselectstart="return false;" class="main">
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
                <input class="loginuser" v-model="loginForm.username" type="text" placeholder="用户名" /></li>
              <li>
                <input class="loginpwd" v-model="loginForm.password" type="password" placeholder="密码" /></li>
              <li>
                <button type="submit" class="loginbtn" @click="loginClick">登录</button>
                <label>
                  <input type="checkbox" v-model="isRemember" />记住密码</label>
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
    return {
      loginForm: {
        username: "",
        password: ""
      },
      isRemember: true
    }
  },
  methods: {
    loginClick() {
      localStorage.setItem("crm-username", this.loginForm.username)
      localStorage.setItem("crm-password", this.loginForm.password)
      localStorage.setItem("crm-remember", this.isRemember)
      this.$ajax.post("login", this.loginForm).then(res => {
        if (res.data.state == true) {
          this.$store.commit("setToken", res.data.msg.token)
          this.$store.commit("setUser", res.data.msg.user)
          this.$router.push("/")
        }
      })
    }
  },
  mounted() {
    this.isRemember = localStorage.getItem("crm-remember") != "false"
    if (this.isRemember) {
      this.loginForm.username = localStorage.getItem("crm-username")
      this.loginForm.password = localStorage.getItem("crm-password")
    }
  }
}
</script>

<style scoped>
.main {
  background: url("../../image/login/light.png") no-repeat;
  background-size: cover;
  background-color: #1c77ac;
  position: relative;
  overflow: hidden;
  height: 100%;
}

.logintop {
  background: url("../../image/login/shadow.png");
  height: 50px;
  line-height: 50px;
  color: white;
}

.logintop span {
  float: left;
  background: url("../../image/login/minilogo.png") no-repeat 30px;
  text-indent: 50px;
}

.logintop li {
  float: left;
  margin-right: 20px;
}

.logintop li a {
  color: white;
}

.loginbody {
  position: absolute;
  top: 50px;
  left: 0;
  right: 0;
  bottom: 0;
  background: url("../../image/login/bg.png") no-repeat center center fixed;
}

.centerbox {
  width: 700px;
  height: 400px;
  position: fixed;
  left: 50%;
  top: 50%;
  margin-left: -350px;
  margin-top: -200px;
}

.centerbox .systemlogo {
  background: url("../../image/login/loginlogo.png") no-repeat center;
  width: 100%;
  height: 70px;
  position: absolute;
}

.centerbox ul {
  margin-top: 88px;
  margin-left: 285px;
}

.centerbox li {
  margin-bottom: 25px;
}

.centerbox .loginbox {
  background: url("../../image/login/loginbox.png") no-repeat;
  width: 100%;
  height: 340px;
  position: absolute;
  top: 70px;
}

.loginuser,
.loginpwd {
  width: 343px;
  height: 48px;
  line-height: 48px;
  padding-left: 44px;
  font-size: 14px;
  border: none;
}

.loginuser {
  background: url("../../image/login/loginuser.png") no-repeat center center;
  font-weight: bold;
}

.loginpwd {
  background: url("../../image/login/loginpassword.png") no-repeat center center;
  color: #90a2bc;
}

.loginbtn {
  width: 111px;
  height: 35px;
  background: rgb(60, 149, 200);
  border: none;
  border-radius: 4px;
  font-size: 14px;
  font-weight: bold;
  color: #fff;
  cursor: pointer;
  line-height: 35px;
}

.centerbox ul li label {
  margin-left: 44px;
  color: #687f92;
}

.centerbox ul li label a {
  color: #687f92;
}
</style>