<template lang="pug">
  div
    section.content-header
      h1 About Page
    section.content
      app-meta
      app-head(page="about")
</template>

<script>
import appMeta from '@/components/content-blocks/Meta';
import appHead from '@/components/content-blocks/Head';

export default {
  components: {
    appMeta,
    appHead
  }
}
</script>
