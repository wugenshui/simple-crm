<template>
  <div>
    <!-- 客户列表 -->
    <div class="panel panel-big">
      <div class="panel-header">客户列表</div>
      <div class="panel-body">
        <el-form ref="form" label-width="80px">
          <el-row>
            <el-col :span="6">
              <el-form-item label="客户姓名">
                <el-input type="text" size="small" v-model="filtername" clearable/>
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
        <el-tabs v-model="filterstate" @tab-click="tabChange">
          <el-tab-pane :label="tab.label" :name="tab.state" v-for="tab in tabs" :key="tab.name">
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
                <th v-if="tab.showFile">合同附件</th>
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
                <td v-if="tab.showFile">
                  <a :href="basePath+'/download?file='+data.contract">{{data.contract}}</a>
                </td>
                <td>
                  <el-button v-if="tab.canSearch" type="info" size="mini">详情</el-button>
                  <el-button
                    v-if="tab.canEdit"
                    @click="$router.push('customeradd?id='+data.id)"
                    type="success"
                    size="mini"
                  >编辑</el-button>
                  <el-button v-if="tab.canDel" type="danger" size="mini" @click="del(data.id)">作废</el-button>
                  <el-button
                    v-if="tab.canConfirm"
                    @click="showOperate(data,1)"
                    type="primary"
                    size="mini"
                  >确认</el-button>
                  <el-button
                    v-if="tab.canAllot"
                    @click="showOperate(data,2)"
                    type="primary"
                    size="mini"
                  >分配</el-button>
                  <el-button
                    v-if="tab.canFollow"
                    @click="showOperate(data,3)"
                    type="primary"
                    size="mini"
                  >跟进</el-button>
                  <el-button
                    v-if="tab.canFinish"
                    @click="showOperate(data,4)"
                    type="primary"
                    size="mini"
                  >完成</el-button>
                </td>
              </tr>
            </table>
          </el-tab-pane>
        </el-tabs>
      </div>
      <div class="panel-footer text-right">
        <el-pagination
          :current-page="pageIndex"
          :total="total"
          :page-size="pageSize"
          show-total
          @current-change="pageChange"
          background
          layout="total, prev, pager, next"
        ></el-pagination>
      </div>
    </div>
    <!-- 客户操作 -->
    <el-dialog :title="winOperateTitle" :visible.sync="winOperateVisible" width="30%">
      <el-form ref="form" label-width="80px">
        <el-form-item label="表单ID">
          <el-input v-model="currentCustomer.id" disabled></el-input>
        </el-form-item>
        <el-form-item label="客户姓名">
          <el-input v-model="currentCustomer.customerName" disabled></el-input>
        </el-form-item>
        <el-form-item label="客户电话">
          <el-input v-model="currentCustomer.customerPhone" disabled></el-input>
        </el-form-item>
        <el-form-item label="备注">
          <el-input v-model="customerOperate.remark" clearable></el-input>
        </el-form-item>
        <el-form-item v-if="customerOperate.state==2" label="分配客服">
          <el-select v-model.number="customerOperate.assigneeId" clearable>
            <el-option v-for="u in users" :value="u.id" :key="u.id" :label="u.userName"></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="winOperateVisible = false">取 消</el-button>
        <el-button type="primary" @click="saveOperate">确 定</el-button>
      </span>
    </el-dialog>
    <router-view class="container"></router-view>
  </div>
</template>

<script>
import common from "../../common.js";
export default {
  name: "CustomerList",
  data: function() {
    return {
      tabs: [
        { label: "客户列表", state: "-1", showFile: true, canSearch: true },
        {
          label: "未确认用户",
          state: "0",
          canSearch: true, // 查询
          canDel: true, // 作废
          canEdit: true, // 编辑
          canConfirm: true // 确认
        },
        {
          label: "已确认用户",
          state: "1",
          canSearch: true,
          canAllot: true, // 分配
          canFollow: true // 跟进
        },
        {
          label: "已联系客户",
          state: "3",
          canSearch: true,
          canFollow: true,
          canFinish: true
        },
        { label: "已完成客户", state: "4", canSearch: true }
      ],
      filtername: "",
      filterstate: "0", // 当前选中的tab state
      pageIndex: 1,
      pageSize: 10,
      total: 0,
      datas: [],
      basePath: this.$ajax.defaults.baseURL,
      users: [], // 员工列表
      winOperateVisible: false, // 客户操作窗口相关
      winOperateTitle: "",
      currentCustomer: {},
      customerOperate: {
        customerId: 0,
        assigneeId: 0,
        assigneeName: "",
        remark: "",
        state: 0
      }
    };
  },
  methods: {
    search() {
      var url =
        "customer?name=" +
        this.filtername +
        "&state=" +
        this.filterstate +
        "&pageIndex=" +
        this.pageIndex +
        "&pageSize=" +
        this.pageSize;
      this.$ajax.get(url).then(res => {
        this.datas = res.data.data;
        this.total = res.data.total;
      });
    },
    tabChange() {
      this.pageIndex = 1;
      this.search();
    },
    pageChange(index) {
      this.pageIndex = index;
      this.search();
    },
    del(id) {
      common.confirm("是否确认删除？", () => {
        this.$ajax.delete("customer/" + id).then(() => {
          this.search();
        });
      });
    },
    showOperate(customer, state) {
      switch (state) {
        case 1:
          this.winOperateTitle = "客户确认";
          break;
        case 2:
          this.winOperateTitle = "客户分配";
          break;
        case 3:
          this.winOperateTitle = "客户跟进";
          break;
        case 4:
          this.winOperateTitle = "完成交易";
          break;
        default:
          this.winOperateTitle = "未知操作";
          break;
      }
      this.currentCustomer = customer;
      this.customerOperate = {
        customerId: customer.id,
        assigneeId: 0,
        assigneeName: "",
        remark: "",
        state: state
      };
      if (state == 2) {
        this.customerOperate.assigneeId = this.$store.state.user.id;
      }
      this.winOperateVisible = true;
    },
    saveOperate() {
      this.$ajax.post("customerOperate", this.customerOperate).then(res => {
        if (res.data.state) {
          this.search();
        }
      });
      this.winOperateVisible = false;
    }
  },
  activated() {
    this.search();
    this.$ajax.get("user").then(res => {
      this.users = res.data.data;
    });
  }
};
</script>

<style scoped>
</style>