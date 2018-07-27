import { Notification, MessageBox } from "element-ui"

export default {
  /** JSDoc
   * 失败提示消息
   * @param {string} msg - 提示消息
   */
  error(msg) {
    Notification.error({
      title: "错误",
      message: msg,
      duration: 4500
    })
  },
  /**
   * 成功提示消息
   * @param {string} msg 提示消息
   */
  info(msg) {
    Notification.success({
      title: "信息",
      message: msg,
      duration: 4500
    })
  },
  /**
   * 弹出框
   * @param {string} msg - 弹出消息
   * @param {function} onOk - 成功执行方法
   * @param {function} onCancel - 取消、关闭执行方法，没有则不写
   */
  confirm(msg, onOk, onCancel) {
    MessageBox.confirm(msg, "确认", {})
      .then(() => {
        onOk()
      })
      .catch(() => {
        if (onCancel) {
          onCancel()
        }
      })
  }
}
