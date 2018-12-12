<template lang="pug">
  section.content-wrap.relative
    <div class="morph-wrap">
      <svg class="morph" width="1400" height="770" viewBox="0 0 1400 770">
        <path d="M 415.6,206.3 C 407.4,286.6 438.1,373.6 496.2,454.8 554.3,536.1 497,597.2 579.7,685.7 662.4,774.1 834.3,731.7 898.5,653.4 962.3,575 967.1,486 937.7,370 909.3,253.9 937.7,201.5 833.4,105.4 729.3,9.338 602.2,13.73 530.6,41.91 459,70.08 423.9,126.1 415.6,206.3 Z"/>
      </svg>
    </div>
    .container-fluid
      .row
        .section-heading.col-xs-12
          h2 {{ title }}
          p.caption {{ caption }}
    .owl-wrap(v-if="items.length")
      carousel(loop=true autoWidth=true :responsive="{0:{nav:false,dots:true,center:true},1024:{nav:true,dots:false,center:false}}")
        .carousel-item(v-for="item in items" :key="item.id")
          router-link.carousel-item-content(:to="{ name: 'what-we-do-item', params: { slug: item.slug } }") 
            span.bg(style="background-image: url('https://placeimg.com/640/480/any')")
            span.person
              span.userpic
                img(src="../assets/img/userpic.jpeg", alt="")
              span.user-details
                span.fullname {{ item.person_name }}
                span.position {{ item.person_position }}
            span.comment {{ item.comment| truncate(110, '...') }}
            span.link
              | Learn more
              icon-arrow(iconClass="icon")
    .container-fluid
      .row
        .col-xs-12.center-xs
          router-link.ui-btn.ui-secondary(:to="{ name: 'works' }") {{ buttonText }}
</template>

<script>
import contentService from "@/services/ContentService";
import carousel from "vue-owl-carousel";
import iconArrow from "@/components/icons/Arrow";

export default {
  components: {
    carousel,
    iconArrow
  },
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
  width: 330px;
  height: 330px;
  display: flex;
  align-items: center;
  justify-content: center;

  @media only screen and (min-width: 48em) {
    width: 420px;
    height: 300px;
  }

  .carousel-item-content {
    width: 290px;
    height: 290px;
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

    .bg {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: -1;
      background-size: cover;
      background-repeat: no-repeat;
    }

    &:hover {
      background-color: rgba(0, 0, 0, 0.6);

      .fullname, .position {
        color: #fff;
      }

      .comment {
        opacity: 0;
      }

      .link {
        font-size: 18px;

        .icon {
          width: 16px;
          height: 16px;
          fill: #fff;
          margin-left: auto;
        }
      }
    }

    @media only screen and (min-width: 48em) {
      width: 380px;
      height: 260px;
      padding: 30px 30px 25px 30px;
    }
  }

  .link {
    margin-top: auto;
    display: flex;
    align-items: center;
  }
}

.comment {
  font-size: 15px;
  line-height: 1.6;
  color: #000000;
  margin-top: 32px;
  transition: opacity 0.4s ease;
}

.owl-carousel .owl-item img.icon {
  width: auto;
  display: initial;
}
</style>
