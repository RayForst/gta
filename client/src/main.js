import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import { sync } from "vuex-router-sync";
import store from "./store";
import * as VueGoogleMaps from "vue2-google-maps";
import "@/scripts/animation";
import VueTelInput from "vue-tel-input";
import "vue-tel-input/dist/vue-tel-input.css";
import Meta from "vue-meta";
import '@/scripts/fontLoader';


var truncateFilter = function(text, length, clamp) {
  clamp = clamp || "...";
  var node = document.createElement("div");
  node.innerHTML = text;
  var content = node.textContent;
  return content.length > length ? content.slice(0, length) + clamp : content;
};

Vue.filter("truncate", truncateFilter);

Vue.config.productionTip = false;
sync(store, router);

Vue.use(VueGoogleMaps, {
  load: {
    key: "AIzaSyBiqPVo8Anjm534FSZ4-89L1H1yZxfQWvU",
    libraries: "places"
  }
});

Vue.use(VueTelInput);
Vue.use(Meta);

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
