<template>
    <div>
        <div class="panel panel-big">
            <div class="panel-header">
                工作日志
            </div>
            <div class="panel-body">
                <Form ref="form" :label-width="80" :model="data" :rules="rules">
                    <FormItem label="公司名称" prop="companyName">
                        <Input type="text" v-model="data.companyName" />
                    </FormItem>
                    <FormItem label="法人代表" prop="owner">
                        <Input type="text" v-model="data.owner" />
                    </FormItem>
                    <FormItem label="电话" prop="phone">
                        <Input type="text" v-model="data.phone" />
                    </FormItem>
                    <FormItem label="公司网站" prop="website">
                        <Input type="text" v-model="data.website" />
                    </FormItem>
                    <FormItem label="成立时间" prop="createTime">
                        <DatePicker type="date" v-model="data.createTime"></DatePicker>
                    </FormItem>
                    <FormItem label="营业执照" prop="businessLicence">
                        <Input type="text" v-model="data.businessLicence" />
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
        createTime: [{ required: true, type: "date", min: 1, message: "成立时间不能为空!", trigger: "change" }],
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
                this.$refs["form"].resetFields()
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
        if (res.data != null) {
          this.data = res.data
        }
      })
    }
  }
}
</script>

<style scoped>
</style>