import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    isAuthorized: false,
    token: null,
    user: null,
    aside: true,
    whatWeDoId: null,
    ourWorksId: null,
    unreadedMessages: 0
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
    },
    setAside(state, isOpen) {
      state.aside = isOpen;
    },
    setWhatWeDoId(state, id) {
      state.whatWeDoId = id;
    },
    setOurWorksId(state, id) {
      state.ourWorksId = id;
    },
    setcContactRequestCount(state, id) {
      state.unreadedMessages = id;
    }
  },
  actions: {
    setToken({ commit }, token) {
      commit("setToken", token);
    },
    setUser({ commit }, token) {
      commit("setUser", token);
    },
    asideToggle({ commit }, isOpen) {
      commit("setAside", isOpen);
    },
    whatWeDoEdit({ commit }, id) {
      commit("setWhatWeDoId", id);
    },
    ourWorksEdit({ commit }, id) {
      console.log('setting gallery id with', id)
      commit("setOurWorksId", id);
    },
    unreadedRequests({ commit }, count) {
      commit("setcContactRequestCount", count);
    }
  }
});
