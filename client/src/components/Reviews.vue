<template lang="pug">
  section
    .container-fluid
      .row
        .section-heading.col-xs-12
          h2 {{ title }}
          p.caption {{ caption }}
    .owl-wrap(v-if="items.length")
      carousel(loop=true autoWidth=true :dots="false")
        .carousel-item(v-for="item in items" :key="item.id")
          .carousel-item-content
            .person
              .fullname {{ item.person_name }}
              .position {{ item.person_position }}
            .comment {{ item.comment }}
    .container-fluid
      .row
        .col-xs-12.center-xs
          router-link.ui-btn.ui-secondary(:to="{ name: 'works' }") {{ buttonText }}
</template>

<script>
import contentService from "@/services/ContentService";
import carousel from "vue-owl-carousel";

export default {
  components: { carousel },
  data() {
    return {
      title: null,
      caption: null,
      items: [],
      buttonText: null
    };
  },
  props: ["gallery"],
  methods: {
    async get() {
      const blockInfo = (await contentService.blockInfo.get({
        page: "customer-review"
      })).data;
      const list = (await contentService.customerReviews.get()).data;

      this.items = list;
      this.title = blockInfo.title;
      this.caption = blockInfo.caption;
      this.buttonText = blockInfo.buttonText;
    }
  },
  mounted() {
    this.get();
  }
};
</script>

<style lang="stylus" scoped>
.carousel-item {
  width: 420px;
  height: 300px;
  display: flex;
  align-items: center;
  justify-content: center;

  .carousel-item-content {
    width: 380px;
    height: 260px;
    border-radius: 5px;
    box-shadow: 0 0 40px 0 rgba(9, 39, 75, 0.11);
    background: #fff;
    padding: 30px;
    box-sizing: border-box;
  }
}
</style>
