<template lang="pug">
  div
    section.content-header
      h1 About Page
    section.content
      app-meta
      app-head(page="about")
      app-block-info(page='about')
      app-about
</template>

<script>
import appBlockInfo from "@/components/content-blocks/BlockInfo";
import appMeta from "@/components/content-blocks/Meta";
import appHead from "@/components/content-blocks/Head";
import appAbout from "@/components/content-blocks/About";

export default {
  components: {
    appMeta,
    appHead,
    appBlockInfo,
    appAbout
  }
};
</script>
