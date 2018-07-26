<template>
  <div>
    <div class="panel panel-big">
      <div class="panel-header">
        添加公司
      </div>
      <div class="panel-body">
        <el-form ref="form" label-width="80px" :model="data" :rules="rules">
          <el-form-item label="公司名称" prop="companyName">
            <el-input type="text" v-model="data.companyName" />
          </el-form-item>
          <el-form-item label="法人代表" prop="owner">
            <el-input type="text" v-model="data.owner" />
          </el-form-item>
          <el-form-item label="电话" prop="phone">
            <el-input type="text" v-model="data.phone" />
          </el-form-item>
          <el-form-item label="公司网站" prop="website">
            <el-input type="text" v-model="data.website" />
          </el-form-item>
          <el-form-item label="成立时间" prop="createTime">
            <el-date-picker type="date" v-model="data.createTime"></el-date-picker>
          </el-form-item>
          <el-form-item label="营业执照" prop="businessLicence">
            <el-input type="text" v-model="data.businessLicence" />
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
  name: "CompanyAdd",
  data: function() {
    return {
      data: {
        id: 0,
        companyName: "",
        owner: "",
        phone: "",
        website: "",
        createTime: "",
        businessLicence: ""
      },
      rules: {
        companyName: [{ required: true, message: "公司名称不能为空!", trigger: "blur" }],
        owner: [{ required: true, message: "法人代表不能为空!", trigger: "blur" }],
        phone: [{ required: true, message: "电话不能为空!", trigger: "blur" }],
        website: [{ required: true, message: "公司网站不能为空!", trigger: "blur" }],
        createTime: [{ required: true, message: "成立时间不能为空!", trigger: "change" }],
        businessLicence: [{ required: true, message: "营业执照不能为空!", trigger: "blur" }]
      },
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
            this.$ajax.put("company", this.data).then(res => {
              if (res.data.state) {
                this.$router.go(-1)
              }
            })
          } else {
            this.$ajax.post("company", this.data).then(res => {
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
    if (this.$route.query.id != null) {
      this.$ajax.get("company/" + this.$route.query.id).then(res => {
        if (res.data.data) {
          this.data = res.data.data
        }
      })
    }
  }
}
</script>

<style scoped>
</style>