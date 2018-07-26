<template>
    <div>
        <div class="panel panel-big">
            <div class="panel-header">
                员工列表
            </div>
            <div class="panel-body">
                <el-form ref="form" label-width="80px">
                    <el-row>
                        <el-col :span="6">
                            <el-form-item label="员工姓名">
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
                    <colgroup>
                        <col width="60px">
                        <col width="">
                        <col width="">
                    </colgroup>
                    <tr>
                        <th class="text-center">序号</th>
                        <th>姓名</th>
                        <th>所属公司</th>
                        <th>所属团队</th>
                        <th>职位</th>
                        <th>电话</th>
                        <th>入职时间</th>
                        <th>主管</th>
                        <th>操作</th>
                        <th class="text-center">是否启用</th>
                    </tr>
                    <tr v-for="(data,index) in datas" :key="index">
                        <td class="text-center">{{ index + 1 }}</td>
                        <td>{{ data.userName }}</td>
                        <td>{{ data.companyName }}</td>
                        <td>{{ data.teamName }}</td>
                        <td>{{ data.postId | post }}</td>
                        <td>{{ data.phoneNumber }}</td>
                        <td>{{ data.workStartDate | date }}</td>
                        <td>{{ data.supervisor }}</td>
                        <td>
                            <el-button type="success" size="mini" @click="$router.push('employeeadd?id='+data.id)" icon="el-icon-edit">编辑</el-button>
                            <el-button type="error" size="mini" @click="del(data.id)" icon="el-icon-delete">删除</el-button>
                        </td>
                        <td class="text-center">
                            <el-switch size="default" v-model="data.isEnable" @change="isEnableChange(data)"></el-switch>
                        </td>
                    </tr>
                </table>
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
  name: "EmployeeList",
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
      var url = "user?name=" + this.filtername + "&pageIndex=" + this.pageIndex + "&pageSize=" + this.pageSize
      this.$ajax.get(url).then(res => {
        this.datas = res.data.data
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
    },
    isEnableChange(data) {
      this.$ajax.put("userenable", data)
    }
  },
  mounted() {
    this.search()
  }
}
</script>

<style scoped>
</style>