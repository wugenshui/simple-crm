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
    console.log("mounted")
    const _this = this
    const setting = {
      selector: "#" + _this.id,
      height: 350,
      language: "zh_CN",
      init_instance_callback: function(editor) {
        EDITOR = editor
        console.log("Editor: " + editor.id + " is now initialized.")
        editor.on("input change undo redo", () => {
          var content = editor.getContent()
          _this.$emit("input", content)
        })
      },
      plugins: []
    }
    Object.assign(setting, _this.setting)
    tinymce.init(setting)
  },
  beforeDestroy: function() {
    tinymce.get(this.id).destroy()
  }
}
</script>