<template lang="pug">
  div
    section.content-header
      h1 Customer reviews
    section.content
      app-meta(page='what-we-do')
      app-block-info(page='what-we-do')
</template>

<script>
import appMeta from '@/components/content-blocks/Meta';
import appBlockInfo from '@/components/content-blocks/BlockInfo';

export default {
  components: {
    appMeta,
    appBlockInfo,
  }
}
</script>
