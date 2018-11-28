<template lang="pug">
  .box.box-default
    .box-header.with-border
      h3.box-title What we do
      .box-tools.pull-right
        button.btn.btn-box-toolbtn.btn-box-tool
          i.fa.fa-minus
    .row
      .col-xs-12
        div(v-for="item in items" :key="item.id")
          span {{ item.id }}
          span {{ item.title }}
          span {{ item.slug }}
          span {{ item.icon }}.svg
          span(@click="edit(item.id)")
            u Edit
    form.box-body(@submit.prevent="save")
      .form-group
        label(for="r1") Title
        input#r1.form-control(v-model="title" type="text" placeholder="Title")
      .form-group
        label(for="r6") Article Title
        input#r6.form-control(v-model="articleTitle" type="text" placeholder="Title")
      .form-group
        label(for="r3") Slug
        input#r3.form-control(v-model="slug" type="text" placeholder="Slug")
      .form-group
        label(for="r4") Icon
        select#r4.form-control(v-model="icon" )
          option(v-for="icon in icons" :key="icon" value=icon) {{ icon }}
      .form-group
        label(for="r2") Short description
        textarea#r2.form-control(v-model="shortDescription" placeholder="Short description")
      .form-group
        label(for="testid-2") Description
        wysiwyg#testid-2(v-model="description")

      button.btn.btn-block.btn-success Save
</template>

<script>
import contentService from "@/services/ContentService";

export default {
  data() {
    return {
      icons: ["3d-letters", "decals", "glass", "large", "promo", "sandvich"],
      items: [],
      description: null,
      title: null,
      shortDescription: null,
      slug: null,
      icon: null,
      articleTitle: null
    };
  },
  methods: {
    async save() {
      await contentService.whatWeDo.save({
        title: this.title,
        shortDescription: this.shortDescription,
        slug: this.slug,
        description: this.description,
        icon: this.icon,
        articleTitle: this.articleTitle
      });

      this.title = null;
      this.articleTitle = null;
      this.shortDescription = null;
      this.slug = null;
      this.icon = null;
      this.description = null;
      this.get();
    },
    async get() {
      this.items = (await contentService.whatWeDo.get()).data;
    },
    edit(id) {
      const selected = this.items.filter(obj => obj.id === id)[0];

      this.title = selected.title;
      this.articleTitle = selected.articleTitle;
      this.shortDescription = selected.shortDescription;
      this.slug = selected.slug;
      this.icon = selected.icon;
      this.description = selected.description;
    }
  },
  mounted() {
    this.get();
  }
};
</script>
