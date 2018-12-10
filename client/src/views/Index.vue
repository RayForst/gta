<template lang="pug">
  section
    app-meta
    app-what-we-do(gallery="false")
    .spacer
    app-reviews
    .spacer
    app-about-company
    .spacer.hide_md
</template>

<script>
import appWhatWeDo from "@/components/ServicesList";
import appReviews from "@/components/Reviews";
import appAboutCompany from "@/components/AboutCompany";
import appMeta from "@/components/Meta";

export default {
  components: {
    appWhatWeDo,
    appReviews,
    appAboutCompany,
    appMeta
  },
  mounted() {
    document.body.className = "";
  }
};
</script>

