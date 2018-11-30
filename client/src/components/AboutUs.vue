<template lang="pug">
  section
    .container-fluid
      .row
        .section-heading.col-xs-12
          h2 {{ title }}
          p.caption {{ caption }}
      .row
        .col-xs-6
          p(v-html="description")
        .col-xs-6
          .carousel-wrap
            carousel(loop=true :items=1 :dots="true" :nav="false")
              <img src="https://placeimg.com/200/200/any?1">
              <img src="https://placeimg.com/200/200/any?2">
              <img src="https://placeimg.com/200/200/any?3">
              <img src="https://placeimg.com/200/200/any?4">
      .row
        .col-xs-6
          .carousel-wrap
            carousel(loop=true :items=1 :dots="true" :nav="false")
              <img src="https://placeimg.com/200/200/any?1">
              <img src="https://placeimg.com/200/200/any?2">
              <img src="https://placeimg.com/200/200/any?3">
              <img src="https://placeimg.com/200/200/any?4">
        .col-xs-6
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