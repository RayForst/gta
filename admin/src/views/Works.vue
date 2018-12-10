<template lang="pug">
  div
    section.content-header
      h1 Our works
    section.content
      app-tabs
        app-tab(name="Meta" :selected="true")
          app-meta(page="works")
        app-tab(name="Head")
          app-head(page="works")
        app-tab(name="Block info")
          app-block-info(page='works')
        app-tab(name="What we do")
          app-works-list
          app-works-add
</template>

<script>
import appBlockInfo from "@/components/content-blocks/BlockInfo";
import appMeta from "@/components/content-blocks/Meta";
import appHead from "@/components/content-blocks/Head";
import contentService from "@/services/ContentService";
import appWorksList from "@/components/content-blocks/WorkList";
import appWorksAdd from "@/components/content-blocks/WorkAdd";
import appTabs from "@/components/Tabs";
import appTab from "@/components/Tab";

export default {
  data() {
    return {};
  },
  components: {
    appMeta,
    appHead,
    appBlockInfo,
    appWorksList,
    appWorksAdd,
    appTabs,
    appTab
  }
};
</script>
