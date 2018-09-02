<template>
  <nav>
    <a class="title" href="#">
      CRM客户管理系统
    </a>
    <i class="icon icon-menu" @click="$store.state.menu.isCollapse=!$store.state.menu.isCollapse;" :style="{transform:'rotate('+ ($store.state.menu.isCollapse==true ? 90 : 0) + 'deg)'}"></i>
    <div class="float-right">
      <a>
        <i class="icon icon-todo"></i>
        待办任务
      </a>
      <el-dropdown @command="handleCommand">
        <span class="el-dropdown-link">
          <i class="icon icon-consumer"></i>
          {{ '用户' }}
          <i class="el-icon-arrow-down"></i>
        </span>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item command="info">
            <i class="icon icon-data"></i> 用户资料
          </el-dropdown-item>
          <el-dropdown-item command="setting">
            <i class="icon icon-config"></i> 系统设置
          </el-dropdown-item>
          <el-dropdown-item command="logout">
            <i class="icon icon-exit"></i> 退出系统
          </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
      <a @click="fullscreenToggle">
        <i class="icon" :class="isFullScreen ? 'icon-fullscreen-exit' : 'icon-fullscreen'"></i>
        {{ isFullScreen ? '退出全屏' : '开启全屏' }}
      </a>
    </div>
  </nav>
</template>

<script>
export default {
  data: function() {
    return {
      isFullScreen: true
    }
  },
  methods: {
    handleCommand(command) {
      if (command == "logout") {
        this.$store.commit("setToken", "")
        this.$router.push("./login")
      }
    },
    // 全屏切换
    fullscreenToggle() {
      var isfScreen = document.fullscreenEnabled || window.fullScreen || document.webkitIsFullScreen
      if (this.isFullScreen) {
        // 是全屏状态
        this.existFullscreen()
      } else {
        this.fullscreen()
      }
    },
    // 全屏
    fullscreen() {
      var ele = document.documentElement
      if (ele.requestFullscreen) {
        ele.requestFullscreen()
      } else if (ele.msRequestFullscreen) {
        ele.msRequestFullscreen()
        ieIsfSceen = true
      } else if (ele.mozRequestFullScreen) {
        ele.mozRequestFullScreen()
      } else if (ele.webkitRequestFullScreen) {
        ele.webkitRequestFullScreen()
      } else {
        console.log("不支持全屏")
      }
    },
    // 退出全屏
    existFullscreen() {
      if (document.exitFullscreen) {
        document.exitFullscreen()
      } else if (document.msExitFullscreen) {
        document.msExitFullscreen()
      } else if (document.mozCancelFullScreen) {
        document.mozCancelFullScreen()
      } else if (document.webkitCancelFullScreen) {
        document.webkitCancelFullScreen()
      } else {
        console.log("不支持全屏")
      }
    },
    // 全屏状态切换
    stateChange() {
      this.isFullScreen = !this.isFullScreen
    }
  },
  mounted() {
    document.addEventListener("fullscreenchange", this.stateChange)
    document.addEventListener("webkitfullscreenchange", this.stateChange)
    document.addEventListener("mozfullscreenchange", this.stateChange)
    document.addEventListener("MSFullscreenChange", this.stateChange)
  }
}
</script>

<style scoped>
nav {
  background-color: #0e90d2;
  height: 56px;
  line-height: 56px;
}

.icon-menu {
  transform: rotate(90deg);
  transition: 0.38s;
  transform-origin: 50% 50%;
  display: inline-block;
  color: white;
  cursor: pointer;
}

.title {
  font-size: 1.25rem;
  text-indent: 50px;
}

a,
.el-dropdown-link {
  color: white;
  cursor: pointer;
  font-size: 16px;
  margin-right: 10px;
  height: 56px;
  display: inline-block;
}

.ivu-dropdown {
  margin-right: 10px;
}
</style>