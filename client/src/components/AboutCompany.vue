<template lang="pug">
  section
    .container-fluid
      .row
        .col-xs-12
          h2 {{ title }}
          p.caption {{ caption }}
          p {{ text }}
          router-link(:to="{ name: 'about' }") Learn more
</template>

<script>
import contentService from '@/services/ContentService'

export default {
  data() {
    return {
      title: null,
      caption: null,
      buttonText: null,
      text: null,
    }
  },
  methods: {
    async get() {
      const blockInfo = (await contentService.blockInfo.get({
        page: 'about-company'
      })).data

      const content = (await contentService.aboutCompany.get({
        id: 1
      })).data
    
      this.title = blockInfo.title;
      this.caption = blockInfo.caption
      this.buttonText = blockInfo.buttonText
      this.text = content.text
    }
  },
  mounted() {
    this.get()
  }
}
</script>