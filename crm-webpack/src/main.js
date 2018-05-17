// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from "vue"
import App from "./App"
import router from "./router"
import Axios from "axios"
import iview from "iview"
import VurRouter from "vue-router"
import "iview/dist/styles/iview.css"
import "./style/common.css"
import common from "./common.js"
import store from "./store.js"
import "vue2-animate/dist/vue2-animate.min.css"

Vue.config.productionTip = false
Vue.use(VurRouter)
Vue.use(iview)

Vue.prototype.$ajax = Axios
Axios.defaults.baseURL = "http://localhost:10086/api"
Axios.interceptors.request.use(function(config) {
  iview.Spin.show()
  if (store != null && store.state.token != null) {
    config.headers.Token = store.state.token
  }
  return config
})
Axios.interceptors.response.use(
  response => {
    iview.Spin.hide()
    if (response.data.state != null && response.data.state === false && response.data.msg != null) {
      common.error(response.data.msg)
    }
    return response
  },
  error => {
    iview.Spin.hide()
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
