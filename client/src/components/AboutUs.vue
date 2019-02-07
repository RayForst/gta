<template lang="pug">
  section.relative
    ui-morph(type="morph3" size="large" class="right2")
    .container-fluid.small
      .row
        .section-heading.col-xs-12
          h2 {{ title }}
          p.caption {{ caption }}
      .row.desc-wrap
        template(v-if="gallery.length")
          .col-xs-12.col-sm-5
            p.pre(v-html="description")
          .col-xs-12.col-sm-6.col-sm-offset-1
            .carousel-wrap.owl-dots-left
              carousel(loop=true :items=1 :dots="true" :nav="false")
                <img v-for="(src, index) in gallery" :src="src"  @click="() => showImg(index, 'gallery')">
              vue-easy-lightbox(
                :visible="galleryVisible"
                :imgs="gallery"
                :index="index"
                @hide="handleHide"
              )
        template(v-else)
          .col-xs-12
            p.pre(v-html="description")
      .spacer
      .row.short-desc-wrap
        template(v-if="gallery2.length")
          .col-xs-12.col-sm-6.last-xs.first-sm
            .carousel-wrap.owl-dots-left
              carousel(loop=true :items=1 :dots="true" :nav="false")
                <img v-for="(src, index) in gallery" :src="src"  @click="() => showImg(index, 'gallery-2')">
              vue-easy-lightbox(
                :visible="galleryVisible2"
                :imgs="gallery2"
                :index="index2"
                @hide="handleHide"
              )
          .col-xs-12.col-sm-5.col-sm-offset-1
            p.pre(v-html="shortDescription")
        template(v-else)
          .col-xs-12
            p.pre(v-html="shortDescription")
</template>


<script>
import contentService from "@/services/ContentService";
import carousel from "vue-owl-carousel";
import uiMorph from "@/components/ui/Morph";

export default {
  data() {
    return {
      title: null,
      caption: null,
      description: null,
      shortDescription: null,
      gallery: [],
      gallery2: [],
      galleryVisible: false,
      galleryVisible2: false,
      index: 0,
      index2: 0
    };
  },
  components: {
    carousel,
    uiMorph
  },
  methods: {
    async get() {
      const gallery = (await contentService.gallery.get({
        keyword: "about-gallery"
      })).data;

      if (gallery && gallery.images) {
        this.gallery = gallery.images.split(',').map(function(image){
          return require('./../../../uploads/'+image)
        })
      }
      
      const gallery2 = (await contentService.gallery.get({
        keyword: "about-gallery-2"
      })).data;

      if (gallery2 && gallery2.images) {
        this.gallery2 = gallery2.images.split(',').map(function(image){
          return require('./../../../uploads/'+image)
        })
      }

      const blockInfo = (await contentService.blockInfo.get({
        page: "about"
      })).data;

      const content = (await contentService.about.get({
        id: 1
      })).data;

      this.title = blockInfo.title;
      this.caption = blockInfo.caption;
      this.description = content.description;
      this.shortDescription = content.shortDescription;
    },
    showImg (index, key) {
      if (key === 'gallery') {
        this.index = index
        this.galleryVisible = true
      } else {
        this.index2 = index
        this.galleryVisible2 = true
      }
    },
    handleHide () {
      this.galleryVisible = false
      this.galleryVisible2 = false
    }
  },
  mounted() {
    this.get();
  }
};
</script>

<style lang="stylus" scoped>
.desc-wrap {
  p {
    font-size: 16px;
    font-weight: normal;
    font-style: normal;
    font-stretch: normal;
    line-height: 1.5;
    letter-spacing: normal;
    color: #000000;
  }
}

.short-desc-wrap {
  p {
    font-size: 22px;
    font-weight: normal;
    font-style: normal;
    font-stretch: normal;
    line-height: 1.64;
    letter-spacing: normal;
    color: #000000;
    white-space: pre-wrap;
  }
}
.pre {
  white-space: pre-wrap;
  display: flex;
  flex-direction: column;
}
</style>
