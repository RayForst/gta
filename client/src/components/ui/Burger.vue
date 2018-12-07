<template lang="pug">
  #menu(ref="menu")
    .trigger(@click.self="openmenu($event)")
      .text(@click.self="openmenu($event)") {{ triggerText }}
    .content
      .content-inner
        .row.navigation-container
          .col-xs-12.start-sm
            router-link(:to="{ name: 'index' }")
              img.logo(src="../../assets/img/logo.svg", alt="")
          .col-xs-12
            .row
              .col-xs-12.col-md-12.col-lg-4.nav-ca
                .row.middle-md.start-lg
                  .col-xs-12.col-md-7.col-lg-12
                    app-ca-navigation
                  .col-xs-12.col-md-5.col-lg-12
                    router-link.ui-btn(:to="{ name: 'contacts' }") Request a quote 
              .col-xs-12.col-md-6.col-lg-4
                app-navigation
              .col-xs-12.col-md-6.col-lg-4
                app-contacts
        .address-container
          .address
            img(
              src="../../assets/img/flag-can.png" 
              srcset="../../assets/img/flag-can@2x.png 2x"
              alt="Canada flag"
            )
            span {{ $store.state.settings.address }}
</template>

<script>
import appNavigation from "@/components/ui/Navigation";
import appCaNavigation from "@/components/ui/CaNavigation";
import appContacts from "@/components/ui/Contacts";

export default {
  data() {
    return {
      triggerText: "menu",
      mounted: false
    };
  },
  components: {
    appNavigation,
    appCaNavigation,
    appContacts
  },
  methods: {
    openmenu(ev) {
      let menu = this.$refs.menu;

      if (menu.classList.contains("open")) {
        menu.classList.remove("open");
        document.body.setAttribute("data-overflow", "true");
        this.triggerText = "menu";
      } else {
        menu.classList.add("open");
        document.body.setAttribute("data-overflow", "false");
        this.triggerText = "close";
      }

      if (!menu.classList.contains("mounted")) {
        this.$refs.menu.classList.add("mounted");
      }
    }
  },
  mounted() {
    this.mounted = true;
  }
};
</script>
