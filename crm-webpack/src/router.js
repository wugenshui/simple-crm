import Vue from "vue"
import Router from "vue-router"

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: "/",
      name: "Default",
      component: () => import("./page/default/Default.vue"),
      children: [
        {
          path: "/PasswordChange",
          name: "PasswordChange",
          component: () => import("./page/personCenter/PasswordChange.vue")
        },
        {
          path: "/WorkLogList",
          name: "WorkLogList",
          component: () => import("./page/personCenter/WorkLogList.vue")
        },
        {
          path: "/WorkLogEdit",
          name: "WorkLogEdit",
          component: () => import("./page/personCenter/WorkLogEdit.vue")
        },
        {
          path: "/CompanyList",
          name: "CompanyList",
          component: () => import("./page/Organization/CompanyList.vue")
        },
        {
          path: "/CompanyAdd",
          name: "CompanyAdd",
          component: () => import("./page/Organization/CompanyAdd.vue")
        },
        {
          path: "/TeamList",
          name: "TeamList",
          component: () => import("./page/Organization/TeamList.vue")
        },
        {
          path: "/TeamAdd",
          name: "TeamAdd",
          component: () => import("./page/Organization/TeamAdd.vue")
        }
      ]
    },
    { path: "/Login", name: "Login", component: resolve => require(["./page/login/Login.vue"], resolve) }
  ]
})
