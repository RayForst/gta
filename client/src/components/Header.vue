<template lang="pug">
    header
      .waveWrapper.waveAnimation
        .waveWrapperInner.bgTop
          .wave.waveTop(style="background-image: url('http://front-end-noobs.com/jecko/img/wave-top.png')")
        .waveWrapperInner.bgMiddle
          .wave.waveMiddle(style="background-image: url('http://front-end-noobs.com/jecko/img/wave-mid.png')")
        .waveWrapperInner.bgBottom
          .wave.waveBottom(style="background-image: url('http://front-end-noobs.com/jecko/img/wave-bot.png')")
      .container-fluid
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
            .row
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
                    img(src="../assets/img/00.svg", alt="")
                  div.graph.graph-2
                    img(src="../assets/img/01.svg", alt="")
                  div.graph.graph-3
                    .line.line-2
                    img(src="../assets/img/02.svg", alt="")
          template(v-else)
            .row.middle-xs
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
          .row.middle-xs
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

export default {
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
    async get() {
      if (!this.contentKey) return;
      const blockInfo = (await contentService.head.get({
        page: this.contentKey
      })).data;

      this.title = blockInfo.title;
      this.caption = blockInfo.caption;
    },
    setContentKey(newV) {
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
  },
  computed: {
    page() {
      return this.$store.state.route.path;
    },
    itemView() {
      return this.$store.state.headerData;
    }
  },
  watch: {
    page(newV, old) {
      this.setContentKey(newV);
    }
  },
  mounted() {
    this.setContentKey(this.page);
    this.get();
  }
};
</script>

<style lang="stylus" scoped>
header {
  position: relative;
  padding-bottom: 80px;
  margin-bottom: 20px;
  overflow: hidden;

  @media only screen and (min-width: 48em) {
    padding-bottom: 140px;
  }

  @media only screen and (min-width: 64em) {
    padding-bottom: 200px;
  }
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
    // animation: move_wave 40s linear infinite;
    background-size: 84% 40px;

    @media only screen and (min-width: 48em) {
      background-size: 84% 120px;
    }

    @media only screen and (min-width: 64em) {
      background-size: 84% 160px;
    }
  }

  &.waveMiddle {
    // animation: move_wave 50s linear infinite;
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
    // animation: move_wave 60s linear infinite;
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

@keyframes move_wave {
  0% {
    transform: translateX(0) translateZ(0) scaleY(1);
  }

  25% {
    transform: translateX(-25%) translateZ(0) scaleY(0.6);
  }

  50% {
    transform: translateX(-50%) translateZ(0) scaleY(1);
  }

  75% {
    transform: translateX(-25%) translateZ(0) scaleY(0.6);
  }

  100% {
    transform: translateX(0) translateZ(0) scaleY(1);
  }
}
</style>
