<template>
  <div>
    <div class="top">
      <div class="user-info">
        <img src="../../image/default/profile.png" alt="头像">
        <div class="split">
          <span class="triangle"></span>
          <span class="triangle triangle-mask"></span>
        </div>
        <span class="dark">电话：{{ $store.state.user.phoneNumber }}</span>
        <div class="link">
          <a href="#" class="first">我的客户</a>
          <a href="#">修改资料</a>
        </div>
      </div>
    </div>
    <div class="bottom">

    </div>
  </div>
</template>

<script>
export default {
  name: "UserInfo",
  data: function() {
    return {}
  }
}
</script>

<style lang="stylus" scoped>
.top {
  position: absolute;
  top: 10px;
  left: 10px;
  right: 10px;
  height: 220px;

  .user-info {
    border: 1px solid lightgray;
    width: 220px;
    height: 220px;
    text-align: center;
    padding: 10px;

    img {
      width: 100px;
    }

    .split {
      margin: 15px auto;
      border-bottom: 1px solid lightgray;
      position: relative;
      width: 150px;

      .triangle {
        position: absolute;
        top: -8px;
        left: 76px;
        width: 0;
        height: 0;
        border: 4px solid #e8e8e8;
        border-color: transparent transparent #e8e8e8 transparent;
      }

      .triangle-mask {
        top: -6px;
        border: 4px solid #FFFFFF;
        border-color: transparent transparent #FFFFFF transparent;
      }
    }

    .dark {
      color: #bcbcbc;
    }

    .link {
      margin-top: 8px;

      a {
        padding-left: 10px;
        padding-right: 10px;
        margin: 0;

        &.first {
          border-right: 1px dashed lightgray;
          margin-right: -2px;
        }
      }
    }
  }
}

.bottom {
  position: absolute;
  top: 240px;
  left: 10px;
  right: 10px;
  bottom: 10px;
}
</style>