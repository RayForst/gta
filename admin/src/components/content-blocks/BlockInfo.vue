<template lang="pug">
  .box.box-default
    .box-header.with-border
      h3.box-title {{ name }} Block info
      .box-tools.pull-right
        button.btn.btn-box-toolbtn.btn-box-tool
          i.fa.fa-minus
    form.box-body(@submit.prevent="save")
      .form-group
        label(for="tp1") Title
        input#tp1.form-control(v-model="title" type="text" placeholder="Title")
      .form-group
        label(for="tp2") Caption
        input#tp2.form-control(v-model="caption" placeholder="Caption")
      .form-group
        label(for="tp3") buttonText
        input#tp3.form-control(v-model="buttonText" type="text" placeholder="buttonText")
      button.btn.btn-block.btn-success Save
</template>

<script>
import contentService from '@/services/ContentService'

export default {
  props: ['page', 'name'],
  data() {
    return {
      title: null,
      caption: null,
      buttonText: null
    }
  },
  methods: {
    async save() {
      this.error = ''

      await contentService.blockInfo.save({
        title: this.title,
        caption: this.caption,
        buttonText: this.buttonText,
        page: this.page
      })
    },
    async get() {
      const meta = (await contentService.blockInfo.get({
        page: this.page
      })).data


      this.title = meta.title;
      this.caption = meta.caption;
      this.buttonText = meta.buttonText;
    }
  },
  mounted() {
    this.get()
  }
}
</script>
