<template lang="pug">
  .container-fluid
    .row
      .col-xs-12
        p Call to acction
        router-link.ui-btn(:to="{ name: 'contacts' }") Request a quote 
</template>

<script>
export default {
  data() {
    return {};
  }
};
</script>

<style lang="stylus" scoped>
.container-fluid {
  border-top: 2px solid rgba(131, 149, 167, 0.1);
  border-bottom: 2px solid rgba(131, 149, 167, 0.1);
}
</style>
