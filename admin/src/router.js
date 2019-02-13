import Vue from "vue";
import Router from "vue-router";
import appLogin from "./views/Login.vue";
import appIndex from "./views/Index.vue";
import appWhatWeDo from "./views/WhatWeDo.vue";
import appWorks from "./views/Works.vue";
import appAbout from "./views/About.vue";
import appContacts from "./views/Contacts.vue";
import appSettings from "./views/Settings.vue";
import appContactsRequests from "./views/ContactsRequests.vue";
import appCustomerReview from "./views/CustomerReview.vue";
import appWhyUs from "./views/WhyUs.vue";
import appTeam from "./views/Team.vue";

Vue.use(Router);

export default new Router({
  mode: "history",
  base: '/admin',
  routes: [
    {
      path: "/login",
      name: "login",
      component: appLogin
    },
    {
      path: "/dashboard",
      name: "dashboard",
      component: appIndex
    },
    {
      path: "/index",
      name: "index",
      component: appIndex
    },
    {
      path: "/what-we-do",
      name: "what-we-do",
      component: appWhatWeDo
    },
    {
      path: "/works",
      name: "works",
      component: appWorks
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
    },
    {
      path: "/settings",
      name: "settings",
      component: appSettings
    },
    {
      path: "/contacts-requests",
      name: "contacts-requests",
      component: appContactsRequests
    },
    {
      path: "/customer-reviews",
      name: "customer-reviews",
      component: appCustomerReview
    },
    {
      path: "/why-us",
      name: "why-us",
      component: appWhyUs
    },
    {
      path: "/team",
      name: "team",
      component: appTeam
    }
  ]
});
