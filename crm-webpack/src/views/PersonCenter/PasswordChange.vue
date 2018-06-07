<template>
  <div>
    <div class="panel">
      <div class="panel-header">
        修改密码
      </div>
      <div class="panel-body">
        <el-form :model="form" label-width="120px">
          <el-form-item label="原密码">
            <el-input v-model="form.txtOld" type="password"></el-input>
          </el-form-item>
          <el-form-item label="新密码">
            <el-input v-model="form.txtNew" type="password"></el-input>
          </el-form-item>
          <el-form-item label="重复输入新密码">
            <el-input v-model="form.txtNewRepeat" type="password"></el-input>
          </el-form-item>
        </el-form>
      </div>
      <div class="panel-footer">
        <el-button type="primary" @click="change" :disabled="!canSave">保存</el-button>
      </div>
    </div>
  </div>
</template>

<script>
import common from "../../common.js"
export default {
  data: function() {
    return {
      form: {
        txtOld: "",
        txtNew: "",
        txtNewRepeat: ""
      }
    }
  },
  methods: {
    change() {
      this.$ajax.put("password", this.form)
    }
  },
  computed: {
    canSave() {
      return this.form.txtOld.length > 0 && this.form.txtNew.length > 0 && this.form.txtNew == this.form.txtNewRepeat
    }
  }
}
</script>

<style scoped>
</style>