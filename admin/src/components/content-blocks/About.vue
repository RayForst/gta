<template lang="pug">
  form(@submit.prevent="save")
    .form-group
      label(for="testid-2") Description
      wysiwyg#testid-2(v-model="description")
    .form-group
      label(for="r2") Short Description
      textarea#r2.form-control(v-model="shortDescription" placeholder="text")
    button.btn.btn-block.btn-success Save
</template>

<script>
import contentService from "@/services/ContentService";

export default {
  data() {
    return {
      description: null,
      shortDescription: null
    };
  },
  methods: {
    async save() {
      await contentService.about.save({
        shortDescription: this.shortDescription,
        description: this.description
      });
    },
    async get() {
      const meta = (await contentService.about.get({
        id: 1
      })).data;
      this.shortDescription = meta.shortDescription;
      this.description = meta.description;
    }
  },
  mounted() {
    this.get();
  }
};
</script>
