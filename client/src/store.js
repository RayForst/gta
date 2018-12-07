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
  mutations: {
    setHeader(state, payload) {
      state.headerData = payload;
    }
  },
  actions: {}
});
