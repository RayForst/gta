<template lang="pug">
  section
    .container-fluid.mid
      .row
        .col-xs-12.section-heading
          h2 {{ title }}
          p.caption {{ caption }}
      .row
          .col-xs-12.col-sm-6.col-md-4.col-lg-3.person-item(v-for="item in list" :key="item.id")
              div.user-photo-wrap
                .user-photo(v-if="item.image" :style="{ backgroundImage: 'url(' + '/uploads/'+item.image + ')' }")
              div.name {{ item.fullname }}
              div.pos {{ item.position }}
</template>

<script>
import contentService from "@/services/ContentService";

export default {
  data() {
    return {
      title: null,
      caption: null,
      list: null
    };
  },
  methods: {
    async get() {
      const blockInfo = (await contentService.blockInfo.get({
        page: "team"
      })).data;

      const content = (await contentService.team.get()).data;

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
.pos {
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  line-height: 1.25;
  letter-spacing: normal;
  color: #4a4a4a;
}

.name {
  font-size: 18px;
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  line-height: 1.22;
  letter-spacing: normal;
  color: #000000;
}

.user-photo-wrap {
  position: relative;
  margin-bottom: 30px;
  overflow: hidden;

  &:before {
    content: '';
    display: block;
    padding-top: 100%;
  }
  
  &:hover {
    .user-photo {
      transform: scale(1.1);
    }
  }

  .user-photo {
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    background-size: cover;
    transition: transform .3s ease;
    background-position: center center;
  }
}

.person-item {
  margin-bottom: 50px;
  padding: 0 20px;
}
</style>
