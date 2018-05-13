<template>
  <div class="menu">
    <div class="menutop">
      <i></i>
      控制中心
    </div>
    <ul class="root-menu" v-for="(father,index) in menus" :key="index">
      <li>
        <div :class="father._class" @click="togglemenu(father)"> {{ father.name }}</div>
        <transition name="fadeDown" :duration="{ enter: 200, leave: 10 }" mode="out-in">
          <ul class="second-menu" v-show="father.showChild">
            <li v-for="(son,index) in father.childs" :key="index">
              <cite></cite>
              <a :href="son.url" target="mainIframe">
                {{ son.name }}
              </a>
              <i></i>
            </li>
          </ul>
        </transition>
      </li>
    </ul>
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
    }
  }
}
</script>

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

.menutop {
  height: 40px;
  line-height: 40px;
  color: #fff;
  background: rgb(63, 150, 201);
}

.menutop i {
  margin-left: 8px;
  margin-top: 10px;
  margin-right: 8px;
  background: url("../../image/default/leftico.png") no-repeat;
  width: 20px;
  height: 20px;
  float: left;
}

.root-menu > li > div {
  background-color: rgb(212, 231, 240);
  background-repeat: no-repeat;
  line-height: 35px;
  font-weight: bold;
  font-size: 14px;
  border-right: solid 1px #b7d5df;
  border-bottom: solid 1px #b7d5df;
  background-position: 10px;
  text-indent: 35px;
  cursor: pointer;
}

.second-menu li {
  line-height: 35px;
  height: 35px;
  font-size: 14px;
  border-right: solid 1px #b7d5df;
  cursor: pointer;
  position: relative;
}

.second-menu cite {
  background: url("../../image/default/list.gif") no-repeat;
  width: 12px;
  height: 12px;
  display: block;
  float: left;
  margin-left: 35px;
  margin-top: 10px;
  margin-right: 5px;
}

.second-menu a {
  display: block;
}

.second-menu li.active cite {
  background: url("../../image//default/whitelist.gif") no-repeat;
}

.second-menu li.active {
  background: url("../../image/default/active.png") no-repeat;
  background-size: cover;
}

.second-menu li.active a {
  color: white;
}

.second-menu li.active i {
  background: url("../../image/default/sj.png") no-repeat;
  width: 6px;
  height: 11px;
  position: absolute;
  right: -1px;
  top: 13px;
}
</style>