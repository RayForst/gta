<template lang="pug">
  div
    section.content-header
      h1 Team
    section.content
      app-block-info(page='team')
      app-team
</template>

<script>
import appBlockInfo from "@/components/content-blocks/BlockInfo";
import appTeam from "@/components/content-blocks/Team";

export default {
  components: {
    appTeam,
    appBlockInfo
  }
};
</script>
