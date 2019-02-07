<template lang="pug">
  div
    section.content-header
      h1 Team
    section.content
      app-tabs
        app-tab(name="Block info" :selected="true")
          app-block-info(page='team' button="false")
        app-tab(name="Content")
          app-team
</template>

<script>
import appBlockInfo from "@/components/content-blocks/BlockInfo";
import appTeam from "@/components/content-blocks/Team";
import appTabs from "@/components/Tabs";
import appTab from "@/components/Tab";

export default {
  components: {
    appTeam,
    appBlockInfo,
    appTabs,
    appTab
  }
};
</script>
