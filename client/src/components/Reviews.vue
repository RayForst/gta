<template lang="pug">
  section
    .container-fluid
      .row
        .section-heading.col-xs-12
          h2 {{ title }}
          p.caption {{ caption }}
      .row
        .col-xs-12
          div(v-for="item in items" :key="item.id")
            span {{ item.id }}
            span {{ item.person_name }}
            span {{ item.person_position }}
            span {{ item.comment }}
      .row
        .col-xs-12
          router-link(:to="{ name: 'works' }") {{ buttonText }}
</template>

<script>
import contentService from "@/services/ContentService";

export default {
  data() {
    return {
      title: null,
      caption: null,
      items: [],
      buttonText: null
    };
  },
  props: ["gallery"],
  methods: {
    async get() {
      const blockInfo = (await contentService.blockInfo.get({
        page: "customer-review"
      })).data;
      const list = (await contentService.customerReviews.get()).data;

      this.items = list;
      this.title = blockInfo.title;
      this.caption = blockInfo.caption;
      this.buttonText = blockInfo.buttonText;
    }
  },
  mounted() {
    this.get();
  }
};
</script>

