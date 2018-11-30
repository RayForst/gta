<template lang="pug">
  section
    //- app-what-we-do(gallery="false")
    //- .spacer
    //- app-reviews
    //- .spacer
    //- app-about-company
</template>

<script>
import appWhatWeDo from "@/components/ServicesList";
import appReviews from "@/components/Reviews";
import appAboutCompany from "@/components/AboutCompany";

export default {
  components: {
    appWhatWeDo,
    appReviews,
    appAboutCompany
  }
};
</script>

<style lang="stylus">
.spacer {
  height: 70px;
}
</style>
