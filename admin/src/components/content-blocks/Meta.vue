<template lang="pug">
  .box.box-default
    .box-header.with-border
      h3.box-title Meta Information
      .box-tools.pull-right
        button.btn.btn-box-toolbtn.btn-box-tool
          i.fa.fa-minus
    form.box-body(@submit.prevent="save")
      .form-group
        label(for="t1") Title
        input#t1.form-control(v-model="title" type="text" placeholder="Title")
      .form-group
        label(for="t2") Description
        textarea#t2.form-control(v-model="description" placeholder="Description")
      .form-group
        label(for="t3") Keywords
        input#t3.form-control(v-model="keywords" type="text" placeholder="Keywords")
      button.btn.btn-block.btn-success Save
</template>

<script>
import contentService from '@/services/ContentService'

export default {
  props: ['page'],
  data() {
    return {
      title: null,
      description: null,
      keywords: null
    }
  },
  methods: {
    async save() {
      this.error = ''

      await contentService.meta.save({
        title: this.title,
        description: this.description,
        keywords: this.keywords,
        page: this.page
      })
    },
    async get() {
      const meta = (await contentService.meta.get({
        page: this.page
      })).data

      console.log(meta)

      this.title = meta.title;
      this.description = meta.description;
      this.keywords = meta.keywords;
    }
  },
  mounted() {
    this.get()
  }
}
</script>
