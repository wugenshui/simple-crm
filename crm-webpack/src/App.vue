<template>
  <div id="app">
    <router-view/>
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

<style scoped>
#app {
  width: 100%;
  height: 100%;
}
</style>
