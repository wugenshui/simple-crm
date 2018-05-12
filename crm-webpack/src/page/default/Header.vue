<template>
    <div>
        <nav class="navbar navbar-expand navbar-dark" style="background-color: #0e90d2;">
            <a class="navbar-brand" href="#">CRM客户管理系统</a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <Dropdown class="text-white">
                    <a href="javascript:void(0)">
                        待办任务
                    </a>
                </Dropdown>
                <Dropdown class="text-white" @on-click="logout">
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
                <Dropdown class="text-white">
                    <a href="javascript:void(0)">
                        开启全屏
                    </a>
                </Dropdown>
            </div>
        </nav>
    </div>
</template>

<script>
export default {
  data: function() {
    return {}
  },
  methods: {
    logout(name) {
      if (name == "logout") {
        this.$store.commit("setToken", "")
        this.$router.push("./login")
      }
    }
  }
}
</script>

<style scoped>
a {
  color: white;
  padding-top: 5px;
}
</style>