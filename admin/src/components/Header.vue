<template lang="pug">
  header.main-header
    router-link.logo(:to="{ name: 'dashboard' }")
      .logo-mini 
        | GTA
      .logo-lg
        b Admin
        | GTA
    .navbar.navbar-static-top
      a.sidebar-toggle(@click="asideToggle" role="button")
        span.sr-only Toggle navigation
      .navbar-custom-menu
        ul.nav.navbar-nav
          li.dropdown.messages-menu
            router-link.dropdown-toggle(:to="{ name: 'contacts-requests' }")
              i.fa.fa-envelope-o
              span(
                v-if="unreadedCount > 0"
              ).label.label-success {{ unreadedCount }}
          li.dropdown.user.user-menu
            a.dropdown-toggle
              img.user-image(src="../assets/img/admin_pic.jpg", alt="")
              span.hidden-xs {{ $store.state.user.name }}
          li.dropdown.messages-menu(title="Logout" @click="logout")
            a(href="/logout").dropdown-toggle
              i.glyphicon.glyphicon-log-out
</template>

<script>
import contentService from '@/services/ContentService'

export default {
  data() {
    return {
      unreadedMessages: 0
    };
  },
  computed: {
    unreadedCount() {
      return this.$store.state.unreadedMessages
    }
  },
  methods: {
    async get() {
      const list = (await contentService.contacts.get()).data
      let unreadedCount = 0;

      list.forEach(function (item, index) {
        if (item.readed != 1) unreadedCount++;
      });

      this.$store.dispatch("unreadedRequests", unreadedCount);
    },
    logout() {
      this.$store.dispatch("setToken", null);
      this.$store.dispatch("setUser", null);

      this.$router.push({ name: "login" });
    },
    asideToggle() {
      console.log('click', this.$store.state.aside);
      this.$store.dispatch("asideToggle", !this.$store.state.aside);
    }
  },
  mounted() {
    this.get();
  }
};
</script>
