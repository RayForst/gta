import Vue from "vue";
import Router from "vue-router";

Vue.use(Router);

export default new Router({
  mode: "history",
  scrollBehavior(to, from, savedPosition) {
    return { x: 0, y: 0 };
  },
  routes: [
    {
      path: "/",
      name: "index",
      component: () => import("./views/Index.vue")
    },
    {
      path: "/what-we-do",
      name: "what-we-do",
      component: () => import("./views/WhatWeDo.vue")
    },
    {
      path: "/what-we-do/:slug",
      name: "what-we-do-item",
      props: true,
      component: () => import("./views/WhatWeDoProject.vue")
    },
    {
      path: "/works",
      name: "works",
      component: () => import("./views/Works.vue")
    },
    {
      path: "/works/:slug",
      name: "works-project",
      props: true,
      component: () => import("./views/WorksProject.vue")
    },
    {
      path: "/about",
      name: "about",
      component: () => import("./views/About.vue")
    },
    {
      path: "/contacts",
      name: "contacts",
      component: () => import("./views/Contacts.vue")
    }
  ]
});
