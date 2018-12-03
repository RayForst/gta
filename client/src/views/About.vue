<template lang="pug">
  section
    app-about-us
    app-why-us
    app-team
    app-reviews
</template>

<script>
import appAboutUs from "@/components/AboutUs";
import appWhyUs from "@/components/WhyUs";
import appTeam from "@/components/Team";
import appReviews from "@/components/Reviews";

export default {
  components: {
    appAboutUs,
    appWhyUs,
    appReviews,
    appTeam
  },
  mounted() {
    document.body.className = "";
  }
};
</script>
