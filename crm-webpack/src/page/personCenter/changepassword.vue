<template>
    <div>
        <div class="panel">
            <div class="panel-header">
                修改密码
            </div>
            <div class="panel-body">
                <Form :model="form" :label-width="120">
                    <FormItem label="原密码">
                        <Input v-model="form.txtOld" type="password"></Input>
                    </FormItem>
                    <FormItem label="新密码">
                        <Input v-model="form.txtNew" type="password"></Input>
                    </FormItem>
                    <FormItem label="重复输入新密码">
                        <Input v-model="form.txtNewRepeat" type="password"></Input>
                    </FormItem>
                </Form>
            </div>
            <div class="panel-footer">
                <Button type="primary" @click="change">保存</Button>
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
      this.$ajax.put("password", this.form).then(res => {
        if (res.data.state == true) {
          common.info(res.data.msg)
        }
      })
    }
  }
}
</script>

<style scoped>

</style>