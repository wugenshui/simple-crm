<template>
  <div>
    <div class="panel panel-big">
      <div class="panel-header">
        业务人员资料
      </div>
      <div class="panel-body">
        <el-form ref="form" label-width="100px" :model="data" :rules="rules">
          <el-form-item label="姓名" prop="userName">
            <el-input type="text" v-model="data.userName" />
          </el-form-item>
          <el-form-item label="登录名" prop="loginName">
            <el-input type="text" v-model="data.loginName" />
          </el-form-item>
          <el-form-item label="密码" prop="password">
            <el-input type="password" v-model="data.password" :readonly="data.id > 0" />
          </el-form-item>
          <el-form-item label="所属公司" prop="companyId">
            <el-select v-model.number="data.companyId">
              <el-option v-for="c in companys" :value="c.id" :key="c.id" :label="c.companyName"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="所属团队" prop="teamId">
            <el-select v-model.number="data.teamId">
              <el-option v-for="t in teams" :value="t.id" :key="t.id" :label="t.name"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="职位" prop="postId">
            <el-select v-model.number="data.postId">
              <el-option v-for="p in posts" :value="p.value" :key="p.value" :label="p.label"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="电话" prop="phoneNumber">
            <el-input type="text" v-model="data.phoneNumber" />
          </el-form-item>
          <el-form-item label="入职时间" prop="workStartDate">
            <el-date-picker type="date" v-model="data.workStartDate" value-format="yyyy-MM-dd"></el-date-picker>
          </el-form-item>
          <el-form-item label="主管" prop="supervisorId">
            <el-select v-model.number="data.supervisorId" clearable>
              <el-option v-for="u in users" :value="u.id" :key="u.id" :label="u.userName"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="是否启用" prop="isEnable">
            <el-switch size="default" v-model="data.isEnable"></el-switch>
          </el-form-item>
        </el-form>
      </div>
      <div class="panel-footer text-left">
        <el-button type="primary" @click="save">保存</el-button>
        <el-button type="ghost" @click="reset">重置</el-button>
        <el-button v-if="$route.query.id" type="ghost" @click="$router.go(-1)">返回</el-button>
      </div>
    </div>
  </div>
</template>

<script>
import common from "../../common.js"
export default {
  name: "EmployeeAdd",
  data: function() {
    return {
      data: {
        id: 0,
        userName: "",
        loginName: "",
        password: "",
        companyId: null,
        teamId: null,
        postId: null,
        phoneNumber: "",
        workStartDate: "",
        supervisor: "",
        isEnable: true
      },
      rules: {
        userName: [{ required: true, message: "姓名不能为空!", trigger: "blur" }],
        loginName: [{ required: true, message: "登录名不能为空!", trigger: "blur" }],
        password: [{ required: true, message: "密码不能为空!", trigger: "blur" }],
        companyId: [{ required: true, type: "number", message: "所属公司不能为空!", trigger: "blur" }],
        teamId: [{ required: true, type: "number", message: "所属团队不能为空!", trigger: "blur" }],
        postId: [{ required: true, type: "number", message: "职位不能为空!", trigger: "blur" }],
        phoneNumber: [{ required: true, message: "电话不能为空!", trigger: "blur" }],
        workStartDate: [{ required: true, message: "入职时间不能为空!", trigger: "change" }],
        supervisorId: [{ required: true, type: "number", message: "主管不能为空!", trigger: "blur" }]
      },
      posts: [{ value: 0, label: "业务" }, { value: 1, label: "主管" }, { value: 2, label: "经理" }],
      companys: [],
      teams: [],
      users: [],
      filterTitle: "",
      filterTime: "",
      pageIndex: 1,
      pageSize: 10,
      total: 0
    }
  },
  methods: {
    save() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.data.id > 0) {
            this.$ajax.put("user", this.data).then(res => {
              if (res.data.state) {
                this.$router.go(-1)
              }
            })
          } else {
            this.$ajax.post("user", this.data).then(res => {
              if (res.data.state) {
                this.$refs["form"].resetFields()
              }
            })
          }
        }
      })
    },
    reset() {
      this.$refs["form"].resetFields()
    }
  },
  mounted() {
    this.$ajax.get("company").then(res => {
      this.companys = res.data.data
      if (this.$route.query.id != null) {
        this.$ajax.get("user/" + this.$route.query.id).then(res => {
          this.data = res.data.data
        })
      }
    })
    this.$ajax.get("team").then(res => {
      this.teams = res.data.data
    })
    this.$ajax.get("user").then(res => {
      this.users = res.data.data
    })
  }
}
</script>

<style scoped>
</style>