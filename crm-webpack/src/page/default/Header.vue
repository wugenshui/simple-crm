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