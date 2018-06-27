import Vue from "vue"
import Router from "vue-router"

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: "/",
      name: "Default",
      meta: { name: "首页", keepAlive: true },
      component: () => import("./views/default/Default.vue"),
      children: [
        {
          path: "/PasswordChange",
          name: "PasswordChange",
          component: () => import("./views/personCenter/PasswordChange.vue"),
          meta: { name: "修改密码", keepAlive: true }
        },
        {
          path: "/UserInfo",
          name: "UserInfo",
          component: () => import("./views/personCenter/UserInfo.vue")
        },
        {
          path: "/WorkLogList",
          name: "WorkLogList",
          meta: { name: "工作日志", keepAlive: true },
          component: () => import("./views/personCenter/WorkLogList.vue")
        },
        {
          path: "/WorkLogEdit",
          name: "WorkLogEdit",
          meta: { name: "", keepAlive: false },
          component: () => import("./views/personCenter/WorkLogEdit.vue")
        },
        {
          path: "/CompanyList",
          name: "CompanyList",
          meta: { name: "公司列表", keepAlive: true },
          component: () => import("./views/Organization/CompanyList.vue")
        },
        {
          path: "/CompanyAdd",
          name: "CompanyAdd",
          meta: { name: "添加公司", keepAlive: true },
          component: () => import("./views/Organization/CompanyAdd.vue")
        },
        {
          path: "/TeamList",
          name: "TeamList",
          meta: { name: "团队列表", keepAlive: true },
          component: () => import("./views/Organization/TeamList.vue")
        },
        {
          path: "/TeamAdd",
          name: "TeamAdd",
          meta: { name: "添加团队", keepAlive: true },
          component: () => import("./views/Organization/TeamAdd.vue")
        },
        {
          path: "/EmployeeList",
          name: "EmployeeList",
          meta: { name: "业务人员列表", keepAlive: true },
          component: () => import("./views/Employee/EmployeeList.vue")
        },
        {
          path: "/EmployeeAdd",
          name: "EmployeeAdd",
          meta: { name: "添加业务人员", keepAlive: true },
          component: () => import("./views/Employee/EmployeeAdd.vue")
        },
        {
          path: "/CustomerList",
          name: "CustomerList",
          meta: { name: "客户列表", keepAlive: true },
          component: () => import("./views/Customer/CustomerList.vue")
        },
        {
          path: "/CustomerAdd",
          name: "CustomerAdd",
          meta: { name: "添加客户", keepAlive: true },
          component: () => import("./views/Customer/CustomerAdd.vue")
        }
      ]
    },
    { path: "/Login", name: "Login", component: resolve => require(["./views/login/Login.vue"], resolve) },
    { path: "*", name: "404", redirect: "/" }
  ]
})
