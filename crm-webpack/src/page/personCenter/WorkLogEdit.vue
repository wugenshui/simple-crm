<template>
  <div>
    <div class="panel panel-big">
      <div class="panel-header">
        工作日志
      </div>
      <div class="panel-body">
        <Form ref="form" :label-width="80">
          <FormItem label="日志标题">
            <Input type="text" v-model="data.title" />
          </FormItem>
          <FormItem label="日志内容">
            <editor class="editor" :value="data.content" @input="(content)=> data.content = content"></editor>
          </FormItem>
        </Form>
      </div>
      <div class="panel-footer text-left">
        <Button type="primary" @click="save" :disabled="!canSave">保存</Button>
        <Button type="ghost" @click="$router.go(-1)">返回</Button>
      </div>
    </div>
  </div>
</template>

<script>
import editor from "../../components/Editor.vue"
import common from "../../common.js"
export default {
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
      total: 0,
      logs: []
    }
  },
  methods: {
    save() {
      if (this.data.id > 0) {
        this.$ajax.put("worklog", this.data)
      } else {
        this.$ajax.post("worklog", this.data)
      }
    }
  },
  mounted() {
    if (this.$route.query.id != null) {
      this.$ajax.get("worklog/" + this.$route.query.id).then(res => {
        if (res.data != null) {
          this.data = res.data
        }
      })
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