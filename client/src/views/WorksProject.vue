<template lang="pug">
  section
    .spacer
    .container-fluid.small
      .row
        .col-xs-12.col-md-4.last-xs.first-md
          .company-logo-wrap(
            :style="{ backgroundImage: 'url(/uploads/' + person_company_logo + ')' }"
          )
          span.person
            span.userpic(
              :style="{ backgroundImage: 'url(/uploads/' + person_pic + ')' }"
            )
            span.user-details
              span.fullname {{ person_name }}
              span.position {{ person_position }}
        .col-xs-12.col-md-7.col-md-offset-1.comment
          | {{ comment }}
    .spacer
    .carousel-wrap.owl-wrap(v-if="gallery")
      carousel(loop=true autoWidth=true :responsive="{0:{nav:false,dots:true,center:true},1024:{nav:true,dots:false,center:false}}")
        .carousel-item(
           v-for="(src, index) in gallery"
        )
          .carousel-item-content(
            :style="{ backgroundImage: 'url(' + src + ')' }"
          )
    .relative
      ui-morph(type="morph6" size="large")
    .container-fluid.small.relative
      .row
        .col-xs-12.col-sm-6
          .desc(v-html="description")
        .col-xs-12.col-sm-6
          .desc(v-html="description")
      .spacer
      app-c-a
    .spacer
    app-why-us
    .spacer
    app-reviews
    .spacer
</template>

<script>
import appWhyUs from "@/components/WhyUs";
import appReviews from "@/components/Reviews";
import appCA from "@/components/CA";
import contentService from "@/services/ContentService";
import carousel from "vue-owl-carousel";
import uiMorph from "@/components/ui/Morph";

export default {
  components: {
    appWhyUs,
    appReviews,
    appCA,
    carousel,
    uiMorph
  },
  props: ["slug"],
  data() {
    return {
      description: null,
      comment: null,
      person_name: null,
      person_position: null,
      gallery: null,
      person_pic: null,
      person_company_logo: null
    };
  },
  methods: {
    async get() {
      const content = (await contentService.works.get({
        slug: this.slug
      })).data;

      this.description = content.description;
      this.comment = content.comment;
      this.person_name = content.person_name;
      this.person_position = content.person_position;
      this.person_pic = content.image;
      this.person_company_logo = content.image2;

      if (content.gallery && ((content.gallery.indexOf(',') > -1) || content.gallery.length)) {
        this.gallery = content.gallery.split(',').map(function(image){
          return '/uploads/'+image
        })
      }

      this.$store.commit("setHeader", {
        title: content.title,
        caption: content.shortDescription,
        icon: null,
        breadcrumbs: [
          {
            name: "Our works",
            route: "what-we-do"
          },
          {
            name: this.slug
          }
        ]
      });
    }
  },
  mounted() {
    this.get();
    document.body.className = "bg-purple-red";
  }
};
</script>

<style lang="stylus" scoped>
.desc {
  font-size: 18px;
  line-height: 1.56;
  color: #4a4a4a;
  padding-right: 0;

  @media only screen and (min-width: 48em) {
    padding-right: 40px;
  }
}

.company-logo-wrap {
  border-radius: 6px;
  box-shadow: 0 0 40px 0 rgba(9, 39, 75, 0.11);
  background-color: #ffffff;
  overflow: hidden;
  margin-bottom: 40px;
  max-width: 300px;
  margin: 0 auto;
  background-position: center center;
  background-size: cover;

  &:before {
    content: '';
    display:block;
    padding-top:50%;
  }
}

.person {
  justify-content: center;
  margin-top: 30px;
}

.carousel-item {
  width: 280px;
  height: 280px;
  display: flex;
  align-items: center;
  justify-content: center;

  @media only screen and (min-width: 48em) {
    width: 440px;
    height: 440px;
  }

  .carousel-item-content {
    width: 250px;
    height: 250px;
    border-radius: 5px;
    box-shadow: 0 0 40px 0 rgba(9, 39, 75, 0.11);
    background: rgba(255, 255, 255, 1);
    padding: 30px 25px 25px 25px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    position: relative;
    color: #000;
    text-decoration: none;
    overflow: hidden;
    transition: background 0.6s ease;
    background-size: cover;

    @media only screen and (min-width: 48em) {
      width: 400px;
      height: 400px;
      padding: 30px 30px 25px 30px;
    }
  }
}

.carousel-wrap {
}

.comment {
  font-size: 18px;
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  line-height: 1.56;
  letter-spacing: normal;
  color: #000000;
  margin-bottom: 30px;
}
</style>
