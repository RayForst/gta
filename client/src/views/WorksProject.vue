<template lang="pug">
  section
    .spacer
    .container-fluid.small
      .row
        .col-xs-12.col-md-4.last-xs
          .company-logo-wrap
            img(src="../assets/img/company-logo.jpg", alt="")
          span.person
            span.userpic
              img(src="../assets/img/userpic.jpeg", alt="")
            span.user-details
              span.fullname {{ person_name }}
              span.position {{ person_position }}
        .col-xs-12.col-md-7.col-md-offset-1.comment
          | {{ comment }}
    .spacer
    .carousel-wrap.owl-wrap
      carousel(loop=true autoWidth=true :responsive="{0:{nav:false,dots:true,center:true},1024:{nav:true,dots:false,center:false}}")
        .carousel-item
          .carousel-item-content(style="background-image: url('https://placeimg.com/200/200/any?1')")
        .carousel-item
          .carousel-item-content(style="background-image: url('https://placeimg.com/200/200/any?1')")
        .carousel-item
          .carousel-item-content(style="background-image: url('https://placeimg.com/200/200/any?1')")
        .carousel-item
          .carousel-item-content(style="background-image: url('https://placeimg.com/200/200/any?1')")
        .carousel-item
          .carousel-item-content(style="background-image: url('https://placeimg.com/200/200/any?1')")
        .carousel-item
          .carousel-item-content(style="background-image: url('https://placeimg.com/200/200/any?1')")
        .carousel-item
          .carousel-item-content(style="background-image: url('https://placeimg.com/200/200/any?1')")
        .carousel-item
          .carousel-item-content(style="background-image: url('https://placeimg.com/200/200/any?1')")
    .container-fluid.small
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
</template>

<script>
import appWhyUs from "@/components/WhyUs";
import appReviews from "@/components/Reviews";
import appCA from "@/components/CA";
import contentService from "@/services/ContentService";
import carousel from "vue-owl-carousel";

export default {
  components: {
    appWhyUs,
    appReviews,
    appCA,
    carousel
  },
  props: ["slug"],
  data() {
    return {
      description: null,
      comment: null,
      person_name: null,
      person_position: null
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

  img {
    width: 100%;
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
