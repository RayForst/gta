import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    headerData: {
      title: null,
      icon: null,
      breadcrumbs: null,
      caption: null
    }
  },
  mutations: {
    setHeader(state, payload) {
      state.headerData = payload;
    }
  },
  actions: {}
});
