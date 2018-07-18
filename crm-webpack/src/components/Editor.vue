<template>
  <textarea :id="id" :value="value"></textarea>
</template>

<script>
// Import TinyMCE
import tinymce from "tinymce"

const INIT = 0
const CHANGED = 2
var EDITOR = null
export default {
  name: "Editor",
  props: {
    value: {
      type: String,
      required: true
    },
    setting: {}
  },
  watch: {
    value: function(val) {
      if (this.status == INIT || tinymce.activeEditor.getContent() != val) {
        tinymce.activeEditor.setContent(val)
      }
      this.status = CHANGED
    }
  },
  data: function() {
    return {
      status: INIT,
      id: "editor-" + new Date().getMilliseconds()
    }
  },
  methods: {},
  mounted: function() {
    const setting = {
      selector: "#" + this.id,
      height: 350,
      language: "zh_CN",
      init_instance_callback: editor => {
        EDITOR = editor
        console.log("Editor: " + editor.id + " is now initialized.")
        editor.on("input change undo redo", () => {
          var content = editor.getContent()
          this.$emit("input", content)
        })
      },
      plugins: "autolink print preview"
    }
    Object.assign(setting, this.setting)
    tinymce.init(setting)
  },
  beforeDestroy: function() {
    tinymce.get(this.id).destroy()
  }
}
</script>

<style>
* {
  border: 0;
  padding: 0;
  margin: 0;
  background: 50% 50% no-repeat;
  text-decoration: none;
  color: inherit;
  box-sizing: border-box;
  font-weight: 400;
}
:focus {
  outline: 0;
}
b,
b *,
strong,
strong * {
  font-weight: 700;
}
ol,
ul {
  list-style: none;
}
button,
input,
input:not([type]),
input[type="color"],
input[type="text"],
input[type="time"],
input[type="url"],
input[type="week"],
input[type="button"],
input[type="reset"],
input[type="submit"],
input[type="date"],
input[type="datetime"],
input[type="datetime-local"],
input[type="email"],
input[type="month"],
input[type="number"],
input[type="password"],
input[type="search"],
input[type="tel"],
pre,
select,
textarea {
  font: inherit;
}
.codepen body {
  margin: 10px 0 0;
}
.codepen body textarea {
  display: none;
}
.mce-container textarea {
  display: inline-block !important;
}
.mce-content-body {
  font-family: Lato !important;
  font-size: 14px;
  color: #626262;
  padding: 0 25px 25px;
}
.mce-content-body h1,
.mce-content-body h2,
.mce-content-body h3,
.mce-content-body h4,
.mce-content-body h5,
.mce-content-body h6 {
  font-family: aileron;
  font-weight: 200;
  line-height: 1.4em;
  margin: 25px 0 15px;
}
.mce-content-body * {
  background-position: initial;
}
.mce-content-body h1 {
  font-size: 34px;
}
.mce-content-body h2 {
  font-size: 30px;
}
.mce-content-body h3 {
  font-size: 26px;
}
.mce-content-body h4 {
  font-size: 22px;
}
.mce-content-body h5 {
  font-size: 18px;
}
.mce-content-body h6 {
  font-size: 14px;
}
.mce-content-body p {
  margin: 25px 0;
}
.mce-content-body ol,
.mce-content-body ul {
  margin-left: 15px;
  list-style-position: outside;
  margin-bottom: 20px;
}
.mce-content-body ol li,
.mce-content-body ul li {
  margin-left: 10px;
  margin-bottom: 10px;
  color: #626262;
}
.mce-content-body ul {
  list-style-type: disc;
}
.mce-content-body ol {
  list-style-type: decimal;
}
.mce-content-body a[href] {
  text-decoration: underline;
}
.mce-content-body table {
  width: 100%;
  border-spacing: 0;
  border-collapse: separate;
  border: 1px solid #aaa;
}
.mce-content-body table tr:nth-child(even) {
  background: #fafafa;
}
.mce-content-body table caption,
.mce-content-body table td,
.mce-content-body table th {
  padding: 15px 7px;
  font: inherit;
}
.mce-content-body table td,
.mce-content-body table th {
  border: 1px solid #aaa;
  border-collapse: collapse;
}
.mce-content-body table th {
  font-weight: 400;
  color: #6e6e6e;
  background-position: 100% 100%;
  background-size: 2px 10px;
  background-repeat: no-repeat;
}
.mce-content-body table th:last-child {
  background: 0 0;
}
.mce-content-body hr {
  border-top: 2px solid #bbb;
}
</style>