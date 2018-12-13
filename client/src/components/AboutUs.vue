<template lang="pug">
  section.relative
    <div class="morph-wrap">
      <svg class="morph" width="1400" height="770" viewBox="0 0 1400 770">
        <path d="M 415.6,206.3 C 407.4,286.6 438.1,373.6 496.2,454.8 554.3,536.1 497,597.2 579.7,685.7 662.4,774.1 834.3,731.7 898.5,653.4 962.3,575 967.1,486 937.7,370 909.3,253.9 937.7,201.5 833.4,105.4 729.3,9.338 602.2,13.73 530.6,41.91 459,70.08 423.9,126.1 415.6,206.3 Z"/>
      </svg>
    </div>
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
    carousel
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
