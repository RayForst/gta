<template lang="pug">
  .container-fluid 
    .row
      .col-xs-12
    .row
      .col-xs-4
        .row
          .col-xs-12
            | Person company logo
          .col-xs-12
            div {{ person_name }}
            div {{ person_position }}
      .col-xs-8
        | {{ comment }}
    .row
      .col-xs-12
        | Gallery
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

export default {
  components: {
    appWhyUs,
    appReviews,
    appCA
  },
  props: ["slug"],
  data() {
    return {
      description: null,
      comment: null,
      person_name: null,
      person_position: null
    };
  },
  methods: {
    async get() {
      const content = (await contentService.works.get({
        slug: this.slug
      })).data;

      this.description = content.description;
      this.comment = content.comment;
      this.person_name = content.person_name;
      this.person_position = content.person_position;

      this.$store.commit("setHeader", {
        title: content.title,
        icon: "some.svg",
        breadcrumbs: [
          {
            name: "Our works",
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
