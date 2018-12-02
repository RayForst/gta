<template lang="pug">
  section
    app-what-we-do(gallery="true")
    .spacer
    app-reviews
</template>

<script>
import appWhatWeDo from "@/components/ServicesList";
import appReviews from "@/components/Reviews";

export default {
  components: {
    appWhatWeDo,
    appReviews
  },
  mounted() {
    document.body.className = "bg-orange";
  }
};
</script>
