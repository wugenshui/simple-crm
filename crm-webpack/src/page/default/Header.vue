<template>
    <div>
        <nav style="">
            <a class="title" href="#">CRM客户管理系统</a>
            <div class="float-right">
                <Dropdown>
                    <a href="javascript:void(0)">
                        待办任务
                    </a>
                </Dropdown>
                <Dropdown @on-click="logout">
                    <a href="javascript:void(0)">
                        {{ '用户' }}
                        <Icon type="arrow-down-b"></Icon>
                    </a>
                    <DropdownMenu slot="list">
                        <DropdownItem name="info">资料</DropdownItem>
                        <DropdownItem name="setting">设置</DropdownItem>
                        <DropdownItem name="logout">退出</DropdownItem>
                    </DropdownMenu>
                </Dropdown>
                <Dropdown>
                    <a href="javascript:void(0)" @click="fullscreenToggle">
                        {{ isFullScreen ? '退出全屏' : '开启全屏' }}
                    </a>
                </Dropdown>
            </div>
        </nav>
    </div>
</template>

<script>
export default {
  data: function() {
    return {
      isFullScreen: false
    }
  },
  methods: {
    logout(name) {
      if (name == "logout") {
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

.title {
  font-size: 1.25rem;
  text-indent: 50px;
  margin-left: 30px;
}

a {
  color: white;
}

.ivu-dropdown {
  margin-right: 10px;
}
</style>