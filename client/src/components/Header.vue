<template lang="pug">
    header.main
      .waveWrapper.waveAnimation
        .waveWrapperInner.bgTop
          .wave.waveTop(:style="{ backgroundImage: 'url(' + require('../assets/img/wave-top.png') + ')'}")
        .waveWrapperInner.bgMiddle
          .wave.waveMiddle(:style="{ backgroundImage: 'url(' + require('../assets/img/wave-mid.png') + ')'}")
        .waveWrapperInner.bgBottom
          .wave.waveBottom(:style="{ backgroundImage: 'url(' + require('../assets/img/wave-bot.png') + ')'}")
      .container-fluid.nav-container
        nav.row
          .navigation-links.col-xs-12
            router-link(v-for="item in routes" :key="item.route" :to='{ name: item.route }' :class="{ logo: item.route === 'index'}")
              template(v-if="item.route !== 'index'")
                | {{ item.text }}
              template(v-else)
                img(src="../assets/img/logo.svg" alt="company logo")
      .container-fluid.mid
        template(v-if="!itemView")
          template(v-if="contentKey === 'index'")
            .row.header-padding
              .col-xs-12.col-sm-6
                h1 {{ title }}
                p.heading-caption {{ caption }}
                .row
                  .col-xs-12.center-xs.start-sm
                    router-link.ui-btn(:to="{ name: 'contacts' }") Request a quote
              .col-xs-12.col-sm-6.graphics-wrap
                .graphics
                  div.graph.graph-1
                    .line
                    img(src="../assets/img/00.png", srcset="../assets/img/00@2x.png 2x" alt="")
                  div.graph.graph-2
                    img(src="../assets/img/01.png", srcset="../assets/img/01@2x.png 2x" alt="")
                  div.graph.graph-3
                    .line.line-2
                    img(src="../assets/img/02.png", srcset="../assets/img/02@2x.png 2x" alt="")
          template(v-else-if="contentKey !== 'error'")
            .row.middle-xs.header-padding
              .col-xs-12.col-sm-7.col-md-8
                h1 {{ title }}
                p.heading-caption {{ caption }}
              .col-xs-12.col-sm-5.col-md-4.center-xs
                router-link.ui-btn(:to="{ name: 'contacts' }") Request a quote
        template(v-else-if="itemView.title")
          .row.middle-xs.crumbs-hero
            .col-xs-12.breadcrumbs
              router-link(:to="{ name: 'index' }") Home
              | /
              router-link(:to="{ name: itemView.breadcrumbs[0].route }") {{ itemView.breadcrumbs[0].name }}
              | / 
              span {{ itemView.breadcrumbs[1].name }}
          .row.middle-xs.header-padding
            .col-xs-12.col-sm-7.col-md-8
              template(v-if="typeof itemView.icon === 'string'")
                .row.icon-heading.align-center
                  .col-xs-12.col-md-5.col-lg-3.center-xs
                    img(:src="require('../assets/img/what-we-do/'+itemView.icon)" alt="")
                  .col-xs-12.col-md-7.col-lg-9
                    h1 {{ itemView.title }}
                    p.heading-caption {{ itemView.caption }}
              template(v-else)
                h1 {{ itemView.title }}
                p.heading-caption {{ itemView.caption }}
            .col-xs-12.col-sm-5.col-md-4.center-xs
              router-link.ui-btn(:to="{ name: 'contacts' }") Request a quote
</template>

<script>
import contentService from "@/services/ContentService";
import iconGraphics1 from "@/components/icons/Graphics1";
import iconGraphics2 from "@/components/icons/Graphics2";
import iconGraphics3 from "@/components/icons/Graphics3";

export default {
  components: {
    iconGraphics1,
    iconGraphics2,
    iconGraphics3
  },
  data() {
    return {
      contentKey: "index",
      title: null,
      caption: null,
      routes: [
        {
          text: "What we do",
          route: "what-we-do"
        },
        {
          text: "Our works",
          route: "works"
        },
        {
          text: "Logo",
          route: "index"
        },
        {
          text: "Company",
          route: "about"
        },
        {
          text: "Contact us",
          route: "contacts"
        }
      ]
    };
  },
  methods: {
    get() {
      console.log("in gett");
      if (!this.contentKey) return;

      const blockInfo = this.$store.state.settings.headings.filter(
        obj => obj.page === this.contentKey
      )[0];

      this.title = blockInfo.title;
      this.caption = blockInfo.caption;
    },
    setContentKey(newV) {
      console.log("SET COONTENT KEY", newV, this.$store.state.route.name);

      if (this.$store.state.route.name === "error") {
        this.contentKey = "error";
        this.$store.commit("setHeader", null);
      } else {
        switch (newV) {
          case "/what-we-do":
            this.contentKey = "what-we-do";
            break;
          case "/works":
            this.contentKey = "works";
            break;
          case "/contacts":
            this.contentKey = "contacts";
            break;
          case "/about":
            this.contentKey = "about";
            break;
          case "/":
            this.contentKey = "index";
            break;
          default:
            this.contentKey = null;
        }
        if (this.contentKey) {
          this.$store.commit("setHeader", null);
          this.get();
        }
      }
    }
  },
  computed: {
    page() {
      return this.$store.state.route.path;
    },
    itemView() {
      console.log("getting item view", this.$store.state.headerData);
      return this.$store.state.headerData;
    }
  },
  watch: {
    page(newV, old) {
      this.setContentKey(newV);
    }
  },
  mounted() {
    let that = this;

    setTimeout(function() {
      that.setContentKey(that.page);
    }, 1000);
    //this.get();
  }
};
</script>

<style lang="stylus" scoped>
header {
  position: relative;
  padding-bottom: 25px;
  margin-bottom: 20px;
  overflow: hidden;

  @media only screen and (min-width: 48em) {
    padding-bottom: 70px;
  }

  @media only screen and (min-width: 64em) {
    padding-bottom: 120px;
  }
}

.header-padding {
  padding-bottom: 80px;
}

nav {
  color: #fff;
  padding: 10px 0;
  padding-bottom: 30px;

  @media only screen and (min-width: 48em) {
    padding-bottom: 60px;
  }
}

.logo {
  opacity: 1;
  margin: 0 auto;

  @media only screen and (min-width: 64em) {
    margin: 0;
  }
}

nav a {
  font-size: 14px;
  font-weight: bold;
  font-style: normal;
  font-stretch: normal;
  line-height: normal;
  letter-spacing: 1.3px;
  color: #ffffff;
  text-decoration: none;
  opacity: 0.5;
  text-transform: uppercase;
  padding: 10px;

  &:not(.logo) {
    margin-top: 55px;
    display: none;

    @media only screen and (min-width: 64em) {
      display: block;
    }
  }

  &:hover {
    opacity: 0.9;
    color: #fff;
  }

  &.router-link-active {
    color: #fff100;
    opacity: 1;
  }
}

.navigation-links {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
}

.waveWrapper {
  overflow: hidden;
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  top: 0;
  margin: auto;
  z-index: -1;
}

.waveWrapperInner {
  position: absolute;
  width: 100%;
  overflow: hidden;
  height: 100%;
  top: -1px;
  background-image: linear-gradient(127deg, #a709ff, #0094d9);

  &.bgTop {
    z-index: 15;
    opacity: 0.3;
  }

  &.bgMiddle {
    z-index: 10;
    opacity: 0.3;
  }

  &.bgBottom {
    z-index: 5;
  }
}

.crumbs-hero {
  margin-top: -20px;
}

.icon-heading {
  margin-bottom: 10px;

  @media only screen and (min-width: 64em) {
    margin-bottom: 0;
  }
}

.wave {
  position: absolute;
  left: 0;
  width: 200%;
  height: 100%;
  background-repeat: repeat no-repeat;
  background-position: 0 bottom;
  transform-origin: center bottom;
  will-change: transform;
  transform: translateX(0) translateZ(0) scaleY(1);

  &.waveTop {
    background-size: 84% 40px;

    @media only screen and (min-width: 48em) {
      background-size: 84% 120px;
    }

    @media only screen and (min-width: 64em) {
      background-size: 84% 160px;
    }
  }

  &.waveMiddle {
    animation-delay: 2s;
    background-position-x: -20%;
    background-size: 80% 30px;

    @media only screen and (min-width: 48em) {
      background-size: 80% 100px;
    }

    @media only screen and (min-width: 64em) {
      background-size: 80% 130px;
    }
  }

  &.waveBottom {
    animation-delay: 1s;
    background-position-x: 30%;
    background-size: 76% 20px;

    @media only screen and (min-width: 48em) {
      background-size: 76% 70px;
    }

    @media only screen and (min-width: 64em) {
      background-size: 76% 100px;
    }
  }
}

.nav-container {
  @media only screen and (min-width: 64em) {
    margin: 0 70px;
  }

  @media only screen and (min-width: 84em) {
    margin: 0 130px;
  }

  @media (min-width: 1600px) {
    margin: 0 auto;
  }
}
</style>
