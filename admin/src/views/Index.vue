<template lang="pug">
  div
    section.content-header
      h1 Index
    section.content
      app-tabs
        app-tab(name="Meta" :selected="true")
          app-meta(page="index")
        app-tab(name="Heading")
          app-head(page="index")
        app-tab(name="About company")
          app-block-info(page='about-company', name='About company' button="false")
</template>

<script>
import appBlockInfo from "@/components/content-blocks/BlockInfo";
import appMeta from "@/components/content-blocks/Meta";
import appHead from "@/components/content-blocks/Head";
import appTabs from "@/components/Tabs";
import appTab from "@/components/Tab";

export default {
  components: {
    appMeta,
    appHead,
    appBlockInfo,
    appTabs,
    appTab
  }
};
</script>
