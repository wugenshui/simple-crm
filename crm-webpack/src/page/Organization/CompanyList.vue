<template>
    <div>
        <div class="panel panel-big">
            <div class="panel-header">
                公司列表
            </div>
            <div class="panel-body">
                <Form ref="form" :label-width="80">
                    <i-row>
                        <i-col span="6">
                            <FormItem label="公司名称">
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
                        <th>公司名称</th>
                        <th>法人代表</th>
                        <th>电话</th>
                        <th>公司网站</th>
                        <th>成立时间</th>
                        <th>营业执照</th>
                        <th>操作</th>
                    </tr>
                    <tr v-for="(data,index) in datas" :key="index">
                        <td class="text-center">{{ index + 1 }}</td>
                        <td>{{ data.companyName }}</td>
                        <td>{{ data.owner }}</td>
                        <td>{{ data.phone }}</td>
                        <td>{{ data.website }}</td>
                        <td>{{ data.createTime | date }}</td>
                        <td>{{ data.businessLicence }}</td>
                        <td>
                            <Button type="success" size="small" @click="$router.push('companyadd?id='+data.id)" icon="edit">编辑</Button>
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
      var url = "company?name=" + this.filtername + "&pageIndex=" + this.pageIndex + "&pageSize=" + this.pageSize
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
        this.$ajax.delete("company/" + id).then(() => {
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