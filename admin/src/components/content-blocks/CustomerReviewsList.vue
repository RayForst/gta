<template lang="pug">
  .box.box-default
    .box-header.with-border
      h3.box-title Customer review list
      .box-tools.pull-right
        button.btn.btn-box-toolbtn.btn-box-tool
          i.fa.fa-minus
    .row
      .col-xs-12
        div(v-for="item in items" :key="item.id")
          span {{ item.id }}
          span {{ item.person_name }}
          span {{ item.person_position }}
          span {{ item.comment }}
    form.box-body(@submit.prevent="save")
      .form-group
        label(for="r1") Person name
        input#r1.form-control(v-model="person_name" type="text" placeholder="Title")
      .form-group
        label(for="r3") Person position
        input#r3.form-control(v-model="person_position" type="text" placeholder="Slug")
      .form-group
        label(for="r4") Comment
        textarea#r4.form-control(v-model="comment" type="text" placeholder="Slug")
      .form-group
        label(for="r2") Work url
        input#r2.form-control(v-model="work_url" placeholder="Short description")
      button.btn.btn-block.btn-success Save
</template>

<script>
import contentService from '@/services/ContentService'

export default {
  data() {
    return {
      items: [],
      person_name: null,
      person_position: null,
      comment: null,
      work_url: null,
    }
  },
  methods: {
    async save() {
      await contentService.customerReview.save({
        person_name: this.person_name,
        person_position: this.person_position,
        comment: this.comment,
        work_url: this.work_url,
      })

      this.person_name = null
      this.person_position = null
      this.comment = null
      this.work_url = null
      this.get();
    },
    async get() {
      const list = (await contentService.customerReview.get()).data

      this.items = list;
    }
  },
  mounted() {
    this.get()
  }
}
</script>
