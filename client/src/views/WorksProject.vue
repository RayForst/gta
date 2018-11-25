<template lang="pug">
  .container-fluid 
    .row
      .col-xs-12
    app-breadcrumbs
    app-why-us
    app-reviews
</template>

<script>
import appBreadcrumbs from '@/components/ui/Breadcrumbs';
import appWhyUs from '@/components/WhyUs';
import appReviews from '@/components/Reviews'

export default {
  components: {
    appBreadcrumbs,
    appWhyUs,
    appReviews
  }
};
</script>
