<template lang="pug">
  section
    .container-fluid
      .row
        .col-xs-12.section-heading
          h2 {{ title }}
          p.caption {{ caption }}
      .row
          .col-xs-3(v-for="item in list" :key="item.id")
              div {{ item.fullname }}
              div {{ item.position }}
</template>

<script>
import contentService from "@/services/ContentService";

export default {
  data() {
    return {
      title: null,
      caption: null,
      list: null
    };
  },
  methods: {
    async get() {
      const blockInfo = (await contentService.blockInfo.get({
        page: "team"
      })).data;

      const content = (await contentService.team.get()).data;

      this.title = blockInfo.title;
      this.caption = blockInfo.caption;
      this.list = content;
    }
  },
  mounted() {
    this.get();
  }
};
</script>
