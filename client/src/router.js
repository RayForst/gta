import Vue from "vue";
import Router from "vue-router";
import appIndex from "./views/Index.vue";
import appWhatWeDo from "./views/WhatWeDo.vue";
import appWhatWeDoProject from "./views/WhatWeDoProject";
import appWorks from "./views/Works.vue";
import appWorksProject from "./views/WorksProject.vue";
import appAbout from "./views/About.vue";
import appContacts from "./views/Contacts.vue";

Vue.use(Router);

export default new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      name: "index",
      component: appIndex
    },
    {
      path: "/what-we-do",
      name: "what-we-do",
      component: appWhatWeDo
    },
    {
      path: "/what-we-do/:slug",
      name: "what-we-do-item",
      props: true,
      component: appWhatWeDoProject
    },
    {
      path: "/works",
      name: "works",
      component: appWorks
    },
    {
      path: "/works/:name",
      name: "works-project",
      component: appWorksProject
    },
    {
      path: "/about",
      name: "about",
      component: appAbout
    },
    {
      path: "/contacts",
      name: "contacts",
      component: appContacts
    }
  ]
});
