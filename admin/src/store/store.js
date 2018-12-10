import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    isAuthorized: false,
    token: null,
    user: null
  },
  mutations: {
    setToken(state, token) {
      state.token = token;

      if (token) {
        state.isAuthorized = true;
      } else {
        state.isAuthorized = false;
      }
    },
    setUser(state, token) {
      state.user = token;
    }
  },
  actions: {
    setToken({ commit }, token) {
      commit("setToken", token);
    },
    setUser({ commit }, token) {
      commit("setUser", token);
    }
  }
});
