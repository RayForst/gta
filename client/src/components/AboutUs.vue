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
          | Gallery
      .row
        .col-xs-6
          | Gallery
        .col-xs-6
          p {{ shortDescription }}
</template>


<script>
import contentService from "@/services/ContentService";

export default {
  data() {
    return {
      title: null,
      caption: null,
      description: null,
      shortDescription: null
    };
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