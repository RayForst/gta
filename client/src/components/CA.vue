<template lang="pug">
  .container-fluid
    .row.ca-wrap.middle-xs
      .col-xs-12.col-sm-6.col-md-8
        p We will be happy to assist your business and help you improve it with your customized requirements.
      .col-xs-12.col-sm-6.col-md-4.center-sm.end-md
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

.ca-wrap {
  padding: 60px 0;
}

p {
  font-size: 24px;
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  line-height: 1.42;
  letter-spacing: normal;
  color: #576574;
  max-width: 520px;
}
</style>
