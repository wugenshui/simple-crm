// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from "vue"
import App from "./App"
import router from "./router.js"
import Axios from "axios"
import VurRouter from "vue-router"
import common from "./common.js"
import store from "./store.js"
import "vue2-animate/dist/vue2-animate.min.css"
import "./filter.js"
import ElementUI from "element-ui"
import "element-ui/lib/theme-chalk/index.css"
import VCharts from "v-charts"
// import "./assets/iconfont/iconfont.css" 先使用外链

Vue.config.productionTip = false
Vue.use(VurRouter)
Vue.use(ElementUI)
Vue.use(VCharts)

Vue.prototype.$ajax = Axios
Axios.defaults.baseURL = "http://localhost:10086/api"
let loading = []
Axios.interceptors.request.use(function(config) {
  if (loading.length <= 0) {
    loading.push(
      ElementUI.Loading.service({
        lock: true,
        text: "加载中...",
        spinner: "el-icon-loading",
        background: "rgba(0, 0, 0, 0.7)",
        target: document.querySelector(".main")
      })
    )
  }
  if (store != null && store.state.token != null) {
    config.headers.Token = store.state.token
  }
  return config
})
Axios.interceptors.response.use(
  response => {
    if (loading.length > 0) {
      loading[0].close()
      loading.length--
    }
    // 特殊的AjaxResult 返回格式处理
    if (response.data != null && response.data.state != null) {
      if (response.data.state === false) {
        common.error(response.data.error)
      } else if (typeof response.data.data == "string") {
        common.info(response.data.data)
      }
    }
    return response
  },
  error => {
    if (loading.length > 0) {
      loading[0].close()
      loading.length--
    }
    if (error.response != null) {
      if (error.response.status == 401) {
        // 权限过期，处理
        router.push("login")
      } else if (error.response.data.error_description != null) {
        common.error(error.response.data.error_description)
      } else if (error.response != null && error.response.data != null && error.response.data.Message != null) {
        common.error(error.response.data.Message)
      }
    } else if (error.message != null) {
      common.error(error.message)
    }
    return Promise.reject(error)
  }
)

/* eslint-disable no-new */
new Vue({
  el: "#app",
  router,
  store,
  components: { App },
  template: "<App/>"
})
