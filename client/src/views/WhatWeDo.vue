<template lang="pug">
  section
    app-meta
    .spacer
    app-what-we-do(gallery="true" morph="true")
    .spacer
    app-reviews
    .spacer
</template>

<script>
import appWhatWeDo from "@/components/ServicesList";
import appReviews from "@/components/Reviews";
import appMeta from "@/components/Meta";

export default {
  components: {
    appWhatWeDo,
    appReviews,
    appMeta
  },
  mounted() {
    document.body.className = "bg-orange";
  }
};
</script>
