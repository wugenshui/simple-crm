import Vue from "vue"
import Router from "vue-router"

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: "/",
      name: "default",
      component: resolve => require(["../page/default/Default.vue"], resolve),
      children: [
        {
          path: "/changepassword",
          name: "changepassword",
          component: resolve => require(["../page/personCenter/changepassword.vue"], resolve)
        }
      ]
    },
    { path: "/login", name: "login", component: resolve => require(["../page/login/Login.vue"], resolve) }
  ]
})
