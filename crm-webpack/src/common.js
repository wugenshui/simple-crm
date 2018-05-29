import iview from "iview"

export default {
  error(msg) {
    iview.Notice.error({
      title: "错误",
      desc: msg,
      duration: 4.5
    })
  },
  info(msg) {
    iview.Notice.info({
      title: "信息",
      desc: msg,
      duration: 4.5
    })
  },
  confirm(msg, onOk, onCancel) {
    iview.Modal.confirm({
      title: "确认",
      content: msg,
      onOk,
      onCancel
    })
  }
}
