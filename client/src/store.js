import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    headerData: null
  },
  mutations: {
    setHeader(state, payload) {
      state.headerData = payload;
    }
  },
  actions: {}
});
