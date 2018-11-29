<template lang="pug">
  .box.box-default
    .box-header.with-border
      h3.box-title Members
      .box-tools.pull-right
        button.btn.btn-box-toolbtn.btn-box-tool
          i.fa.fa-minus
    .row
      .col-xs-12
        div(v-for="item in list" :key="item.id")
          span {{ item.id }}
          span {{ item.fullname }}
          span {{ item.position }}
    form.box-body(@submit.prevent="save")
      .form-group
        label(for="t1") Fullname 
        input#t1.form-control(v-model="fullname" type="text" placeholder="Title")
      .form-group
        label(for="t2") Position
        textarea#t2.form-control(v-model="position" placeholder="Description")
      button.btn.btn-block.btn-success Save
</template>

<script>
import contentService from "@/services/ContentService";

export default {
  props: ["page"],
  data() {
    return {
      position: null,
      fullname: null,
      list: null
    };
  },
  methods: {
    async save() {
      this.error = "";

      await contentService.team.save({
        position: this.position,
        fullname: this.fullname
      });

      this.position = null;
      this.fullname = null;
    },
    async get() {
      const list = (await contentService.team.get()).data;

      this.list = list;
    }
  },
  mounted() {
    this.get();
  }
};
</script>
