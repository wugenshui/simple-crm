<template>
    <div>
        <div class="panel panel-big">
            <div class="panel-header">
                工作日志
            </div>
            <div class="panel-body">
                <Form ref="form" :label-width="80">
                    <FormItem label="日志标题">
                        <Input type="text" v-model="title" />
                    </FormItem>
                    <FormItem label="日志内容">
                        <DatePicker type="date" v-model="content" format="yyyy-MM-dd"></DatePicker>
                    </FormItem>
                </Form>
            </div>
            <div class="panel-footer text-right">
            </div>
        </div>
    </div>
</template>

<script>
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
  }
}
</script>

<style scoped>
</style>