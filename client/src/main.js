import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import { sync } from "vuex-router-sync";
import store from "./store";
import "./assets/css/vendors/layout/flexboxgrid.css";
import * as VueGoogleMaps from "vue2-google-maps";

Vue.config.productionTip = false;
sync(store, router);

Vue.use(VueGoogleMaps, {
  load: {
    key: "AIzaSyBiqPVo8Anjm534FSZ4-89L1H1yZxfQWvU",
    libraries: "places"
  }
});

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
