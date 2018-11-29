<template lang="pug">
  div
    section.content-header
      h1 Works Page
    section.content
      app-meta
      app-head(page="works")
      app-block-info(page='works')
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
              span {{ item.slug }}
              span {{ item.category }}
              span(@click="edit(item.id)")
                u Edit
        form.box-body(@submit.prevent="save")
          .form-group
            label(for="r1") Title
            input#r1.form-control(v-model="title" type="text" placeholder="Title")
          .form-group
            label(for="r1") Slug
            input#r1.form-control(v-model="slug" type="text" placeholder="Slug")
          .form-group
            label(for="r3") Category
            input#r3.form-control(v-model="category" type="text" placeholder="Category")
          .form-group
            label(for="r3") Person name
            input#r3.form-control(v-model="person_name" type="text" placeholder="Person name")
          .form-group
            label(for="r3") Person company
            input#r3.form-control(v-model="person_position" type="text" placeholder="Category")
          .form-group
            label(for="r1") Person comment
            textarea#r1.form-control(v-model="comment" type="text" placeholder="Person comment")
          .form-group
            label(for="testid-2") Description
            wysiwyg#testid-2(v-model="description")
          button.btn.btn-block.btn-success Save
</template>

<script>
import appBlockInfo from "@/components/content-blocks/BlockInfo";
import appMeta from "@/components/content-blocks/Meta";
import appHead from "@/components/content-blocks/Head";
import contentService from "@/services/ContentService";

export default {
  data() {
    return {
      items: [],
      title: null,
      category: null,
      slug: null,
      person_name: null,
      person_position: null,
      comment: null,
      id: null,
      description: null
    };
  },
  components: {
    appMeta,
    appHead,
    appBlockInfo
  },
  methods: {
    async save() {
      await contentService.work.save({
        title: this.title,
        category: this.category,
        slug: this.slug,
        person_position: this.person_position,
        person_name: this.person_name,
        comment: this.comment,
        description: this.description,
        id: this.id
      });
      this.title = null;
      this.category = null;
      this.slug = null;
      this.person_name = null;
      this.person_position = null;
      this.comment = null;
      this.description = null;
      this.get();
    },
    async get() {
      const list = (await contentService.work.get()).data;

      this.items = list;
    },
    edit(id) {
      const selected = this.items.filter(obj => obj.id === id)[0];

      this.title = selected.title;
      this.category = selected.category;
      this.slug = selected.slug;
      this.person_name = selected.person_name;
      this.person_position = selected.person_position;
      this.comment = selected.comment;
      this.description = selected.description;
      this.id = selected.id;
    }
  },
  mounted() {
    this.get();
  }
};
</script>
