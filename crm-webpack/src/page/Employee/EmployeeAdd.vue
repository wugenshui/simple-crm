<template>
  <div>
    <div class="panel panel-big">
      <div class="panel-header">
        业务人员资料
      </div>
      <div class="panel-body">
        <Form ref="form" :label-width="100" :model="data" :rules="rules">
          <FormItem label="姓名" prop="userName">
            <Input type="text" v-model="data.userName" />
          </FormItem>
          <FormItem label="登录名" prop="loginName">
            <Input type="text" v-model="data.loginName" />
          </FormItem>
          <FormItem label="密码" prop="password">
            <Input type="password" v-model="data.password" :readonly="data.id > 0" />
          </FormItem>
          <FormItem label="所属公司" prop="companyId">
            <Select v-model.number="data.companyId">
              <Option v-for="c in companys" :value="c.id" :key="c.id">{{ c.companyName }}</Option>
            </Select>
          </FormItem>
          <FormItem label="所属团队" prop="teamId">
            <Select v-model.number="data.teamId">
              <Option v-for="t in teams" :value="t.id" :key="t.id">{{ t.name }}</Option>
            </Select>
          </FormItem>
          <FormItem label="所属团队" prop="teamId">
            <Select v-model.number="data.teamId">
              <Option v-for="t in teams" :value="t.id" :key="t.id">{{ t.name }}</Option>
            </Select>
          </FormItem>
          <FormItem label="职位" prop="postId">
            <Select v-model.number="data.postId">
              <Option v-for="p in posts" :value="p.value" :key="p.value">{{ p.label }}</Option>
            </Select>
          </FormItem>
          <FormItem label="电话" prop="phoneNumber">
            <Input type="text" v-model="data.phoneNumber" />
          </FormItem>
          <FormItem label="入职时间" prop="workStartDate">
            <DatePicker type="date" v-model="data.workStartDate"></DatePicker>
          </FormItem>
          <FormItem label="主管" prop="supervisorId">
            <Select v-model.number="data.supervisorId" clearable>
              <Option v-for="u in users" :value="u.id" :key="u.id">{{ u.userName }}</Option>
            </Select>
          </FormItem>
          <FormItem label="是否启用" prop="isEnable">
            <i-switch size="default" v-model="data.isEnable"></i-switch>
          </FormItem>
        </Form>
      </div>
      <div class="panel-footer text-left">
        <Button type="primary" @click="save">保存</Button>
        <Button type="ghost" @click="reset">重置</Button>
        <Button v-if="$route.query.id" type="ghost" @click="$router.go(-1)">返回</Button>
      </div>
    </div>
  </div>
</template>

<script>
import common from "../../common.js"
export default {
  data: function() {
    return {
      data: {
        id: 0,
        userName: "",
        loginName: "",
        password: "",
        companyId: 0,
        teamId: 0,
        postId: 0,
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
        workStartDate: [{ required: true, type: "date", message: "入职时间不能为空!", trigger: "change" }],
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
      this.companys = res.data
      if (this.$route.query.id != null) {
        this.$ajax.get("user/" + this.$route.query.id).then(res => {
          if (res.data != null) {
            this.data = res.data
          }
        })
      }
    })
    this.$ajax.get("team").then(res => {
      this.teams = res.data
    })
    this.$ajax.get("user").then(res => {
      this.users = res.data
    })
  }
}
</script>

<style scoped>
</style>