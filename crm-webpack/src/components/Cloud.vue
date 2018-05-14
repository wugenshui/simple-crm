<template>
    <div>
        <div class="cloud cloud1" :style="{backgroundPositionX:offset1+'px'}"></div>
        <div class="cloud cloud2" :style="{backgroundPositionX:offset2+'px'}"></div>
    </div>
</template>

<script>
export default {
  data: function() {
    return {
      offset1: 450,
      offset2: 0,
      timer: null
    }
  },
  mounted() {
    var mainwidth = document.getElementById("app").clientWidth
    this.timer = setInterval(() => {
      console.log("浮云")
      if (this.offset1 >= mainwidth) {
        this.offset1 = -580
      }
      if (this.offset2 >= mainwidth) {
        this.offset2 = -580
      }
      this.offset1 += 1.1
      this.offset2 += 1
    }, 70)
  },
  beforeDestroy() {
    clearInterval(this.timer)
  }
}
</script>

<style scoped>
.cloud {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  z-index: 1;
  opacity: 0.5;
  background: url("../image/login/cloud.png") no-repeat;
}

.cloud1 {
  background-position-y: 100px;
}

.cloud2 {
  background-position-y: 460px;
}
</style>