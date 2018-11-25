<template lang="pug">
  section
    app-what-we-do(gallery="true")
    app-reviews
</template>

<script>
import appWhatWeDo from '@/components/ServicesList'
import appReviews from '@/components/Reviews'

export default {
  components: {
    appWhatWeDo,
    appReviews
  }
};
</script>
