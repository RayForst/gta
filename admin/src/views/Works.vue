<template lang="pug">
  div
    section.content-header
      h1 Works Page
    section.content
      app-meta
      app-head(page="works")
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
              span {{ item.title }}
              span {{ item.category }}
        form.box-body(@submit.prevent="save")
          .form-group
            label(for="r1") Title
            input#r1.form-control(v-model="title" type="text" placeholder="Title")
          .form-group
            label(for="r3") Category
            input#r3.form-control(v-model="category" type="text" placeholder="Category")
          button.btn.btn-block.btn-success Save
</template>

<script>
import appMeta from "@/components/content-blocks/Meta";
import appHead from "@/components/content-blocks/Head";
import contentService from "@/services/ContentService";

export default {
  data() {
    return {
      items: [],
      title: null,
      category: null
    };
  },
  components: {
    appMeta,
    appHead
  },
  methods: {
    async save() {
      await contentService.work.save({
        title: this.title,
        category: this.category
      });
      this.title = null;
      this.category = null;
      this.get();
    },
    async get() {
      const list = (await contentService.work.get()).data;

      this.items = list;
    }
  },
  mounted() {
    this.get();
  }
};
</script>
