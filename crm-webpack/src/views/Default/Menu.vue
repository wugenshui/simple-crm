<template>
  <div class="menu">
    <el-menu @open="handleOpen" @close="handleClose" :collapse="$store.state.menu.isCollapse" :unique-opened="true" background-color="#304156" text-color="#BFCBD9" :router="true">
      <el-menu-item index="/">
        <i class="icon icon-home"></i>
        <span slot="title">首页</span>
      </el-menu-item>
      <el-submenu v-for="(father,index) in menus" :key="index" :index="father.name" text-color="#BFCBD9">
        <template slot="title">
          <i :class="father._class"></i>
          <span slot="title">{{ father.name }}</span>
        </template>
        <el-menu-item v-for="(son,index) in father.childs" :key="index" :index="son.url">
          {{ son.name }}
        </el-menu-item>
      </el-submenu>
    </el-menu>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      menus: []
    }
  },
  mounted() {
    this.$ajax.get("menu").then(res => {
      this.menus = res.data.data
    })
  },
  methods: {
    togglemenu(father) {
      if (!father.showChild) {
        for (var i = 0; i < this.menus.length; i++) {
          this.menus[i].showChild = false
        }
        father.showChild = true
      } else {
        father.showChild = false
      }
    },
    handleOpen() {},
    handleClose() {}
  }
}
</script>

<style>
.menu .el-menu {
  width: 200px;
  overflow: hidden;
}

.menu .el-menu-item.is-active a {
  color: #409eff;
}
</style>
<style scoped>
</style>