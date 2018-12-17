<template lang="pug">
  section
    h4 Find what you’re looking for
    ul.links
      li(v-for="item in $store.state.settings.routes")
        router-link(:to='{ name: item.route }') {{ item.text }}
</template>

<script>
export default {
  data() {
    return {};
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

.links a {
  font-size: 14px;
  font-weight: bold;
  font-style: normal;
  font-stretch: normal;
  line-height: 37px;
  letter-spacing: normal;
  color: #ffffff;
  text-decoration: none;
}

ul {
  margin-bottom: 50px;
  padding: 0;
  margin: 0;

  @media only screen and (min-width: 64em) {
    margin-bottom: 0;
  }
}
</style>
