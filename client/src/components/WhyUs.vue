<template lang="pug">
  .container-fluid
    .row
      .col-xs-12
        h2 {{ title }}
        p.caption {{ caption }}
    .row
        .col-xs-12
          div(v-for="item in list" :key="item.id")
            span {{ item.text }}
</template>


<script>
import contentService from '@/services/ContentService'

export default {
  data() {
    return {
      title: null,
      caption: null,
      list: null,
    }
  },
  methods: {
    async get() {
      const blockInfo = (await contentService.blockInfo.get({
        page: 'why-us'
      })).data

      const content = (await contentService.whyUs.get()).data
    
      this.title = blockInfo.title;
      this.caption = blockInfo.caption;
      this.list = content;
    }
  },
  mounted() {
    this.get()
  }
}
</script>
