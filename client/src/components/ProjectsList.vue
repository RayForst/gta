<template lang="pug">
  section
    .container-fluid
      .row
        .col-xs-12.section-heading
          h2 {{ title }}
      .row
        .col-xs-12
          span(@click="changeSorting(false)") All
          span(v-for="tab in tabs" @click="changeSorting(tab)") {{ tab }}
      .row
        .col-xs-6(v-for="item in sortedList.slice(0, displayLimit)" :key="item.id")
          h3 {{ item.title }}
          p {{ item.category }} {{ item.slug }}
          router-link(:to="{ name: 'works-project', params: { slug: item.slug } }") Learn more
      .row
        .col-xs-12.center-xs
          button.ui-btn.ui-secondary(@click="increaseDisplayLimit") {{ buttonText }}
</template>

<script>
import contentService from "@/services/ContentService";

export default {
  data() {
    return {
      title: null,
      items: [],
      buttonText: "Load more",
      tabCategory: false,
      displayLimit: 5
    };
  },
  methods: {
    async get() {
      const blockInfo = (await contentService.blockInfo.get({
        page: "works"
      })).data;
      const list = (await contentService.works.get()).data;

      this.items = list;
      this.title = blockInfo.title;
    },
    sortTabs(tab) {
      alert("ssorrt");
    },
    changeSorting(category) {
      this.tabCategory = category;
    },
    increaseDisplayLimit() {
      ++this.displayLimit;
    }
  },
  computed: {
    tabs() {
      const unique = [...new Set(this.items.map(item => item.category))];
      console.log(unique);
      return unique;
    },
    sortedList() {
      console.log("sorted list");
      if (this.tabCategory) {
        return this.items.filter(obj => this.tabCategory === obj.category);
      } else {
        return this.items;
      }
    }
  },
  mounted() {
    this.get();
  }
};
</script>
