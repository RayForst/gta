import Vue from "vue";
import App from "./App.vue";
import "./assets/css/vendors/bootstrap/bootstrap.min.css";
import "./assets/css/vendors/adminLTE/AdminLTE.css";
import "./assets/css/main.styl";
import router from "./router";
import store from "./store";

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
