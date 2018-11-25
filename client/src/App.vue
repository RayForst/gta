<template lang="pug">
  #app
    app-header
    section.content
      router-view
    app-footer
</template>

<script>
import appHeader from '@/components/Header'
import appFooter from '@/components/Footer'

export default {
  data() {
    return {};
  },
  components: {
    appHeader,
    appFooter,
  }
}
</script>


<style lang="stylus">
@import './assets/css/main';
</style>
