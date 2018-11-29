<template lang="pug">
  .container-fluid
    .row
      .col-xs-12.section-heading
        h2 {{ title }}
        p.caption {{ caption }}
    .row
        .col-xs-6(v-for="item in list" :key="item.id")
          .item
            div {{ item.text }}
</template>

<script>
import contentService from "@/services/ContentService";

export default {
  data() {
    return {
      title: null,
      caption: null,
      list: null
    };
  },
  methods: {
    async get() {
      const blockInfo = (await contentService.blockInfo.get({
        page: "why-us"
      })).data;

      const content = (await contentService.whyUs.get()).data;

      this.title = blockInfo.title;
      this.caption = blockInfo.caption;
      this.list = content;
    }
  },
  mounted() {
    this.get();
  }
};
</script>

<style lang="stylus" scoped>
.item {
  font-size: 22px;
  line-height: 1.27;
  color: #0a0a0a;
  border-radius: 6px;
  box-shadow: 0 0 40px 0 rgba(9, 39, 75, 0.11);
  background-color: #ffffff;
  margin: 0 12px;
  margin-bottom: 40px;
  padding: 30px 40px;
  box-sizing: border-box;

  div {
    padding-right: 20%;
  }
}
</style>