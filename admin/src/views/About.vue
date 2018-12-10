<template lang="pug">
  div
    section.content-header
      h1 About us
    section.content
      app-tabs
        app-tab(name="Meta" :selected="true")
          app-meta(page="about")
        app-tab(name="Head")
          app-head(page="about")
        app-tab(name="Block info")
          app-block-info(page='about')
        app-tab(name="Content")
          app-about
</template>

<script>
import appBlockInfo from "@/components/content-blocks/BlockInfo";
import appMeta from "@/components/content-blocks/Meta";
import appHead from "@/components/content-blocks/Head";
import appAbout from "@/components/content-blocks/About";
import appTabs from "@/components/Tabs";
import appTab from "@/components/Tab";

export default {
  components: {
    appMeta,
    appHead,
    appBlockInfo,
    appAbout,
    appTabs,
    appTab
  }
};
</script>
