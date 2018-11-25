<template lang="pug">
  dev
    section.content-header
      h1 Service Page
    section.content
      app-meta
      | Other content
</template>

<script>
import appMeta from '@/components/content-blocks/Meta';

export default {
  components: {
    appMeta
  }
}
</script>
