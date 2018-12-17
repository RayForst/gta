<template lang="pug">
  section.relative
    ui-morph(type="morph3" size="large" class="right2")
    .container-fluid.small
      .row
        .col-xs-12
      .row
        .col-xs-12.section-heading.heading.line
          h2 {{ articleTitle  }}
      .row.short-desc.relative
        ui-morph(type="morph4" size="small" class="left3")
        .col-xs-12.col-md-5.relative
          p {{ shortDescription }}
        .col-xs-12.col-md-6.col-md-offset-1
          .carousel-wrap.owl-dots-left
            carousel(loop=true :items=1 :dots="true" :nav="false")
              <img src="https://placeimg.com/200/200/any?1">
              <img src="https://placeimg.com/200/200/any?2">
              <img src="https://placeimg.com/200/200/any?3">
              <img src="https://placeimg.com/200/200/any?4">
      .row.desc-wrap
        .col-xs-12.col-sm-6
          .desc(v-html="description")
        .col-xs-12.col-sm-6
          .desc(v-html="description")
      app-c-a
      .spacer
    app-why-us(morph="true")
    .spacer
    app-reviews
    .spacer
</template>

<script>
import appWhyUs from "@/components/WhyUs";
import appReviews from "@/components/Reviews";
import appCA from "@/components/CA";
import contentService from "@/services/ContentService";
import carousel from "vue-owl-carousel";
import uiMorph from "@/components/ui/Morph";

export default {
  components: {
    appWhyUs,
    appReviews,
    appCA,
    carousel,
    uiMorph
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
  font-size: 18px;
  line-height: 1.56;
  color: #4a4a4a;
  padding-right: 40px;
}

.desc-wrap {
  padding-bottom: 85px;
}

.short-desc {
  border-bottom: 1px solid rgba(#8395a7, 0.1);
  padding-bottom: 85px;
  margin-bottom: 60px;

  @media only screen and (min-width: 64em) {
    margin-top: 30px;
  }

  p {
    font-size: 24px;
    font-weight: normal;
    font-style: normal;
    font-stretch: normal;
    line-height: 1.42;
    letter-spacing: normal;
    color: #000000;
    white-space: pre-wrap;
  }
}
</style>
