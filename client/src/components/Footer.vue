<template lang="pug">
    footer.main
      app-footer-waves
      .container-fluid
        .row.ca
          .col-xs-12.col-sm-5.col-md-3.align-start.center-xs.start-sm
            router-link(:to="{ name: 'index' }")
              img(src="../assets/img/logo-no-text.svg", alt="")
          .col-xs-12.col-sm-7.col-md-9.align-center
            .row.align-center.w100
              .col-xs-12.col-md-7
                app-ca-navigation
              .col-xs-12.col-md-5.center-xs.start-sm
                router-link.ui-btn(:to="{ name: 'contacts' }") Request a quote 
        .row.content
          .col-xs-12.col-sm-5.col-md-3.address-wrap.last-xs.first-sm
            .address
              img(
                src="../assets/img/flag-can.png" 
                srcset="../assets/img/flag-can@2x.png 2x"
                alt="Canada flag"
              )
              span {{ $store.state.settings.address }}
            div.copyright © {{ $store.state.settings.copyright }}
          .col-xs-12.col-sm-7.col-md-9
            .row
              .col-xs-12.col-md-7
                app-navigation
              .col-xs-12.col-md-5
                app-contacts
</template>

<script>
import appFooterWaves from "@/components/ui/FooterWave";
import appNavigation from "@/components/ui/Navigation";
import appCaNavigation from "@/components/ui/CaNavigation";
import appContacts from "@/components/ui/Contacts";

export default {
  data() {
    return {};
  },
  components: {
    appFooterWaves,
    appNavigation,
    appCaNavigation,
    appContacts
  }
};
</script>

<style lang="stylus" scoped>
footer {
  position: relative;
  padding-top: 40px;

  @media only screen and (min-width: 48em) {
    padding-top: 120px;
  }

  @media only screen and (min-width: 48em) {
    padding-top: 160px;
  }
}

.waveWrapper {
  bottom: -2px;
}

.copyright {
  opacity: 0.5;
  font-size: 11px;
  line-height: 2;
  color: #ffffff;
  margin-top: auto;
}

.content {
  padding: 50px 0;
}

.ca {
  border-bottom: 1px solid rgba(255, 255, 255, 0.4);
  padding: 80px 0 35px 0;
}

.address-wrap {
  display: flex;
  align-items: flex-start;
  flex-direction: column;
}

.address {
  display: flex;
  align-items: flex-start;
  flex-direction: column;

  @media only screen and (min-width: 48em) {
    flex-direction: row;
  }

  span {
    opacity: 0.5;
    font-size: 14px;
    font-weight: bold;
    line-height: 1.64;
    color: #ffffff;
    max-width: 160px;
    padding-left: 0;
    padding-top: 20px;
    padding-bottom: 25px;

    @media only screen and (min-width: 48em) {
      padding-left: 15px;
      padding-top: 0;
      padding-bottom: 0;
    }
  }
}
</style>
