<template>
  <div id="app">
    <transition enter-active-class="bounceInLeft" leave-active-class="bounceOutRight">
      <router-view/>
    </transition>
  </div>
</template>

<script>
export default {
  name: "App",
  mounted() {
    if (this.$store.state.token == null || this.$store.state.token.length == 0) {
      this.$router.push("./login")
    }
  }
}
</script>

<style lang="scss">
@import "./style/common.scss";
</style>
