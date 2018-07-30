<template>
  <div class="container">
    <AppHeader></AppHeader>
    <AppMenu></AppMenu>
    <TagsOpened></TagsOpened>
    <keep-alive>
      <router-view class="main" v-if="$route.meta.keepAlive"></router-view>
    </keep-alive>
    <router-view class="main" v-if="!$route.meta.keepAlive"></router-view>
  </div>
</template>

<script>
import AppHeader from "./Header.vue"
import AppMenu from "./Menu.vue"
import TagsOpened from "./TagsOpened.vue"

export default {
  name: "Default",
  data: function() {
    return {}
  },
  components: {
    AppHeader,
    AppMenu,
    TagsOpened
  }
}
</script>

<style scoped>
.main {
  position: absolute;
  top: 50px;
  bottom: 0;
  left: 200px;
  right: 0;
  padding: 10px;
  background-color: #fff;
  overflow-y: auto;
}
</style>