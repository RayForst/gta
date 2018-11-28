<template lang="pug">
  div
    section.content-header
      h1 Index Page
    section.content
      app-meta(page="index")
      app-head(page="index")
      app-block-info(page='about-company', name='About company')
</template>

<script>
import appBlockInfo from '@/components/content-blocks/BlockInfo';
import appMeta from '@/components/content-blocks/Meta';
import appHead from '@/components/content-blocks/Head';

export default {
  components: {
    appMeta,
    appHead,
    appBlockInfo
  }
}
</script>
