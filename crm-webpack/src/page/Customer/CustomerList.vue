<template>
    <div>
        <div class="panel panel-big">
            <div class="panel-header">
                员工列表
            </div>
            <div class="panel-body">
                <Tabs value="0" type="card" v-model="filtertype" @tab-click="search">
                    <TabPane :label="tab.label" :name="tab.name" v-for="tab in tabs" :key="tab.name">
                        <Form ref="form" :label-width="80">
                            <i-row>
                                <i-col span="6">
                                    <FormItem label="员工姓名">
                                        <Input type="text" v-model="filtername" />
                                    </FormItem>
                                </i-col>
                                <i-col span="4" offset="14">
                                    <FormItem>
                                        <FormItem>
                                            <Button type="primary" @click="search" icon="search">查询</Button>
                                        </FormItem>
                                    </FormItem>
                                </i-col>
                            </i-row>
                        </Form>
                        <table class="table">
                            <tr>
                                <th class="text-center">表单号</th>
                                <th>更新时间</th>
                                <th>姓名</th>
                                <th>手机</th>
                                <th>QQ</th>
                                <th>邮箱</th>
                                <th>客户类型</th>
                                <th>状态</th>
                                <th>合同附件</th>
                                <th>操作</th>
                            </tr>
                            <tr v-for="(data,index) in datas" :key="index">
                                <td class="text-center">{{ data.id }}</td>
                                <td>{{ data.createTime | time }}</td>
                                <td>{{ data.customerName }}</td>
                                <td>{{ data.customerPhone }}</td>
                                <td>{{ data.customerQQ }}</td>
                                <td>{{ data.mail }}</td>
                                <td>{{ data.customerType | customerType }}</td>
                                <td>{{ data.state | customerState }}</td>
                                <td>{{ data.contract }}</td>
                                <td>
                                    <Button type="success" size="small" @click="$router.push('employeeadd?id='+data.id)" icon="edit">编辑</Button>
                                    <Button type="error" size="small" @click="del(data.id)" icon="trash-a">删除</Button>
                                </td>
                            </tr>
                        </table>
                    </TabPane>
                </Tabs>
            </div>
            <div class="panel-footer text-right">
                <Page :total="total" :current="pageIndex" :page-size="pageSize" :show-total="true" @on-change="pageChange"></Page>
            </div>
        </div>
        <router-view class="container"></router-view>
    </div>
</template>

<script>
import common from "../../common.js"
export default {
  data: function() {
    return {
      tabs: [
        { label: "客户列表", name: -1 },
        { label: "未确认用户", name: 0.1 },
        { label: "已确认用户", name: 1 },
        { label: "已联系客户", name: 3 },
        { label: "已完成客户", name: 4 }
      ],
      filtername: "",
      filtertype: -1,
      pageIndex: 1,
      pageSize: 10,
      total: 0,
      datas: []
    }
  },
  methods: {
    search() {
      var url =
        "customer?name=" +
        this.filtername +
        "&type=" +
        this.filtertype +
        "&pageIndex=" +
        this.pageIndex +
        "&pageSize=" +
        this.pageSize
      this.$ajax.get(url).then(res => {
        this.datas = res.data.list
        this.total = res.data.total
      })
    },
    pageChange(index) {
      this.pageIndex = index
      this.search()
    },
    del(id) {
      common.confirm("是否确认删除？", () => {
        this.$ajax.delete("user/" + id).then(() => {
          this.search()
        })
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