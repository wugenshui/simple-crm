<template>
  <div>
    <div class="panel panel-big">
      <div class="panel-header">
        添加团队
      </div>
      <div class="panel-body">
        <el-form ref="form" label-width="100px" :model="data" :rules="rules">
          <el-form-item label="团队名称" prop="name">
            <el-input type="text" v-model="data.name" />
          </el-form-item>
          <el-form-item label="团队负责人" prop="leader">
            <el-input type="text" v-model="data.leader" />
          </el-form-item>
          <el-form-item label="负责人电话" prop="leaderPhone">
            <el-input type="text" v-model="data.leaderPhone" />
          </el-form-item>
          <el-form-item label="团队口号" prop="slogan">
            <el-input type="textarea" v-model="data.slogan" :autosize="true" />
          </el-form-item>
          <el-form-item label="所属公司" prop="companyId">
            <el-select v-model="data.companyId">
              <el-option v-for="c in companys" :value="c.id+''" :key="c.id" :label="c.companyName"></el-option>
            </el-select>
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
  name: "TeamAdd",
  data: function() {
    return {
      data: {
        id: 0,
        name: "",
        leader: "",
        leaderPhone: "",
        slogan: "",
        companyId: null
      },
      rules: {
        name: [{ required: true, message: "团队名称不能为空!", trigger: "blur" }],
        leader: [{ required: true, message: "团队负责人不能为空!", trigger: "blur" }],
        leaderPhone: [{ required: true, message: "负责人电话不能为空!", trigger: "blur" }],
        slogan: [{ required: true, message: "团队口号不能为空!", trigger: "blur" }],
        companyId: [{ required: true, message: "所属公司不能为空!", trigger: "blur" }]
      },
      companys: [],
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
            this.$ajax.put("team", this.data).then(res => {
              if (res.data.state) {
                this.$router.push("teamlist")
              }
            })
          } else {
            this.$ajax.post("team", this.data).then(res => {
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
        this.$ajax.get("team/" + this.$route.query.id).then(res => {
          if (res.data.data) {
            this.data = res.data.data
          }
        })
      }
    })
  }
}
</script>

<style scoped>
</style>