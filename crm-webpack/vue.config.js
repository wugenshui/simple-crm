const path = require("path")
function resolve(dir) {
  return path.join(__dirname, dir)
}
module.exports = {
  baseUrl: "/",
  productionSourceMap: false,
  chainWebpack: config => {
    config.resolve.alias
      .set("vue$", "vue/dist/vue.js")
      .set("@", resolve("src"))
      .set("assets", resolve("src/assets"))
      .set("components", resolve("src/components"))
  },
  devServer: {
    //port: 8085, // 端口号
    //host: "localhost",
    //https: false, // https:{type:Boolean}
    open: true //配置自动启动浏览器
  }
}
