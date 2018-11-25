<template lang="pug">
  .box.box-default
    .box-header.with-border
      h3.box-title Customer Reviews
      .box-tools.pull-right
        button.btn.btn-box-toolbtn.btn-box-tool
          i.fa.fa-minus
    .row
      .col-xs-12
        div(v-for="item in items" :key="item.id")
          span {{ item.id }}
          span {{ item.title }}
    form.box-body(@submit.prevent="save")
      .form-group
        label(for="r1_1") Title
        input#r1_1.form-control(v-model="title" type="text" placeholder="Title")
      .form-group
        label(for="r3") Slug
        input#r3.form-control(v-model="slug" type="text" placeholder="Slug")
      .form-group
        label(for="r2") Short description
        textarea#r2.form-control(v-model="shortDescription" placeholder="Short description")
      button.btn.btn-block.btn-success Save
</template>

<script>
import contentService from '@/services/ContentService'

export default {
  data() {
    return {
      items: [],
      title: null,
      shortDescription: null,
      slug: null
    }
  },
  methods: {
    async save() {
     // this.error = ''

      await contentService.whatWeDo.save({
        title: this.title,
        shortDescription: this.shortDescription,
        slug: this.slug
      })

      this.title = null
      this.shortDescription = null
      this.slug = null
      this.get();
    },
    async get() {
      const list = (await contentService.whatWeDo.get()).data

      console.log(list)

      this.items = list;
      // this.description = meta.description;
      // this.keywords = meta.keywords;
    }
  },
  mounted() {
    this.get()
  }
}
</script>
