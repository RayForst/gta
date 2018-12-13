<template lang="pug">
  .container-fluid.mid.relative
    <div class="morph-wrap big left" v-if="morph">
      <svg class="morph" width="1400" height="770" viewBox="0 0 1400 770">
        <path d="M 415.6,206.3 C 407.4,286.6 438.1,373.6 496.2,454.8 554.3,536.1 497,597.2 579.7,685.7 662.4,774.1 834.3,731.7 898.5,653.4 962.3,575 967.1,486 937.7,370 909.3,253.9 937.7,201.5 833.4,105.4 729.3,9.338 602.2,13.73 530.6,41.91 459,70.08 423.9,126.1 415.6,206.3 Z"/>
      </svg>
    </div>
    .row
      .col-xs-12.section-heading
        h2 {{ title }}
        p.caption {{ caption }}
    .row
        .col-xs-12.col-sm-6(v-for="item in list" :key="item.id")
          .item
            .row
              .col-xs-12
                img(src="../assets/img/temporary-img.png", alt="")
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
  props: ["morph"],
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

  img {
    margin-bottom: 20px;
  }

  @media only screen and (min-width: 64em) {
    div {
      padding-right: 20%;
    }
  }
}
</style>