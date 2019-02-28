<template lang="pug">
  section.relative
    ui-morph(type="morph5" size="large")
    .container-fluid.small.relative
      .row
        .col-xs-12.section-heading.line
          h2 {{ title }}
      .row
        .col-xs-12
          .tabs
            span(@click="changeSorting(false)" :class="tabCategory == false ? 'active' : ''") All
            span(v-for="tab in tabs" @click="changeSorting(tab)" :class="tabCategory == tab ? 'active' : ''") {{ tab }}
      .row
        .item.col-xs-12(:class="(index + 1) % 3 === 0 ? 'col-sm-12 full-width' : 'col-sm-6'" v-for="(item, index) in sortedList.slice(0, displayLimit)" :key="item.id")
          router-link(:to="{ name: 'works-project', params: { slug: item.slug } }")
            span.image-wrap
              .image-wrap-content(
                v-if="item.gallery"
                :style="{ backgroundImage: 'url(' + '/uploads/'+item.gallery + ')' }"
              )
              .image-wrap-content(
                v-else
              )
              .person-review
                span.person
                  span.userpic(
                    :style="{ backgroundImage: 'url(' + '/uploads/'+item.image + ')' }"
                  )
                  span.user-details
                    span.fullname {{ item.person_name }}
                    span.position {{ item.person_position }}
                span.comment {{ item.comment| truncate(100, '...') }}
                span.link
                  | Learn more
                  icon-arrow(iconClass="icon")
          h3
            router-link(:to="{ name: 'works-project', params: { slug: item.slug } }")
              | {{ item.title }}
          p 
            router-link(:to="{ name: 'works-project', params: { slug: item.slug } }")
              | {{ item.category }}
      .row(v-if='displayLimit < items.length')
        .col-xs-12.center-xs
          button.ui-btn.ui-secondary(@click="increaseDisplayLimit") {{ buttonText }}
</template>

<script>
import contentService from "@/services/ContentService";
import iconArrow from "@/components/icons/Arrow";
import uiMorph from "@/components/ui/Morph";

export default {
  components: {
    iconArrow,
    uiMorph
  },
  data() {
    return {
      title: null,
      items: [],
      buttonText: "Load more",
      tabCategory: false,
      displayLimit: 5
    };
  },
  methods: {
    async get() {
      const blockInfo = (await contentService.blockInfo.get({
        page: "works"
      })).data;
      const list = (await contentService.works.get()).data;

      list.forEach(element => {
        if (element.gallery) {
          if (element.gallery.indexOf(',') > -1) {
            element.gallery =  element.gallery.split(',')[0]
          } else {
            element.gallery =  element.gallery
          }
        } else { 
          element.gallery = false
        }
      });

      this.items = list;
      this.title = blockInfo.title;
    },
    sortTabs(tab) {
      alert("ssorrt");
    },
    changeSorting(category) {
      this.tabCategory = category;
    },
    increaseDisplayLimit() {
      this.displayLimit += 5;
    }
  },
  computed: {
    tabs() {
      const unique = [...new Set(this.items.map(item => item.category))];
      return unique;
    },
    sortedList() {
      if (this.tabCategory) {
        return this.items.filter(obj => this.tabCategory === obj.category);
      } else {
        return this.items;
      }
    }
  },
  mounted() {
    this.get();
  }
};
</script>

<style lang="stylus" scoped>
.tabs {
  display: flex;
  justify-content: center;
  margin-bottom: 40px;
  flex-direction: column;

  @media only screen and (min-width: 64em) {
    margin-bottom: 60px;
    flex-direction: row;
  }

  span {
    font-size: 14px;
    font-weight: bold;
    line-height: 1.29;
    letter-spacing: 0.9px;
    color: #9b9b9b;
    text-transform: uppercase;
    margin: 10px 0px;
    text-align: center;
    cursor: pointer;

    @media only screen and (min-width: 64em) {
      margin: 0 50px;
      text-align: left;
    }

    &.active {
      color: #eb008b;
    }
  }
}

.item {
  color: #000;
  text-decoration: none;
  position: relative;
  text-align: center;
  text-decoration: none;
  color: #000;
  margin-bottom: 35px;

  @media only screen and (min-width: 64em) {
    padding: 0 16px;

    &:hover {
      .person-review {
        transform: translateY(0%);
      }

      .image-wrap:before {
        background-color: rgba(0, 0, 0, 0.6);
      }
    }
  }

  h3 {
    font-size: 18px;
    font-weight: bold;
    font-style: normal;
    font-stretch: normal;
    line-height: 1.5;
    letter-spacing: normal;
    text-align: center;
    margin-top: 14px;
    margin-bottom: 5px;
    text-transform: uppercase;

    a {
      text-decoration: none;
      color: #000000;
    }
  }

  p {
    font-size: 13px;
    font-weight: normal;
    font-style: normal;
    font-stretch: normal;
    line-height: 1.23;
    letter-spacing: normal;
    text-align: center;
    margin: 0;

    a {
      text-decoration: none;
      color: #0094d9;
    }
  }
}

.image-wrap {
  position: relative;
  width: 100%;
  background: rgba(#4a90e2, 0.05);
  display: block;
  border-radius: 6px;
  overflow: hidden;

  &:before {
    content: '';
    display: block;
    transition: background 0.6s ease;
    padding-top: 50%;

    @media only screen and (min-width: 64em) {
      padding-top: 100%;
    }
  }
}

.image-wrap-content {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: cover;
  background-repeat: no-repeat;
  z-index: -1;
}

.full-width {
  .image-wrap:before {
    padding-top: 50%;
  }
}

.person-review {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  color: #fff;
  text-align: left;
  padding: 26px 25px;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  transform: translateY(100%);
  transition: transform 0.7s ease-out;

  @media only screen and (min-width: 64em) {
    padding: 26px 50px;
  }

  .person {
    margin-top: auto;
  }

  .comment {
    margin-top: 30px;
    margin-bottom: 30px;
  }
}
</style>
