<template>
    <div>
        <div class="panel panel-big">
            <div class="panel-header">
                工作日志
            </div>
            <div class="panel-body">
                <Form ref="form" :model="form" :label-width="80">
                    <Row>
                        <Col span="6">
                        <FormItem prop="txtTitle" label="标题">
                            <Input type="text" v-model="form.txtTitle" placeholder="Username">
                            </Input>
                        </FormItem>
                        </Col>
                        <Col span="6">
                        <FormItem prop="txtTime" label="时间">
                            <Input type="date" v-model="form.txtTime" placeholder="Password">
                            </Input>
                        </FormItem>
                        </Col>
                        <Col span="4" offset="8">
                        <FormItem>
                            <FormItem>
                                <Button type="primary" @click="search">查询</Button>
                            </FormItem>
                        </FormItem>
                        </Col>
                    </Row>

                </Form>
                <Table :columns="columns" :data="data"></Table>
            </div>
            <div class="panel-footer">
                分页
            </div>
        </div>
    </div>
</template>

<script>
import common from "../../common.js"
export default {
  data: function() {
    return {
      form: {
        txtTitle: "",
        txtTime: ""
      },
      columns: [
        {
          title: "标题",
          key: "title"
        },
        {
          title: "日期",
          key: "createTime"
        }
      ],
      data: []
    }
  },
  methods: {
    search() {
      this.$ajax.get("worklog", this.form).then(res => {
        this.data = res.data
      })
    }
  },
  mounted() {
    this.search()
  }
}
</script>

<style scoped>

</style>