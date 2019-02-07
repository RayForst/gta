<template lang="pug">
  div
    .box.box-default
      .box-header.with-border
        h3.box-title List
      .row
        .col-xs-12
          table.table.table-bordered.table-hover.dataTable
            thead
              tr(role="row")
                th Id
                th Name
                th Position
                th Comment
                th Actions
            tbody
              tr(v-for="item in items" :key="item.id")
                td {{ item.id }}
                td {{ item.person_name }}
                td {{ item.person_position }}
                td {{ item.comment }}
                td
                  span.edit(@click="edit(item.id)") Edit
                  span.delete(@click="remove(item.id)") Delete
    .box.box-default
      .box-header.with-border
        h3.box-title Add
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
        .btn-grp
          button.btn.btn-success Save
          button(@click="cancel" type="button").btn.btn-danger Cancel
          transition(name="fade")
            span.success-status(v-if="success")
              b Successfully Saved!
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
    },
    cancel() {
      this.get();
    }
  },
  mounted() {
    this.get()
  }
}
</script>
