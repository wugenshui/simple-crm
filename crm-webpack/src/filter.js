import Vue from "vue"
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
