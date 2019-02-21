<template>
  <div>
    <div class="panel panel-big">
      <div class="panel-header">客户资料</div>
      <div class="panel-body">
        <el-form ref="form" label-width="100px" :model="data" :rules="rules">
          <el-form-item label="客户类型" prop="customerType">
            <el-radio-group v-model="data.customerType">
              <el-radio v-for="(type,index) in customerType" :label="index" :key="index">{{ type }}</el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="客户名称" prop="customerName">
            <el-input type="text" v-model="data.customerName"/>
          </el-form-item>
          <el-form-item label="电话" prop="customerPhone">
            <el-input type="text" v-model="data.customerPhone"/>
          </el-form-item>
          <el-form-item label="QQ" prop="customerQQ">
            <el-input v-model.number="data.customerQQ"></el-input>
          </el-form-item>
          <el-form-item label="邮箱" prop="mail">
            <el-input v-model="data.mail"></el-input>
          </el-form-item>
          <el-form-item label="身份证号码" prop="idcard">
            <el-input type="text" v-model.number="data.idcard"/>
          </el-form-item>
          <el-form-item label="家庭住址" prop="homeAddress">
            <el-input type="text" v-model="data.homeAddress"></el-input>
          </el-form-item>
          <el-form-item label="所属业务" prop="ownerID">
            <el-select v-model.number="data.ownerID" clearable>
              <el-option v-for="u in users" :value="u.id" :key="u.id" :label="u.userName"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="合同附件上传" prop="contract">
            <el-upload
              class="upload-demo"
              ref="upload"
              :file-list="fileList"
              :auto-upload="false"
              action
              :multiple="false"
            >
              <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
              <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
            </el-upload>
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
import common from "../../common.js";
import { customerType } from "../../filter.js";
export default {
  name: "CustomerAdd",
  data: function() {
    return {
      data: {
        id: 0,
        customerType: "",
        customerName: "",
        customerPhone: "",
        customerQQ: "",
        mail: "",
        idcard: "",
        homeAddress: "",
        owner: "",
        contract: "",
        state: 0,
        createrId: this.$store.state.user.id
      },
      fileList: [],
      rules: {
        customerType: [
          { required: true, message: "客户类型不能为空!", trigger: "change" }
        ],
        customerName: [
          { required: true, message: "客户名称不能为空!", trigger: "change" }
        ],
        customerPhone: [
          { required: true, message: "电话不能为空!", trigger: "change" }
        ],
        mail: [{ required: true, message: "邮箱不能为空!", trigger: "change" }],
        idcard: [
          { required: true, message: "身份证号码不能为空!", trigger: "change" }
        ],
        homeAddress: [
          { required: true, message: "家庭住址不能为空!", trigger: "change" }
        ],
        ownerID: [
          { required: true, message: "所属业务不能为空!", trigger: "change" }
        ]
      },
      companys: [],
      teams: [],
      users: [],
      filterTitle: "",
      filterTime: "",
      pageIndex: 1,
      pageSize: 10,
      total: 0,
      customerType: customerType
    };
  },
  methods: {
    save() {
      let formData = new FormData();
      if (this.$refs.upload.uploadFiles.length > 0) {
        formData.append("file", this.$refs.upload.uploadFiles[0].raw);
      }
      for (var key in this.data) {
        formData.append(key, this.data[key]);
      }
      if (this.data.id > 0) {
        this.$ajax.put("customer", formData).then(res => {
          if (res.data.state) {
            this.$router.go(-1);
          }
        });
      } else {
        this.$ajax.post("customer", formData).then(res => {
          if (res.data.state) {
            this.$refs["form"].resetFields()
          }
        });
      }
    },
    reset() {
      this.$refs["form"].resetFields();
    }
  },
  activated() {
    this.fileList = [];
    this.$ajax.get("company").then(res => {
      this.companys = res.data.data;
      if (this.$route.query.id != null) {
        this.$ajax.get("customer/" + this.$route.query.id).then(res => {
          this.data = res.data.data;
        });
      }
    });
    this.$ajax.get("team").then(res => {
      this.teams = res.data.data;
    });
    this.$ajax.get("user").then(res => {
      this.users = res.data.data;
    });
  }
};
</script>

<style scoped>
</style>