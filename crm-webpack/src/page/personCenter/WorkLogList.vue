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
                            <Input type="text" v-model="form.txtTitle">
                            </Input>
                        </FormItem>
                        </Col>
                        <Col span="6">
                        <FormItem prop="txtTime" label="日期">
                            <DatePicker type="date" v-model="form.txtTime"></DatePicker>
                        </FormItem>
                        </Col>
                        <Col span="3" offset="9">
                        <FormItem>
                            <FormItem>
                                <Button type="primary" @click="search">查询</Button>
                            </FormItem>
                        </FormItem>
                        </Col>
                    </Row>

                </Form>
                <table class="table">
                    <colgroup>
                        <col width="60px">
                        <col width="">
                        <col width="">
                    </colgroup>
                    <tr>
                        <th class="text-center">序号</th>
                        <th>标题</th>
                        <th>更新时间</th>
                        <th>操作</th>
                    </tr>
                    <tr v-for="(log,index) in data" :key="index">
                        <td class="text-center">{{ index + 1 }}</td>
                        <td>{{ log.title }}</td>
                        <td>{{ log.createTime | time }}</td>
                        <td>
                            <Button type="success" size="small">编辑</Button>
                            <Button type="error" size="small">删除</Button>
                        </td>
                    </tr>
                </table>
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
        txtTime: "",
        pageIndex:1
      },
      data: []
    }
  },
  methods: {
    search() {
      this.$ajax.get("worklog?title="+this.form.txtTitle+"&date="+this.form.txtTime+"&pageIndex="+this.form.pageIndex).then(res => {
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