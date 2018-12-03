<template lang="pug">
  section
    .container-fluid.mid
      .row(v-if="gallery !== 'true'")
        .col-xs-12.section-heading
          h2 {{ title }}
      .row
        .item(v-for="(item, index) in items" :key="item.id" :class="gallery === 'true' ? 'col-xs-12' : 'col-xs-12 col-sm-6'")
          template(v-if="gallery === 'true'")
            .row
              .col-xs-12.col-md-5(:class="(index + 1) % 2 !== 0 ? 'col-md-offset-1' : ''")
                .row
                  .col-xs-12.center-xs.start-sm
                    img(:src="require('../assets/img/what-we-do/'+item.icon+'.svg')", alt="")
                h3 {{ item.title }}
                p {{ item.shortDescription }}
                router-link.link(:to="{ name: 'what-we-do-item', params: { slug: item.slug } }")
                  | Learn more
                  img.icon(src="../assets/img/arrow.svg", alt="")
              .col-xs-12.col-md-6(:class="(index + 1) % 2 !== 0 ? 'first-md owl-dots-left' : 'col-md-offset-1 owl-dots-right'")
                .carousel-wrap
                  carousel(loop=true :items=1 :dots="true" :nav="false")
                    <img src="https://placeimg.com/490/280/any?1">
                    <img src="https://placeimg.com/490/280/any?2">
                    <img src="https://placeimg.com/490/280/any?3">
                    <img src="https://placeimg.com/490/280/any?4">
          template(v-else)
            .row
              .col-xs-12.center-xs.start-sm
                img(:src="require('../assets/img/what-we-do/'+item.icon+'.svg')", alt="")
            h3 {{ item.title }}
            p {{ item.shortDescription }}
            router-link.link(:to="{ name: 'what-we-do-item', params: { slug: item.slug } }") 
              | Learn more
              img.icon(src="../assets/img/arrow.svg", alt="")
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
  margin-bottom: 70px;

  @media only screen and (min-width: 48em) {
    padding: 0 50px;
  }
}

.carousel-wrap {
  margin-top: 30px;
}

.first-xs .carousel-wrap {
  margin-right: auto;
  margin-left: 0;
}
</style>

