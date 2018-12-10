<template lang="pug">
  header.main-header
    router-link.logo(:to="{ name: 'dashboard' }")
      .logo-lg
        b Admin
        | GTA
    .navbar.navbar-static-top
      a.sidebar-toggle(data-toggle="push-menu" role="button")
        span.sr-only Toggle navigation
      .navbar-custom-menu
        ul.nav.navbar-nav
          li.dropdown.messages-menu
            a.dropdown-toggle
              i.fa.fa-envelope-o
              span.label.label-success 4
          li.dropdown.user.user-menu
            a.dropdown-toggle
              img.user-image(src="../assets/img/admin_pic.jpg", alt="")
              span.hidden-xs {{ $store.state.user.name }}
          li.dropdown.messages-menu(title="Logout" @click="logout")
            a.dropdown-toggle
              i.glyphicon.glyphicon-log-out
</template>

<script>
export default {
  data() {
    return {};
  },
  methods: {
    logout() {
      this.$store.dispatch("setToken", null);
      this.$store.dispatch("setUser", null);

      this.$router.push({ name: "login" });
    }
  }
};
</script>
