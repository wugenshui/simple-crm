import Vue from "vue"
import Vuex from "vuex"
import createPersistedState from "vuex-persistedstate"

Vue.use(Vuex)
const store = new Vuex.Store({
  state: {
    user: {},
    ou: {},
    token: ""
  },
  getters: {
    getuser: state => id => {
      return user
    }
  },
  mutations: {
    setUser(state, obj) {
      state.user = obj
    },
    setOu(state, obj) {
      state.ou = obj
    },
    setToken(state, token) {
      state.token = token
    }
  },
  plugins: [createPersistedState()]
})

// this.$store.state.user;
// this.$store.getters.getuser(1);
// this.$store.commit("setUser", {});

export default store
