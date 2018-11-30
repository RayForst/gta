<template lang="pug">
  section
    .container-fluid.mid
      .row
        .col-xs-12.section-heading
          h2 {{ title }}
      .row
        .item(v-for="(item, index) in items" :key="item.id" :class="gallery === 'true' ? 'col-xs-12' : 'col-xs-6'")
          template(v-if="gallery === 'true'")
            .row
              .col-xs-6
                img(:src="require('../assets/img/what-we-do/'+item.icon+'.svg')", alt="")
                h3 {{ item.title }}
                p {{ item.shortDescription }}
                router-link.link(:to="{ name: 'what-we-do-item', params: { slug: item.slug } }") Learn more
              .col-xs-6(:class="(index + 1) % 2 === 0 ? 'first-xs' : ''")
                .carousel-wrap
                  carousel(loop=true :items=1 :dots="true" :nav="false")
                    <img src="https://placeimg.com/200/200/any?1">
                    <img src="https://placeimg.com/200/200/any?2">
                    <img src="https://placeimg.com/200/200/any?3">
                    <img src="https://placeimg.com/200/200/any?4">
          template(v-else)
            img(:src="require('../assets/img/what-we-do/'+item.icon+'.svg')", alt="")
            h3 {{ item.title }}
            p {{ item.shortDescription }}
            router-link.link(:to="{ name: 'what-we-do-item', params: { slug: item.slug } }") Learn more
      .row
        .col-xs-12.center-xs
          router-link.ui-btn(:to="{ name: 'what-we-do' }") {{ buttonText }}
</template>

<script>
import contentService from "@/services/ContentService";
import carousel from "vue-owl-carousel";

export default {
  data() {
    return {
      title: null,
      items: [],
      buttonText: null
    };
  },
  props: ["gallery"],
  components: {
    carousel
  },
  methods: {
    async get() {
      const blockInfo = (await contentService.blockInfo.get({
        page: "what-we-do"
      })).data;
      const list = (await contentService.whatWeDo.get()).data;

      this.items = list;
      this.title = blockInfo.title;
      this.buttonText = blockInfo.buttonText;
    }
  },
  mounted() {
    this.get();
  }
};
</script>

<style lang="stylus" scoped>
p {
  font-size: 18px;
  line-height: 1.56;
  color: #767676;
}

.item {
  padding: 0 50px;
  margin-bottom: 70px;
}

.carousel-wrap {
  max-width: 490px;
  margin-left: auto;
}

.first-xs .carousel-wrap {
  margin-right: auto;
  margin-left: 0;
}
</style>

