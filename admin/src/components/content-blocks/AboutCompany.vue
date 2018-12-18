<template lang="pug">
  .box.box-default
    .box-header.with-border
      h3.box-title Content
      .box-tools.pull-right
        button.btn.btn-box-toolbtn.btn-box-tool
          i.fa.fa-minus
    form.box-body(@submit.prevent="save")
      .form-group
        label(for="r2") Text
        textarea#r2.form-control(v-model="text" placeholder="text")
      button.btn.btn-block.btn-success Save
</template>

<script>
import contentService from "@/services/ContentService";

export default {
  data() {
    return {
      text: null
    };
  },
  methods: {
    async save() {
      await contentService.aboutCompany.save({
        text: this.text
      });
    },
    async get() {
      const meta = (await contentService.aboutCompany.get({
        id: 1
      })).data;

      this.text = meta.text;
    }
  },
  mounted() {
    this.get();
  }
};
</script>
