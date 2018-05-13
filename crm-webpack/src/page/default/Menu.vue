<template>
    <div class="menu">
        <div class="menutop">
            <i></i>
            控制中心
        </div>
        <ul class="root-menu" v-for="(father,index) in menus" :key="index">
            <li>
                <div :style="'background-image: url('+ father.Class +');'"> {{ father.MenuName }}</div>
                <ul class="second-menu" :style="index==0 ? display:block">
                    <li v-for="(son,index) in father.Childs" :key="index">
                        <cite></cite>
                        <a :href="son.MenuURL" target="mainIframe">
                            {{ son.MenuName }}
                        </a>
                        <i></i>
                    </li>
                </ul>
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
  }
}
</script>

<style scoped>
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
  background: rgb(212, 231, 240);
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

.second-menu {
  display: none;
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