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
              th Category
              th Actions
          tbody
            tr(v-for="item in items" :key="item.id")
              td {{ item.id }}
              td {{ item.title }}
              td {{ item.slug }}
              td {{ item.category }}
              td
                u(@click="edit(item.id)") Edit
</template>

<script>
import appBlockInfo from "@/components/content-blocks/BlockInfo";
import appMeta from "@/components/content-blocks/Meta";
import appHead from "@/components/content-blocks/Head";
import contentService from "@/services/ContentService";

export default {
  data() {
    return {
      items: []
    };
  },
  methods: {
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
