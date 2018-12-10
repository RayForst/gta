<template lang="pug">
  dev
    section.content-header
      h1 Contact us
    section.content
     app-tabs
      app-tab(name="Meta" :selected="true")
        app-meta(page="contacts")
      app-tab(name="Head")
        app-head(page="contacts")
</template>

<script>
import appMeta from "@/components/content-blocks/Meta";
import appHead from "@/components/content-blocks/Head";
import appTabs from "@/components/Tabs";
import appTab from "@/components/Tab";

export default {
  components: {
    appMeta,
    appHead,
    appTabs,
    appTab
  }
};
</script>
