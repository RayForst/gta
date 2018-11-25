<template lang="pug">
  div
    section.content-header
      h1 Index Page
    section.content
      app-meta(page="index")
      .box.box-default
        .box-header.with-border
          h3.box-title Head
        .box-body
          .form-group
            label(for="t1") Title
            input#t1.form-control(type="text" placeholder="Title")
          .form-group
            label(for="t2") Description
            textarea#t2.form-control(placeholder="Description")
          .form-group
            label(for="t3") Button text
            input#t3.form-control(type="text" placeholder="Keywords")
      .box.box-default
        .box-header.with-border
          h3.box-title Services
        .box-body
          .form-group
            label(for="t1") Title
            input#t1.form-control(type="text" placeholder="Title")
          .form-group
            label(for="t2") Description
            textarea#t2.form-control(placeholder="Description")
</template>

<script>
import appMeta from '@/components/content-blocks/Meta';

export default {
  components: {
    appMeta
  }
}
</script>
