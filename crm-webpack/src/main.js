// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from "vue"
import App from "./App"
import router from "./router.js"
import Axios from "axios"
import iview from "iview"
import VurRouter from "vue-router"
import "iview/dist/styles/iview.css"
import "./style/common.css"
import common from "./common.js"
import store from "./store.js"
import "vue2-animate/dist/vue2-animate.min.css"
import "./filter.js"
import ElementUI from "element-ui"
import "element-ui/lib/theme-chalk/index.css"

Vue.config.productionTip = false
Vue.use(VurRouter)
Vue.use(ElementUI)

Vue.prototype.$ajax = Axios
Axios.defaults.baseURL = "http://localhost:10086/api"
let loading
Axios.interceptors.request.use(function(config) {
  loading = ElementUI.Loading.service({
    lock: true,
    text: "加载中...",
    spinner: "el-icon-loading",
    background: "rgba(0, 0, 0, 0.7)",
    target: document.querySelector(".main")
  })
  if (store != null && store.state.token != null) {
    config.headers.Token = store.state.token
  }
  return config
})
Axios.interceptors.response.use(
  response => {
    Vue.nextTick(() => {
      loading.close()
    })
    // 特殊的AjaxResult 返回格式处理
    if (response.data != null && response.data.state != null && typeof response.data.msg == "string") {
      if (response.data.state === false) {
        common.error(response.data.msg)
      } else {
        common.info(response.data.msg)
      }
    }
    return response
  },
  error => {
    Vue.nextTick(() => {
      loading.close()
    })
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
