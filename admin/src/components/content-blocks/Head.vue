<template lang="pug">
  .box.box-default
    .box-header.with-border
      h3.box-title Head
    form.box-body(@submit.prevent="save")
      .form-group
        label(for="caption1") Title
        input#caption1.form-control(v-model="title" type="text" placeholder="Title")
      .form-group
        label(for="caption2") Caption
        textarea#caption2.form-control(v-model="caption" placeholder="Caption")
      button.btn.btn-block.btn-success Save
</template>

<script>
import contentService from '@/services/ContentService'

export default {
  data() {
    return {
      title: null,
      caption: null,
    }
  },
  props: ['page'],
  methods: {
    async save() {
      await contentService.head.save({
        title: this.title,
        caption: this.caption,
        page: this.page
      })
    },
    async get() {
      const meta = (await contentService.head.get({
        page: this.page
      })).data

      this.title = meta.title;
      this.caption = meta.caption;
    }
  },
  mounted() {
    this.get()
  }
}
</script>
