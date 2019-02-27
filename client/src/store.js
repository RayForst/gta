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
      phone: '',
      email: '',
      address: '',
      copyright: '',
      lat: 0,
      long: 0,
      subjects: [],
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

      let settings = payload.settings[0];

      state.settings.email = settings.email;
      state.settings.phone = settings.phone;
      state.settings.copyright = settings.copyright;
      state.settings.address = settings.address;
      state.settings.lat = +settings.lat;
      state.settings.long = +settings.long;
      state.settings.social.facebook = settings.facebook;
      state.settings.social.twitter = settings.twitter;
      state.settings.social.instagram = settings.instagram;
      state.settings.social.youtube = settings.youtube;
      state.settings.subjects = settings.contactFormSubject;
    }
  },
  actions: {
    setSettings({ commit }, data) {
      commit("setSettings", data);
    }
  }
});
