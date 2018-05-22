import Vue from "vue"
import Router from "vue-router"

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: "/",
      name: "Default",
      component: resolve => require(["./page/default/Default.vue"], resolve),
      children: [
        {
          path: "/PasswordChange",
          name: "PasswordChange",
          component: resolve => require(["./page/personCenter/PasswordChange.vue"], resolve)
        },
        {
          path: "/WorkLogList",
          name: "WorkLogList",
          component: resolve => require(["./page/personCenter/WorkLogList.vue"], resolve)
        },
        {
          path: "/WorkLogEdit",
          name: "WorkLogEdit",
          component: resolve => require(["./page/personCenter/WorkLogEdit.vue"], resolve)
        }
      ]
    },
    { path: "/Login", name: "Login", component: resolve => require(["./page/login/Login.vue"], resolve) }
  ]
})
