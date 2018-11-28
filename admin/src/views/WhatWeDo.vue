<template lang="pug">
  div
    section.content-header
      h1 What we do Page
    section.content
      app-meta
      app-head(page="what-we-do")
      app-block-info(page='what-we-do')
      app-what-we-do
</template>

<script>
import appMeta from '@/components/content-blocks/Meta';
import appHead from '@/components/content-blocks/Head';
import appBlockInfo from '@/components/content-blocks/BlockInfo';
import appWhatWeDo from '@/components/content-blocks/WhatWeDo';

export default {
  components: {
    appMeta,
    appHead,
    appBlockInfo,
    appWhatWeDo
  }
}
</script>
