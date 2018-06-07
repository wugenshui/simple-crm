import Vue from "vue"
import Router from "vue-router"

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: "/",
      name: "Default",
      component: () => import("./views/default/Default.vue"),
      children: [
        {
          path: "/PasswordChange",
          name: "PasswordChange",
          component: () => import("./views/personCenter/PasswordChange.vue")
        },
        {
          path: "/WorkLogList",
          name: "WorkLogList",
          component: () => import("./views/personCenter/WorkLogList.vue")
        },
        {
          path: "/WorkLogEdit",
          name: "WorkLogEdit",
          component: () => import("./views/personCenter/WorkLogEdit.vue")
        },
        {
          path: "/CompanyList",
          name: "CompanyList",
          component: () => import("./views/Organization/CompanyList.vue")
        },
        {
          path: "/CompanyAdd",
          name: "CompanyAdd",
          component: () => import("./views/Organization/CompanyAdd.vue")
        },
        {
          path: "/TeamList",
          name: "TeamList",
          component: () => import("./views/Organization/TeamList.vue")
        },
        {
          path: "/TeamAdd",
          name: "TeamAdd",
          component: () => import("./views/Organization/TeamAdd.vue")
        },
        {
          path: "/EmployeeList",
          name: "EmployeeList",
          component: () => import("./views/Employee/EmployeeList.vue")
        },
        {
          path: "/EmployeeAdd",
          name: "EmployeeAdd",
          component: () => import("./views/Employee/EmployeeAdd.vue")
        },
        {
          path: "/CustomerList",
          name: "CustomerList",
          component: () => import("./views/Customer/CustomerList.vue")
        },
        {
          path: "/CustomerAdd",
          name: "CustomerAdd",
          component: () => import("./views/Customer/CustomerAdd.vue")
        }
      ]
    },
    { path: "/Login", name: "Login", component: resolve => require(["./views/login/Login.vue"], resolve) }
  ]
})
