<template lang="pug">
  section.content-wrap
    .container-fluid.mid
      .row(v-if="gallery !== 'true'")
        .col-xs-12.section-heading
          h2 {{ title }}
      .row
        .item(v-for="(item, index) in items" :key="item.id" :class="gallery === 'true' ? 'col-xs-12' : 'col-xs-12 col-sm-6'")
          template(v-if="gallery === 'true'")
            .row.relative
              template(v-if="morph")
                ui-morph(type="morph2" size="medium" :class="(index + 1) % 2 !== 0 ? 'left' : 'right'")
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
                .carousel-wrap(v-if="item.gallery")
                  carousel(loop=true :items=1 :dots="true" :nav="false")
                    <img v-for="(src, index) in item.gallery" :src="src">
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
import uiMorph from "@/components/ui/Morph";

export default {
  data() {
    return {
      title: null,
      items: [],
      buttonText: null
    };
  },
  props: ["gallery", "morph"],
  components: {
    carousel,
    uiMorph
  },
  methods: {
    async get() {
      const blockInfo = (await contentService.blockInfo.get({
        page: "what-we-do"
      })).data;
      const list = (await contentService.whatWeDo.get()).data;
      console.log(list);

      list.forEach(element => {
        if (element.gallery && element.gallery.indexOf(',') > -1) {
          element.gallery =  element.gallery.split(',').map(function(image){
            return require('./../../../uploads/'+image)
          })
        } else { 
          element.gallery = false
        }
      });

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

