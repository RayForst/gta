<template lang="pug">
  section.relative
    ui-morph(v-if="morph" type="morph3" size="large" class="left2")
    .container-fluid.mid.relative
      .row
        .col-xs-12.section-heading
          h2 {{ title }}
          p.caption {{ caption }}
      .row
          .col-xs-12.col-sm-6.item-wrap(v-for="item in list" :key="item.id")
            .item
              .row
                .col-xs-12
                  img(:src="require('../assets/img/why-us/'+item.icon+'.svg')" alt="")
              div {{ item.text }}
</template>

<script>
import contentService from "@/services/ContentService";
import uiMorph from "@/components/ui/Morph";

export default {
  data() {
    return {
      title: null,
      caption: null,
      list: null
    };
  },
  props: ["morph"],
  components: {
    uiMorph
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
.item-wrap {
  margin-bottom: 40px;
}

.item {
  font-size: 22px;
  line-height: 1.27;
  color: #0a0a0a;
  border-radius: 6px;
  box-shadow: 0 0 40px 0 rgba(9, 39, 75, 0.11);
  background-color: #ffffff;
  margin: 0 12px;
  padding: 30px 40px;
  box-sizing: border-box;
  height: 100%;

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