<template lang="pug">
  .nav-tabs-custom
    ul.nav.nav-tabs
      li(v-for="tab in tabs" :class="{ 'active': tab.isActive }")
        a(:href="tab.href" @click="selectTab(tab)") {{ tab.name }}
    .tab-content
      slot
</template>

<script>
export default {
  data() {
    return {
      tabs: []
    };
  },
  created() {
    console.log(this.$children);
    this.tabs = this.$children;
  },
  methods: {
    selectTab(selectedTab) {
      this.tabs.forEach(tab => {
        tab.isActive = tab.name == selectedTab.name;
      });
    }
  }
};
</script>
