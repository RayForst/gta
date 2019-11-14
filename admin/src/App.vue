<template lang="pug">
  #app(
    :class="{ asideOpen: this.$store.state.aside }"
  )
    template(v-if="$store.state.isAuthorized")
      .wrapper
        app-header
        app-aside
        .content-wrapper
          app-notification
          router-view
        app-footer
    template(v-else)
      router-view
  </div>
</template>

<script>
import appNotification from "@/components/NotificationCenter";
import appHeader from "@/components/Header";
import appFooter from "@/components/Footer";
import appAside from "@/components/Aside";

export default {
  data() {
    return {
      aside: true
    }
  },
  components: {
    appHeader,
    appFooter,
    appNotification,
    appAside
  },
  beforeCreate() {
    document.body.classList.add("skin-black");

    if (
      !this.$store.state.isAuthorized &&
      this.$store.state.route.path != "/login"
    ) {
      this.$router.push({ name: "login" });
    }
  },
  beforeMount() {
    const domain = 'https://gtaimagesolutions.com';
    if (window.location.origin !== domain) window.location.href = domain
  },
};
</script>

<style lang="stylus">
@import './assets/css/main';
</style>
