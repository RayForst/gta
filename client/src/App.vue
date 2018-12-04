<template lang="pug">
  #app
    app-burger
    app-header
    section.content
      router-view
    app-footer
</template>

<script>
import appBurger from "@/components/ui/Burger";
import appHeader from "@/components/Header";
import appFooter from "@/components/Footer";

export default {
  data() {
    return {};
  },
  components: {
    appBurger,
    appHeader,
    appFooter
  },
  methods: {
    openmenu(ev) {
      ev.target.classList.toggle("open");
    }
  }
};
</script>


<style lang="stylus">
@import './assets/css/main';
</style>
