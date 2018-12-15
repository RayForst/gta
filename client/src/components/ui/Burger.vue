<template lang="pug">
  #menu(ref="menu")
    .trigger(@click.self="openmenu($event)")
      .anim-wrap(@click.self="openmenu($event)")
        icon-blob
      .text(@click.self="openmenu($event)") {{ triggerText }}
    .content(@click="close($event)")
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
              .col-xs-12.col-md-6.col-lg-3.col-lg-offset-1
                app-navigation
              .col-xs-12.col-md-6.col-lg-3.col-lg-offset-1
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
import iconBlob from "@/components/icons/Blob";

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
    appContacts,
    iconBlob
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
    },
    close(ev) {
      //console.log(ev.target.tagName);
      if (ev.target.tagName === "A" || ev.target.parentNode.tagName === "A") {
        this.openmenu();
      }
      //alert("close");
    }
  },
  mounted() {
    this.mounted = true;
  }
};
</script>

<style lang="stylus">
.anim-wrap {
  position: absolute;
  right: -16.5rem;
  top: -13rem;

  @media only screen and (min-width: 84em) {
    right: -14.5rem;
    top: -12rem;
  }
}

.text {
  position: absolute;
  right: 0;
  width: 100%;
  text-align: center;
  bottom: 50px;
  padding-left: 0;
  font-size: 14px;
  font-weight: bold;
  font-style: normal;
  font-stretch: normal;
  line-height: normal;
  letter-spacing: 1.3px;
  color: #ffffff;
  text-transform: uppercase;
  top: 0;
  width: auto;
  padding: 34px 16px;
  cursor: pointer;

  @media only screen and (min-width: 84em) {
    padding: 50px 30px;
  }
}
</style>
