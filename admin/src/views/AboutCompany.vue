<template lang="pug">
  div
    section.content-header
      h1 About company
    section.content
      app-about-company
</template>

<script>
import appAboutCompany from '@/components/content-blocks/AboutCompany';

export default {
  components: {
    appAboutCompany
  }
}
</script>
