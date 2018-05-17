<template>
  <div class="container">
    <TopHeader></TopHeader>
    <div class="center">
      <LeftMenu></LeftMenu>
      <router-view class="main"></router-view>
    </div>
  </div>
</template>

<script>
import TopHeader from "./Header.vue"
import LeftMenu from "./Menu.vue"

export default {
  data: function() {
    return {}
  },
  components: {
    TopHeader,
    LeftMenu
  }
}
</script>

<style scoped>
.center {
  position: absolute;
  top: 60px;
  bottom: 0;
  left: 0;
  right: 0;
}

.main {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 180px;
  right: 0;
  padding: 10px;
  overflow: auto;
}
</style>