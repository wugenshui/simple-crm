<template>
  <div>
    <div class="panel user-info">
      <div class="panel-header">
        个人资料
      </div>
      <div class="panel-body">
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
    <div class="panel pie">
      <div class="panel-header">
        机构组成
      </div>
      <div class="panel-body">
        <ve-pie :data="pieData" :settings="pieSetting" height="350px"></ve-pie>
      </div>
    </div>
    <div class="panel panel-big">
      <div class="panel-header">
        业绩走势图
      </div>
      <div class="panel-body">
        <ve-line :data="chartData" :settings="chartSettings" :grid="grid"></ve-line>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "UserInfo",
  data() {
    this.grid = {
      top: 50,
      left: 30,
      right: 30
    }
    this.chartSettings = {
      labelMap: {
        PV: "访问用户",
        Order: "下单用户",
        Percent: "下单率"
      },
      yAxisName: ["访问用户"],
      xAxisType: "time"
    }
    this.pieSetting = {
      dataType: function(v) {
        return v + "人"
      }
    }
    return {
      chartData: {
        columns: ["date", "PV", "Order", "Percent"],
        rows: [
          { date: "2018-01-01", PV: 1393, Order: 1093, Percent: 0.32 },
          { date: "2018-01-02", PV: 3530, Order: 3230, Percent: 0.26 },
          { date: "2018-01-03", PV: 2923, Order: 2623, Percent: 0.76 },
          { date: "2018-01-05", PV: 1723, Order: 1423, Percent: 0.49 },
          { date: "2018-01-10", PV: 3792, Order: 3492, Percent: 0.323 },
          { date: "2018-01-20", PV: 4593, Order: 4293, Percent: 0.78 }
        ]
      },
      pieData: {
        columns: ["职位", "人数"],
        rows: [
          { 职位: "总经理", 人数: 1 },
          { 职位: "经理", 人数: 12 },
          { 职位: "干部", 人数: 27 },
          { 职位: "员工", 人数: 100 }
        ]
      }
    }
  }
}
</script>

<style lang="stylus" scoped>
.user-info {
  width: 220px;
  height: 420px;
  float: left;

  img {
    width: 200px;
  }

  .split {
    margin: 15px auto;
    border-bottom: 1px solid lightgray;
    position: relative;
    width: 200px;

    .triangle {
      position: absolute;
      top: -8px;
      left: 100px;
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
    text-align: center;
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

.pie {
  margin-left: 230px;
  height: 420px;
  width: auto;
  margin-bottom: 10px;
}

.panel-big {
  width: 100%;
}
</style>