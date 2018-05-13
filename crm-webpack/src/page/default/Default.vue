<template>
  <div>
    <TopHeader></TopHeader>
    <div class="center">
      <LeftMenu></LeftMenu>
      <div class="main"></div>
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
</style>