<template lang="pug">
  div
    section.content-header
      h1 Why Us
    section.content
      app-block-info(page='why-us')
      app-why-us-list
</template>

<script>
import appBlockInfo from '@/components/content-blocks/BlockInfo';
import appWhyUsList from '@/components/content-blocks/WhyUsList';

export default {
  components: {
    appBlockInfo,
    appWhyUsList
  }
}
</script>
