<template>
    <div>
        <div class="panel panel-big">
            <div class="panel-header">
                团队列表
            </div>
            <div class="panel-body">
                <el-form ref="form" label-width="80px">
                    <el-row>
                        <el-col :span="6">
                            <el-form-item label="团队名称">
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
                        <th>团队名称</th>
                        <th>团队负责人</th>
                        <th>负责人电话</th>
                        <th>团队口号</th>
                        <th>所属公司</th>
                        <th>操作</th>
                    </tr>
                    <tr v-for="(data,index) in datas" :key="index">
                        <td class="text-center">{{ index + 1 }}</td>
                        <td>{{ data.name }}</td>
                        <td>{{ data.leader }}</td>
                        <td>{{ data.leaderPhone }}</td>
                        <td>{{ data.slogan }}</td>
                        <td>{{ data.companyName }}</td>
                        <td>
                            <el-button type="success" size="mini" @click="$router.push('teamadd?id='+data.id)" icon="el-icon-edit">编辑</el-button>
                            <el-button type="danger" size="mini" @click="del(data.id)" icon="el-icon-delete">删除</el-button>
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
export default {
  name: "TeamList",
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
      var url = "team?name=" + this.filtername + "&pageIndex=" + this.pageIndex + "&pageSize=" + this.pageSize
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
        this.$ajax.delete("team/" + id).then(() => {
          this.search()
        })
      })
    }
  },
  activated() {
    this.search()
  }
}
</script>

<style scoped>
</style>