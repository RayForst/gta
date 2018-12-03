<template lang="pug">
  section
    .container-fluid.mid
      .row
        .col-xs-12
      .row
        .col-xs-12
          h2 {{ articleTitle  }}
      .row
        .col-xs-6
          div {{ shortDescription }}
        .col-xs-6
          .carousel-wrap
            carousel(loop=true :items=1 :dots="true" :nav="false")
              <img src="https://placeimg.com/200/200/any?1">
              <img src="https://placeimg.com/200/200/any?2">
              <img src="https://placeimg.com/200/200/any?3">
              <img src="https://placeimg.com/200/200/any?4">
      .row
        .col-xs-12
          .desc(v-html="description")
      app-c-a
      app-why-us
    app-reviews
</template>

<script>
import appWhyUs from "@/components/WhyUs";
import appReviews from "@/components/Reviews";
import appCA from "@/components/CA";
import contentService from "@/services/ContentService";
import carousel from "vue-owl-carousel";

export default {
  components: {
    appWhyUs,
    appReviews,
    appCA,
    carousel
  },
  props: ["slug"],
  data() {
    return {
      description: null,
      shortDescription: null,
      articleTitle: null
    };
  },
  methods: {
    async get() {
      const content = (await contentService.whatWeDo.get({
        slug: this.slug
      })).data;

      this.description = content.description;
      this.shortDescription = content.shortDescription;
      this.articleTitle = content.articleTitle;

      console.log(content);
      this.$store.commit("setHeader", {
        title: content.title,
        icon: content.icon + ".svg",
        breadcrumbs: [
          {
            name: "What we do",
            route: "what-we-do"
          },
          {
            name: this.slug
          }
        ]
      });
    }
  },
  mounted() {
    this.get();
    document.body.className = "bg-blue-green";
  }
};
</script>

<style lang="stylus" scoped>
.desc {
  column-count: 2;
}

.carousel-wrap {
  max-width: 400px;
  margin: 0 auto;
}
</style>
