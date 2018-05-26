<template>
    <div>
        <div class="panel panel-big">
            <div class="panel-header">
                工作日志
            </div>
            <div class="panel-body">
                <Form ref="form" :label-width="80">
                    <Row>
                        <Col span="12">
                        <FormItem label="公司名称">
                            <Input type="text" v-model="filtername" />
                        </FormItem>
                        </Col>
                        <Col span="5" offset="7">
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
                    <tr v-for="(data,index) in datas" :key="index">
                        <td class="text-center">{{ index + 1 }}</td>
                        <td>{{ log.title }}</td>
                        <td>{{ log.createTime | time }}</td>
                        <td>
                            <Button type="success" size="small" @click="$router.push('worklogedit?id='+data.id)">编辑</Button>
                            <Button type="error" size="small" @click="del(data.id)">删除</Button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="panel-footer text-right">
                <Page :total="total" :current="pageIndex" :page-size="pageSize" :show-total="true" @on-change="pageChange"></Page>
            </div>
        </div>
        <router-view class="container"></router-view>
    </div>
</template>

<script>
import dayjs from "dayjs"
import common from "../../common.js"
export default {
  data: function() {
    return {
      filtername: "",
      pageIndex: 1,
      pageSize: 10,
      total: 0,
      datas: []
    }
  },
  methods: {
    search() {
      var date = this.filterTime ? dayjs(this.filterTime).format("YYYY-MM-DD") : ""
      var url =
        "worklog?title=" +
        this.filterTitle +
        "&date=" +
        date +
        "&pageIndex=" +
        this.pageIndex +
        "&pageSize=" +
        this.pageSize
      this.$ajax.get(url).then(res => {
        this.logs = res.data.logs
        this.total = res.data.total
      })
    },
    pageChange(index) {
      this.pageIndex = index
      this.search()
    },
    del(id) {
      this.$ajax.delete("worklog/" + id).then(() => {
        this.search()
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