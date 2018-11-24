<template>
  <div class="tags">
    <ScrollBar ref="scrollBar">
      <router-link ref="tag" class="tag" :class="isActive(item) ? 'cur' : ''" v-for="(item, index) in tagNavList" :to="item.path" :key="index">
        {{item.title}}
        <span class='icon icon-delete' v-if="item.title!='个人资料'" @click.prevent.stop="closeTheTag(item, index)"></span>
      </router-link>
    </ScrollBar>
  </div>
</template>

<script>
import ScrollBar from "../../components/ScrollBar.vue"
export default {
  name: "TagsOpened",
  data() {
    return {
      defaultPage: {
        name: "UserInfo",
        path: "/UserInfo",
        title: "个人资料"
      },
      tagNavList: [
        {
          name: "UserInfo",
          path: "/UserInfo",
          title: "个人资料"
        }
      ]
    }
  },
  computed: {},
  mounted() {
    // 首次加载时将默认页面加入缓存
    this.addTagNav()
  },
  watch: {
    $route() {
      this.addTagNav()
      this.scrollToCurTag()
    }
  },
  methods: {
    addTagNav() {
      // 如果需要缓存则必须使用组件自身的name，而不是router的name
      const components = this.$router.getMatchedComponents()
      if (this.$route.meta.name.length>1 && components.length >= 2) {
        const name = components[1].name
        if (this.tagNavList != null && this.tagNavList.find(o => o.name == name) == null) {
          this.tagNavList.push({
            name: name,
            path: this.$route.path,
            title: this.$route.meta.name
          })
        }
      }
    },
    isActive(item) {
      return item.path === this.$route.path
    },
    closeTheTag(item, index) {
      // 当关闭当前页面的Tag时，则自动加载前一个Tag所属的页面
      // 如果没有前一个Tag，则加载默认页面
      if (index) {
        this.$router.push(this.tagNavList[index - 1].path)
        this.tagNavList.splice(index, 1)
      } else {
        this.$router.push(this.defaultPage.path)
        this.tagNavList.splice(index, 1)
        if (this.tagNavList.length <= 0) {
          this.addTagNav()
        }
      }
    },
    scrollToCurTag() {
      this.$nextTick(() => {
        for (let item of this.$refs.tag) {
          if (item.to === this.$route.path) {
            this.$refs.scrollBar.scrollToCurTag(item.$el)
            break
          }
        }
      })
    }
  },
  components: {
    ScrollBar
  }
}
</script>

<style lang="scss" scoped>
.tag {
  display: inline-block;
  position: relative;
  height: 30px;
  line-height: 30px;
  padding: 0 10px;
  margin-right: 10px;
  border: 1px solid #ccc;
  background: #fff;
  text-decoration: none;

  span {
    width: 14px;
    height: 14px;
    border-radius: 50%;
    text-align: center;
    transition: all 0.3s ease;
    transform-origin: 100% 50%;

    &:hover {
      background-color: #b4bccc;
      color: #fff;
    }
  }

  &.cur {
    background: #42b983;
    border: none;
    color: #fff;
  }
}
</style>

