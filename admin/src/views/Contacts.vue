<template lang="pug">
  dev
    section.content-header
      h1 Contacts Page
    section.content
      app-meta
      app-head(page="contacts")
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
