<template lang="pug">
  div
    form(@submit.prevent="save")
      .form-group
        label(for="meta_title") Title
        input#meta_title.form-control(v-model="title" type="text" placeholder="Title")
      .form-group
        label(for="meta_keywords") Keywords
        input#meta_keywords.form-control(v-model="keywords" type="text" placeholder="Keywords")
      .form-group
        label(for="meta_description") Description
        textarea#meta_description.form-control(v-model="description" placeholder="Description")
      .btn-grp
        button.btn.btn-success Save
        button(@click="cancel" type="button").btn.btn-danger Cancel
</template>

<script>
import contentService from "@/services/ContentService";

export default {
  props: ["page"],
  data() {
    return {
      title: null,
      description: null,
      keywords: null
    };
  },
  methods: {
    async save() {
      this.error = "";

      await contentService.meta.save({
        title: this.title,
        description: this.description,
        keywords: this.keywords,
        page: this.page
      });
    },
    async get() {
      const meta = (await contentService.meta.get({
        page: this.page
      })).data;

      this.title = meta.title;
      this.description = meta.description;
      this.keywords = meta.keywords;
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
