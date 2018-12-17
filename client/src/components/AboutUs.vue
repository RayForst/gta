<template lang="pug">
  section.relative
    ui-morph(type="morph3" size="large" class="right2")
    .container-fluid.small
      .row
        .section-heading.col-xs-12
          h2 {{ title }}
          p.caption {{ caption }}
      .row.desc-wrap
        .col-xs-12.col-sm-5
          p(v-html="description")
        .col-xs-12.col-sm-6.col-sm-offset-1
          .carousel-wrap
            carousel(loop=true :items=1 :dots="true" :nav="false")
              <img src="https://placeimg.com/200/200/any?1">
              <img src="https://placeimg.com/200/200/any?2">
              <img src="https://placeimg.com/200/200/any?3">
              <img src="https://placeimg.com/200/200/any?4">
      .spacer
      .row.short-desc-wrap
        .col-xs-12.col-sm-6.last-xs.first-sm
          .carousel-wrap
            carousel(loop=true :items=1 :dots="true" :nav="false")
              <img src="https://placeimg.com/200/200/any?1">
              <img src="https://placeimg.com/200/200/any?2">
              <img src="https://placeimg.com/200/200/any?3">
              <img src="https://placeimg.com/200/200/any?4">
        .col-xs-12.col-sm-5.col-sm-offset-1
          p {{ shortDescription }}
</template>


<script>
import contentService from "@/services/ContentService";
import carousel from "vue-owl-carousel";
import uiMorph from "@/components/ui/Morph";

export default {
  data() {
    return {
      title: null,
      caption: null,
      description: null,
      shortDescription: null
    };
  },
  components: {
    carousel,
    uiMorph
  },
  methods: {
    async get() {
      const blockInfo = (await contentService.blockInfo.get({
        page: "about"
      })).data;

      const content = (await contentService.about.get({
        id: 1
      })).data;

      this.title = blockInfo.title;
      this.caption = blockInfo.caption;
      this.description = content.description;
      this.shortDescription = content.shortDescription;
    }
  },
  mounted() {
    this.get();
  }
};
</script>

<style lang="stylus" scoped>
.desc-wrap {
  p {
    font-size: 16px;
    font-weight: normal;
    font-style: normal;
    font-stretch: normal;
    line-height: 1.5;
    letter-spacing: normal;
    color: #000000;
  }
}

.short-desc-wrap {
  p {
    font-size: 22px;
    font-weight: normal;
    font-style: normal;
    font-stretch: normal;
    line-height: 1.64;
    letter-spacing: normal;
    color: #000000;
  }
}
</style>
