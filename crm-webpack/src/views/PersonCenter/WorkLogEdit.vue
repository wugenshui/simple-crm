<template>
  <div>
    <div class="panel panel-big">
      <div class="panel-header">
        工作日志
      </div>
      <div class="panel-body">
        <el-form ref="form" label-width="80px">
          <el-form-item label="日志标题">
            <el-input type="text" v-model="data.title" />
          </el-form-item>
          <el-form-item label="日志内容">
            <editor class="editor" :value="data.content" @input="(content)=>data.content=content"></editor>
          </el-form-item>
        </el-form>
      </div>
      <div class="panel-footer text-left">
        <el-button type="primary" @click="save" :disabled="!canSave">保存</el-button>
        <el-button type="ghost" @click="$router.go(-1)">返回</el-button>
      </div>
    </div>
  </div>
</template>

<script>
import editor from "../../components/Editor.vue"
import common from "../../common.js"
import dayjs from "dayjs"
export default {
  name: "WorkLogEdit",
  data: function() {
    return {
      data: {
        title: "",
        content: ""
      },
      filterTitle: "",
      filterTime: "",
      pageIndex: 1,
      pageSize: 10,
      total: 0
    }
  },
  methods: {
    save() {
      if (this.data.id > 0) {
        this.$ajax.put("worklog", this.data).then(res => {
          if (res.data.state) {
            this.$router.go(-1)
          }
        })
      } else {
        this.$ajax.post("worklog", this.data).then(res => {
          if (res.data.state) {
            this.$router.go(-1)
          }
        })
      }
    }
  },
  mounted() {
    if (this.$route.query.id != null) {
      this.$ajax.get("worklog/" + this.$route.query.id).then(res => {
        if (res.data.data) {
          this.data = res.data.data
        }
      })
    } else {
      this.data.title = dayjs().format("YYYY-MM-DD") + " 工作日志"
    }
  },
  computed: {
    canSave() {
      return this.data.title.length > 0 && this.data.content.length > 0
    }
  },
  components: {
    editor: editor
  }
}
</script>

<style scoped>
</style>