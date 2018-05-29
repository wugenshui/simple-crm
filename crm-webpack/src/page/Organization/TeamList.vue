<template>
    <div>
        <div class="panel panel-big">
            <div class="panel-header">
                团队列表
            </div>
            <div class="panel-body">
                <Form ref="form" :label-width="80">
                    <i-row>
                        <i-col span="6">
                            <FormItem label="团队名称">
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
                            <Button type="success" size="small" @click="$router.push('teamadd?id='+data.id)" icon="edit">编辑</Button>
                            <Button type="error" size="small" @click="del(data.id)" icon="trash-a">删除</Button>
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
      var url = "team?name=" + this.filtername + "&pageIndex=" + this.pageIndex + "&pageSize=" + this.pageSize
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
      this.$ajax.delete("team/" + id).then(() => {
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