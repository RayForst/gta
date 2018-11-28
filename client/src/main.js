import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import { sync } from "vuex-router-sync";
import store from "./store";
import "./assets/css/vendors/layout/flexboxgrid.css";

Vue.config.productionTip = false;
sync(store, router);

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
