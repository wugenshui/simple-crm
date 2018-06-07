<template>
  <div class="menu">
    <el-menu @open="handleOpen" @close="handleClose" :collapse="isCollapse" :unique-opened="true" background-color="#304156" text-color="#bfcbd9">
      <el-menu-item index="0">
        <i class="el-icon-menu"></i>
        <span slot="title">
          <router-link to="/">首页</router-link>
        </span>
      </el-menu-item>
      <el-submenu v-for="(father,index) in menus" :key="index" :index="father.name">
        <template slot="title">
          <i :class="father._class"></i>
          <span slot="title">{{ father.name }}</span>
        </template>
        <el-menu-item v-for="(son,index) in father.childs" :key="index" :index="son.url">
          <router-link :to="son.url">{{ son.name }}</router-link>
        </el-menu-item>
      </el-submenu>
    </el-menu>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      menus: [],
      isCollapse: false
    }
  },
  mounted() {
    this.$ajax.get("menu").then(res => {
      this.menus = res.data
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
.el-submenu__title > i {
  width: 30px;
  height: 18px;
  display: inline-block;
  background-repeat: no-repeat;
}

.menu .el-menu {
  width: 186px;
}

.menu a {
  width: 100%;
  height: 100%;
  color: rgb(191, 203, 217);
  display: inline-block;
}

.menu .el-submenu {
  margin-bottom: -1px;
}

.menu .el-menu-item.is-active a {
  color: #409eff;
}

.menu .el-submenu__title {
  border-bottom: 1px solid rgb(38, 52, 69);
  border-top: 1px solid rgb(38, 52, 69);
}
</style>
<style scoped>
.menu1 {
  background-image: url("../../image/default/menu1.png");
}

.menu2 {
  background-image: url("../../image/default/menu2.png");
}

.menu3 {
  background-image: url("../../image/default/menu3.png");
}

.menu4 {
  background-image: url("../../image/default/menu4.png");
}

.menu {
  width: 180px;
  height: 100%;
  background: #f0f9fd;
}
</style>