<template>
    <div>
        <div class="panel panel-big">
            <div class="panel-header">
                工作日志
            </div>
            <div class="panel-body">
                <el-form ref="form" label-width="80px">
                    <el-row>
                        <el-col :span="6">
                            <el-form-item label="标题">
                                <el-input type="text" size="small" v-model="filterTitle" />
                            </el-form-item>
                        </el-col>
                        <el-col :span="6">
                            <el-form-item label="日期">
                                <el-date-picker type="date" size="small" v-model="filterTime" format="yyyy-MM-dd" value-format="yyyy-MM-dd"></el-date-picker>
                            </el-form-item>
                        </el-col>
                        <el-col :span="6" :offset="6">
                            <el-form-item>
                                <el-form-item>
                                    <el-button type="primary" size="small" @click="search" icon="el-icon-search">查询</el-button>
                                    <el-button type="success" size="small" @click="$router.push('worklogedit')" icon="el-icon-circle-plus-outline">新增</el-button>
                                </el-form-item>
                            </el-form-item>
                        </el-col>
                    </el-row>
                </el-form>
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
                    <tr v-for="(log,index) in logs" :key="index">
                        <td class="text-center">{{ index + 1 }}</td>
                        <td>{{ log.title }}</td>
                        <td>{{ log.createTime | time }}</td>
                        <td>
                            <el-button type="success" size="mini" @click="$router.push('worklogedit?id='+log.id)" icon="el-icon-edit">编辑</el-button>
                            <el-button type="error" size="mini" @click="del(log.id)" icon="el-icon-delete">删除</el-button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="panel-footer text-right">
                <el-pagination :current-page="pageIndex" :total="total" :page-size="pageSize" @current-change="pageChange" background layout="total, prev, pager, next"></el-pagination>
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
      filterTitle: "",
      filterTime: "",
      pageIndex: 1,
      pageSize: 10,
      total: 0,
      logs: []
    }
  },
  methods: {
    search() {
      var url =
        "worklog?title=" +
        this.filterTitle +
        "&date=" +
        this.filterTime +
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
      common.confirm("是否确认删除？", () => {
        this.$ajax.delete("worklog/" + id).then(() => {
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