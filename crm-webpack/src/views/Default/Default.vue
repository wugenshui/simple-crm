<template>
  <div class="container">
    <AppHeader></AppHeader>
    <div class="center">
      <AppMenu></AppMenu>
      <TagsOpened class="tag"></TagsOpened>
      <keep-alive>
        <router-view class="main" v-if="$route.meta.keepAlive"></router-view>
      </keep-alive>
      <router-view class="main" v-if="!$route.meta.keepAlive"></router-view>
    </div>
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
.center {
  position: absolute;
  top: 56px;
  bottom: 0;
  left: 0;
  right: 0;
}

.tag {
  position: absolute;
  top: 0;
  height: 50px;
  left: 180px;
  right: 0;
  padding: 10px;
  background-color: #eee;
  overflow-x: auto;
  border-bottom: 1px solid #ccc;
}

.main {
  position: absolute;
  top: 50px;
  bottom: 0;
  left: 180px;
  right: 0;
  padding: 10px;
  background-color: #fff;
  overflow-y: auto;
}
</style>