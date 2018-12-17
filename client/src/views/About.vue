<template lang="pug">
  section
    app-meta
    app-about-us
    .spacer
    app-why-us
    .spacer
    app-team
    .spacer
    app-reviews
    .spacer
</template>

<script>
import appAboutUs from "@/components/AboutUs";
import appWhyUs from "@/components/WhyUs";
import appTeam from "@/components/Team";
import appReviews from "@/components/Reviews";
import appMeta from "@/components/Meta";

export default {
  components: {
    appAboutUs,
    appWhyUs,
    appReviews,
    appTeam,
    appMeta
  },
  mounted() {
    document.body.className = "";
  }
};
</script>
