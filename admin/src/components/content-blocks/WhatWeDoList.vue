<template lang="pug">
  .box.box-default
    .box-header.with-border
      h3.box-title List
      .box-tools.pull-right
        button.btn.btn-box-toolbtn.btn-box-tool
          i.fa.fa-minus
    .row
      .col-xs-12
        table.table.table-bordered.table-hover.dataTable
          thead
            tr(role="row")
              th Id
              th Title
              th Slug
              th Icon
              th Actions
          tbody
            tr(v-for="item in items" :key="item.id")
              td {{ item.id }}
              td {{ item.title }}
              td {{ item.slug }}
              td {{ item.icon }}.svg
              td
                u(@click="edit(item.id)") Edit
</template>

<script>
import contentService from "@/services/ContentService";

export default {
  data() {
    return {
      icons: ["3d-letters", "decals", "glass", "large", "promo", "sandvich"],
      items: []
    };
  },
  methods: {
    async get() {
      this.items = (await contentService.whatWeDo.get()).data;
    }
  },
  mounted() {
    this.get();
  }
};
</script>
