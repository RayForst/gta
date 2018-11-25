import Vue from "vue";
import Vuex from "vuex";
import App from "./App.vue";
import "./assets/css/vendors/bootstrap/bootstrap.min.css";
import "./assets/css/vendors/font-awesome/css/font-awesome.css";
import "./assets/css/vendors/adminLTE/AdminLTE.css";
import "./assets/css/vendors/adminLTE/skin-black.css";
import "./assets/css/main.styl";
import router from "./router";
import store from "./store/store";

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
