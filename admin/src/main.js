import Vue from "vue";
import Vuex from "vuex";
import App from "./App.vue";
import "./assets/css/vendors/bootstrap/bootstrap.min.css";
import "./assets/css/vendors/font-awesome/css/font-awesome.css";
import "./assets/css/vendors/adminLTE/AdminLTE.css";
import "./assets/css/vendors/adminLTE/skin-black.css";
import "./assets/css/main.styl";
import router from "./router";
import store from "./store";
import wysiwyg from "vue-wysiwyg";
import { sync } from "vuex-router-sync";
import moment from 'moment'

Vue.config.productionTip = false;

sync(store, router);

export const eventBus = new Vue();


Vue.filter('formatDate', function(value) {
  if (value) {
    return moment(String(value)).format('MM/DD/YYYY hh:mm');
  }
});

Vue.use(wysiwyg, {
  hideModules: { 
    "justifyLeft": true,
    "justifyCenter": true,
    "justifyRight": true,
    "removeFormat": true,
    "table": true,
    "code": true,
    "image": true,
    "headings": true
  }
});
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
