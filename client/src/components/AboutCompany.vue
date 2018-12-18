<template lang="pug">
  section.overflow-h.content-wrap
    .container-fluid.mid
      .row
        .col-xs-12.section-heading
          h2 {{ title }}
          p.caption {{ caption }}
      .row.m1
        .col-xs-12.col-md-6.center-xs.content-wrap.start-md
          img(src="../assets/img/flag-can@2x.png", alt="")
          p.content {{ text }}
          router-link.link(:to="{ name: 'about' }")
            | Learn more
            img.icon(src="../assets/img/arrow.svg", alt="")
        .col-xs-12.col-md-6.end-xs
          .image-wrap
            .line
            img(src="../assets/img/gta-house.png", srcset="../assets/img/gta-house@2x.png 2x" alt="")
</template>

<script>
import contentService from "@/services/ContentService";

export default {
  data() {
    return {
      title: null,
      caption: null,
      buttonText: null,
      text: null
    };
  },
  methods: {
    async get() {
      const blockInfo = (await contentService.blockInfo.get({
        page: "about-company"
      })).data;

      const content = (await contentService.aboutCompany.get({
        id: 1
      })).data;

      this.title = blockInfo.title;
      this.caption = blockInfo.caption;
      this.buttonText = blockInfo.buttonText;
      this.text = content.text;
    }
  },
  mounted() {
    this.get();
  }
};
</script>

<style lang="stylus" scoped>
.content {
  font-size: 18px;
  line-height: 1.78;
  color: #000000;
}

.m1 {
  margin-top: 10px;
}

.content-wrap {
  margin-bottom: 50px;
}

.m1 p {
  white-space: pre-wrap;
  margin-bottom: 30px;
}

.image-wrap {
  position: relative;
  max-width: 650px;
  margin-left: auto;

  img {
    width: 100%;
    max-height: 462px;
  }

  .line {
    position: absolute;
    width: 100%;
    height: 73%;
    transform: rotate(-30deg);
    z-index: -1;
    top: 25%;

    &:before {
      content: '';
      position: absolute;
      top: 10%;
      left: 7%;
      height: 68%;
      width: 2000px;
      opacity: 0.1;
      padding: 0;
      background: #808080;
      border-radius: 150px;
    }
  }
}

.line {
  @media only screen and (min-width: 1500px) {
    display: none;
  }
}
</style>
