<template lang="pug">
  .container-fluid 
    .row
      .col-xs-12
    app-breadcrumbs
    .row
      .col-xs-12
        h2 {{ articleTitle  }}
    .row
      .col-xs-6
        div {{ shortDescription }}
      .col-xs-6
        | image gallery
    .row
      .col-xs-12
        .desc(v-html="description")
    app-c-a
    app-why-us
    app-reviews
</template>

<script>
import appBreadcrumbs from "@/components/ui/Breadcrumbs";
import appWhyUs from "@/components/WhyUs";
import appReviews from "@/components/Reviews";
import appCA from "@/components/CA";
import contentService from "@/services/ContentService";

export default {
  components: {
    appBreadcrumbs,
    appWhyUs,
    appReviews,
    appCA
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
        icon: "some.svg",
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
  }
};
</script>

<style lang="stylus">
.desc {
  column-count: 2;
}
</style>
