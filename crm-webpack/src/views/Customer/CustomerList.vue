<template>
    <div>
        <div class="panel panel-big">
            <div class="panel-header">
                客户列表
            </div>
            <div class="panel-body">
                <el-tabs v-model="filtertype" @tab-click="tabChange">
                    <el-tab-pane :label="tab.label" :name="tab.name" v-for="tab in tabs" :key="tab.name">
                        <el-form ref="form" label-width="80px">
                            <el-row>
                                <el-col :span="6">
                                    <el-form-item label="客户姓名">
                                        <el-input type="text" size="small" v-model="filtername" />
                                    </el-form-item>
                                </el-col>
                                <el-col :span="4" :offset="14">
                                    <el-form-item>
                                        <el-form-item>
                                            <el-button type="primary" size="small" @click="search" icon="el-icon-search">查询</el-button>
                                        </el-form-item>
                                    </el-form-item>
                                </el-col>
                            </el-row>
                        </el-form>
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
                                <td> <a :href="basePath+'/download?file='+data.contract">{{data.contract}}</a></td>
                                <td>
                                    <el-button type="success" size="mini" @click="$router.push('customeradd?id='+data.id)" icon="el-icon-edit">编辑</el-button>
                                    <el-button type="error" size="mini" @click="del(data.id)" icon="el-icon-delete">删除</el-button>
                                </td>
                            </tr>
                        </table>
                    </el-tab-pane>
                </el-tabs>
            </div>
            <div class="panel-footer text-right">
                <el-pagination :current-page="pageIndex" :total="total" :page-size="pageSize" :show-total="true" @current-change="pageChange" background layout="total, prev, pager, next"></el-pagination>
            </div>
        </div>
        <router-view class="container"></router-view>
    </div>
</template>

<script>
import common from "../../common.js"
export default {
  name: "CustomerList",
  data: function() {
    return {
      tabs: [
        { label: "客户列表", name: "-1" },
        { label: "未确认用户", name: "0" }, // name为0不行
        { label: "已确认用户", name: "1" },
        { label: "已联系客户", name: "3" },
        { label: "已完成客户", name: "4" }
      ],
      filtername: "",
      filtertype: "-1",
      pageIndex: 1,
      pageSize: 10,
      total: 0,
      datas: [],
      basePath:this.$ajax.defaults.baseURL
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
        this.datas = res.data.data
        this.total = res.data.total
      })
    },
    tabChange() {
      this.pageIndex = 1
      this.search()
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
    },
    download(file) {
        this.$ajax.get("download?file=" + file)
    }
  },
  activated () {
    this.search()
  }
}
</script>

<style scoped>
</style>