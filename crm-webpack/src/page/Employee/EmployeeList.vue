<template>
    <div>
        <div class="panel panel-big">
            <div class="panel-header">
                员工列表
            </div>
            <div class="panel-body">
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
                                    <Button type="primary" @click="search">查询</Button>
                                </FormItem>
                            </FormItem>
                        </i-col>
                    </i-row>
                </Form>
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
                        <th>主管</th>
                        <th>电话</th>
                        <th class="text-center">是否启用</th>
                        <th>入职时间</th>
                        <th>操作</th>
                    </tr>
                    <tr v-for="(data,index) in datas" :key="index">
                        <td class="text-center">{{ index + 1 }}</td>
                        <td>{{ data.userName }}</td>
                        <td>{{ data.companyName }}</td>
                        <td>{{ data.teamName }}</td>
                        <td>{{ data.postId | post }}</td>
                        <td>{{ data.supervisor }}</td>
                        <td>{{ data.phoneNumber }}</td>
                        <td class="text-center">
                            <i-switch size="default" v-model="data.ssEnable"></i-switch>
                        </td>
                        <td>{{ data.workStartDate | date }}</td>
                        <td>
                            <Button type="success" size="small" @click="$router.push('teamadd?id='+data.id)">编辑</Button>
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
      var url = "user?name=" + this.filtername + "&pageIndex=" + this.pageIndex + "&pageSize=" + this.pageSize
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
      this.$ajax.delete("user/" + id).then(() => {
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