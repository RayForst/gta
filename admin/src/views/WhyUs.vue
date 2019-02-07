<template lang="pug">
  div
    section.content-header
      h1 Why Us
    section.content
      app-tabs
        app-tab(name="Block info" :selected="true")
          app-block-info(page='why-us' button="false")
        app-tab(name="Content")
          app-why-us-list
</template>

<script>
import appBlockInfo from '@/components/content-blocks/BlockInfo';
import appWhyUsList from '@/components/content-blocks/WhyUsList';
import appTabs from "@/components/Tabs";
import appTab from "@/components/Tab";

export default {
  components: {
    appBlockInfo,
    appWhyUsList,
    appTabs,
    appTab
  }
}
</script>
