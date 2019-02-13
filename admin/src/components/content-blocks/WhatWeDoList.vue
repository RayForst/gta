<template lang="pug">
  .box.box-default
    .box-header.with-border
      h3.box-title List
    .row
      .col-xs-12
        table.table.table-bordered.table-hover.dataTable
          thead(:class="{editId: editId}")
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
              td
                img(width="70" v-if="item.icon" :src="require('../../assets/img/what-we-do/'+item.icon+'.svg')", alt="")
              td
                span.edit(@click="edit(item.id)") Edit
                span.delete(@click="remove(item.id)") Delete
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
  computed: {
    editId() {
      this.get();
      return this.$store.state.whatWeDoId  ? this.$store.state.whatWeDoId : '';
    }
  },
  methods: {
    async get() {
      this.items = (await contentService.whatWeDo.get()).data;
    },
    edit(id) {
      console.log('edit id',id);
       this.$store.dispatch("whatWeDoEdit", id);
    },
    async remove(id) {
      if (confirm('Are you sure you want to delete this item?')) {
        this.$store.dispatch("whatWeDoEdit", null);
        await contentService.whatWeDo.remove({id})
        this.get();
      }
    }
  },
  mounted() {
    this.get();
  }
};
</script>
