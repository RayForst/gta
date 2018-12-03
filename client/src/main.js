import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import { sync } from "vuex-router-sync";
import store from "./store";
import * as VueGoogleMaps from "vue2-google-maps";

var filter = function (text, length, clamp) {
  clamp = clamp || '...';
  var node = document.createElement('div');
  node.innerHTML = text;
  var content = node.textContent;
  return content.length > length ? content.slice(0, length) + clamp : content;
};

Vue.filter('truncate', filter);

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
