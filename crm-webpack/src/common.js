import iview from "iview"

export default {
  error(info) {
    iview.Notice.error({
      title: "错误",
      desc: info,
      duration: 4.5
    })
  }
}
