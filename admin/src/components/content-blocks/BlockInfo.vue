<template lang="pug">
  form(@submit.prevent="save")
    .form-group
      label(for="tp1") Title
      input#tp1.form-control(v-model="title" type="text" placeholder="Title")
    .form-group
      label(for="tp2") Caption
      input#tp2.form-control(v-model="caption" placeholder="Caption")
    .form-group(v-if="button !== 'false'")
      label(for="tp3") Button text
      input#tp3.form-control(v-model="buttonText" type="text" placeholder="buttonText")
    .btn-grp
      button.btn.btn-success Save
      button(@click="cancel" type="button").btn.btn-danger Cancel
</template>

<script>
import contentService from "@/services/ContentService";

export default {
  props: ["page", "name", "button"],
  data() {
    return {
      title: null,
      caption: null,
      buttonText: null
    };
  },
  methods: {
    async save() {
      this.error = "";

      await contentService.blockInfo.save({
        title: this.title,
        caption: this.caption,
        buttonText: this.buttonText,
        page: this.page
      });
    },
    async get() {
      const meta = (await contentService.blockInfo.get({
        page: this.page
      })).data;

      this.title = meta.title;
      this.caption = meta.caption;
      this.buttonText = meta.buttonText;
    },
    cancel() {
      this.get();
    }
  },
  mounted() {
    this.get();
  }
};
</script>
