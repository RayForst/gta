<template lang="pug">
  div
    section.content-header
      h1 What we do
    section.content
      app-tabs
        app-tab(name="Meta")
          app-meta(page="what-we-do")
        app-tab(name="Head")
          app-head(page="what-we-do")
        app-tab(name="Block info")
          app-block-info(page='what-we-do')
        app-tab(name="What we do" :selected="true")
          app-what-we-do-list
          app-what-we-do
</template>

<script>
import appMeta from "@/components/content-blocks/Meta";
import appHead from "@/components/content-blocks/Head";
import appBlockInfo from "@/components/content-blocks/BlockInfo";
import appWhatWeDo from "@/components/content-blocks/WhatWeDo";
import appWhatWeDoList from "@/components/content-blocks/WhatWeDoList";
import appTabs from "@/components/Tabs";
import appTab from "@/components/Tab";

export default {
  components: {
    appMeta,
    appHead,
    appBlockInfo,
    appWhatWeDo,
    appWhatWeDoList,
    appTabs,
    appTab
  }
};
</script>
