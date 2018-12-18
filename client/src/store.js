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
    },
    navigation: {},
    settings: {
      meta: null,
      headings: null,
      phone: "+1 (416) 522-4501",
      email: "hello@gtaimagesolutions.com",
      address: "790 Eglinton Ave East Toronto, ON M4G 2L1",
      copyright: "2018 GTA Image solutions Inc",
      routes: [
        {
          text: "What we do",
          route: "what-we-do"
        },
        {
          text: "Works",
          route: "works"
        },
        {
          text: "Company",
          route: "about"
        },
        {
          text: "Contact us",
          route: "contacts"
        }
      ],
      social: {
        facebook: "fb.com",
        twitter: "fb.com",
        instagram: "fb.com",
        youtube: "fb.com"
      }
    }
  },
  getters: {
    meta: state => {
      let routeName = state.route.name;
      if (!state.settings.meta) return null;

      let metaForPage = state.settings.meta.filter(
        obj => obj.page === routeName
      );

      return metaForPage.length ? metaForPage[0] : null;
    }
  },
  mutations: {
    setHeader(state, payload) {
      state.headerData = payload;
    },
    setSettings(state, payload) {
      state.settings.meta = payload.meta;
      state.settings.headings = payload.headings;
    }
  },
  actions: {
    setSettings({ commit }, data) {
      commit("setSettings", data);
    }
  }
});
