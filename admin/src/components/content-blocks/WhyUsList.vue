<template lang="pug">
  .box.box-default
    .box-header.with-border
      h3.box-title Why us list
      .box-tools.pull-right
        button.btn.btn-box-toolbtn.btn-box-tool
          i.fa.fa-minus
    .row
      .col-xs-12
        div(v-for="item in items" :key="item.id")
          span {{ item.id }}
          span {{ item.text }}
          span {{ item.icon }}
    form.box-body(@submit.prevent="save")
      .form-group
        label(for="r1") text
        input#r1.form-control(v-model="text" type="text" placeholder="Title")
      .form-group
        label(for="r3") icon
        input#r3.form-control(v-model="icon" type="text" placeholder="Slug")
      button.btn.btn-block.btn-success Save
</template>

<script>
import contentService from '@/services/ContentService'

export default {
  data() {
    return {
      items: [],
      text: null,
      icon: null,
    }
  },
  methods: {
    async save() {
      await contentService.whyUs.save({
        icon: this.icon,
        text: this.text,
      })

      this.text = null
      this.icon = null
      this.get();
    },
    async get() {
      const list = (await contentService.whyUs.get()).data

      this.items = list;
    }
  },
  mounted() {
    this.get()
  }
}
</script>
