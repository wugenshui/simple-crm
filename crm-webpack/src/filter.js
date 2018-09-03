import Vue from "vue/dist/vue.js"
import dayjs from "dayjs"

Vue.filter("date", value => {
  return dayjs(value).format("YYYY-MM-DD")
})

Vue.filter("time", value => {
  return dayjs(value).format("YYYY-MM-DD HH:mm:ss")
})

const posts = ["业务", "主管", "经理"]
Vue.filter("post", value => {
  return value < posts.length ? posts[value] : ""
})

const customerType = ["客户单子", "员工单子", "商家单子", "商城单子"]
Vue.filter("customerType", value => {
  return value < customerType.length ? customerType[value] : ""
})

const customerState = ["未确认", "已确认", "已分配", "已联系", "已完成", "已作废"]
Vue.filter("customerState", value => {
  return value < customerState.length ? customerState[value] : ""
})

export { posts, customerType, customerState }
