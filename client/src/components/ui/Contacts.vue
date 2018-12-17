<template lang="pug">
  section.contacts
    h4 Feel free to contact us
    div.link-wrap
      a(:href="'tel:' + phoneRaw") {{ $store.state.settings.phone }}
    div.link-wrap
      a(:href="'mailto:' + $store.state.settings.email") {{ $store.state.settings.email }}
    div.link-wrap
      a -
    div.social.link-wrap
      a(
        :href="$store.state.settings.facebook"
        title="Facebook"
      )
        img(src="../../assets/img/social/facebook.svg", alt="Facebook logo")
      a(
        href="$store.state.settings.twitter"
        title="Twitter"
      )
        img(src="../../assets/img/social/twitter.svg", alt="Twitter logo")
      a(
        href="$store.state.settings.instagram"
        title="Instagram"
      )
        img(src="../../assets/img/social/instagram.svg", alt="Instagram logo")
      a(
        href="$store.state.settings.youtube" 
        Title="Youtube"
      )
        img(src="../../assets/img/social/youtube.svg", alt="Youtube logo")
</template>

<script>
export default {
  data() {
    return {};
  },
  computed: {
    phone() {
      return this.$store.state.settings.phone;
    },
    phoneRaw() {
      let phone = this.$store.state.settings.phone;
      return phone.split(/[\s)(-]+/).join("");
    },
    email() {
      return this.$store.state.settings.email;
    }
  }
};
</script>

<style lang="stylus" scoped>
h4 {
  opacity: 0.5;
  font-size: 18px;
  font-weight: bold;
  color: #ffffff;
  margin-bottom: 25px;
}

.contacts {
  margin-bottom: 50px;

  @media only screen and (min-width: 48em) {
    margin-bottom: 0;
  }
}

.link-wrap {
  display: flex;
  height: 37px;
}

a {
  font-size: 16px;
  font-weight: bold;
  line-height: 37px;
  color: #fff;
  text-decoration: none;

  @media only screen and (min-width: 64em) {
    font-size: 18px;
  }
}

.social {
  a {
    margin-right: 30px;
  }
}
</style>
