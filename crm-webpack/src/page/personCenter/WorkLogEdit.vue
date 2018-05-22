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
                        <editor class="editor" :value="data.content" :setting="editorSetting" @input="(content)=> data.content = content"></editor>
                    </FormItem>
                </Form>
            </div>
            <div class="panel-footer text-right">
            </div>
        </div>
    </div>
</template>

<script>
import editor from "../../components/Editor.vue"

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
      logs: [],
      editorSetting: {
        height: 400
      }
    }
  },
  components: {
    editor: editor
  }
}
</script>

<style scoped>
</style>