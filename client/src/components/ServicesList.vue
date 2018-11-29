<template lang="pug">
  section
    .container-fluid
      .row
        .col-xs-12.section-heading
          h2 {{ title }}
      .row
        .col-xs-6(v-for="item in items" :key="item.id")
          img(:src="require('../assets/img/what-we-do/'+item.icon+'.svg')", alt="")
          h3 {{ item.title }}
          p {{ item.shortDescription }}
          router-link(:to="{ name: 'what-we-do-item', params: { slug: item.slug } }") Learn more
      .row
        .col-xs-12.center-xs
          router-link.ui-btn(:to="{ name: 'what-we-do' }") {{ buttonText }}
</template>

<script>
import contentService from "@/services/ContentService";

export default {
  data() {
    return {
      title: null,
      items: [],
      buttonText: null
    };
  },
  props: ["gallery"],
  methods: {
    async get() {
      const blockInfo = (await contentService.blockInfo.get({
        page: "what-we-do"
      })).data;
      const list = (await contentService.whatWeDo.get()).data;

      this.items = list;
      this.title = blockInfo.title;
      this.buttonText = blockInfo.buttonText;
    }
  },
  mounted() {
    this.get();
  }
};
</script>
