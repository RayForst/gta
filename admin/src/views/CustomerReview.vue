<template lang="pug">
  div
    section.content-header
      h1 Customer reviews
    section.content
      app-tabs
        app-tab(name="Block info" :selected="true")
          app-block-info(page='customer-review')
        app-tab(name="Content")
          app-customer-reviews-list
</template>

<script>
import appBlockInfo from '@/components/content-blocks/BlockInfo';
import appCustomerReviewsList from '@/components/content-blocks/CustomerReviewsList';
import appTabs from "@/components/Tabs";
import appTab from "@/components/Tab";

export default {
  components: {
    appBlockInfo,
    appCustomerReviewsList,
    appTabs,
    appTab
  }
}
</script>
