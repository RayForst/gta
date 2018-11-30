<template lang="pug">
  section
    .container-fluid.mid
      .row
        .col-xs-12.section-heading
          h2 {{ title }}
          p.caption {{ caption }}
      .row.m1
        .col-xs-6
          img(src="../assets/img/flag-can@2x.png", alt="")
          p.content {{ text }}
          router-link.link(:to="{ name: 'about' }") Learn more
        .col-xs-6.end-xs
          img(src="../assets/img/gta-house.svg", alt="")
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

p {
  white-space: pre-wrap;
  padding-right: 70px;
  margin-bottom: 30px;
}
</style>
