<template>
  <div>
    <div class="panel panel-big">
      <div class="panel-header">
        添加团队
      </div>
      <div class="panel-body">
        <Form ref="form" :label-width="100" :model="data" :rules="rules">
          <FormItem label="团队名称" prop="name">
            <Input type="text" v-model="data.name" />
          </FormItem>
          <FormItem label="团队负责人" prop="leader">
            <Input type="text" v-model="data.leader" />
          </FormItem>
          <FormItem label="负责人电话" prop="leaderPhone">
            <Input type="text" v-model="data.leaderPhone" />
          </FormItem>
          <FormItem label="团队口号" prop="slogan">
            <Input type="text" v-model="data.slogan" />
          </FormItem>
          <FormItem label="所属公司" prop="companyId">
            <Select v-model="data.companyId">
              <Option v-for="c in companys" :value="c.id+''" :key="c.id">{{ c.companyName }}</Option>
            </Select>
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
        name: "",
        leader: "",
        leaderPhone: "",
        slogan: "",
        companyId: 0
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
                this.$refs["form"].resetFields()
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
      this.companys = res.data
      if (this.$route.query.id != null) {
        this.$ajax.get("team/" + this.$route.query.id).then(res => {
          if (res.data != null) {
            this.data = res.data
          }
        })
      }
    })
  }
}
</script>

<style scoped>
</style>