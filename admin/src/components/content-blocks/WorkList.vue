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
                span.edit(@click="edit(item.id)") Edit
                span.delete(@click="remove(item.id)") Delete
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
  computed: {
    editId() {
      return this.$store.state.ourWorksId
    }
  },
  methods: {
    async get() {
      const list = (await contentService.work.get()).data;

      this.items = list;
    },
    edit(id) {
      this.$store.dispatch("ourWorksEdit", id);
    },
    async remove(id) {
      if (confirm('Are you sure you want to delete this item?')) {
        this.$store.dispatch("ourWorksEdit", null);
        await contentService.work.remove({id})
        this.get(); 
      }
    }
  },
  watch: {
    editId (newId, oldId) {
      console.log('WATCH IN LIST')
      this.get();
    }
  },
  mounted() {
    this.get();
  }
};
</script>
