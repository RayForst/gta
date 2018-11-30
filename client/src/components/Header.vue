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
              .col-xs-12
                h1 {{ title }}
                p.heading-caption {{ caption }}
                router-link.ui-btn(:to="{ name: 'contacts' }") Request a quote
          template(v-else)
            .row.middle-xs
              .col-xs-8
                h1 {{ title }}
                p.heading-caption {{ caption }}
              .col-xs-4
                router-link.ui-btn(:to="{ name: 'contacts' }") Request a quote
        template(v-else)
          .row
            .col-xs-12
              router-link(:to="{ name: 'index' }") Home
              | /
              router-link(:to="{ name: itemView.breadcrumbs[0].route }") {{ itemView.breadcrumbs[0].name }}
              | / 
              span {{ itemView.breadcrumbs[1].name }}
          .row
            .col-xs-12
              span {{ itemView.icon }}
              h1 {{ itemView.title }}
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
      const blockInfo = (await contentService.head.get({
        page: this.contentKey
      })).data;

      this.title = blockInfo.title;
      this.caption = blockInfo.caption;
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
  mounted() {
    this.get();
  }
};
</script>

<style lang="stylus" scoped>
header {
  position: relative;
  padding-bottom: 200px;
  margin-bottom: 20px;
}

nav {
  color: #fff;
  padding: 10px 0;
  padding-bottom: 60px;
}

.logo {
  opacity: 1;
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
  transition: opacity 0.3s ease;
  padding: 10px;

  &:not(.logo) {
    margin-top: 55px;
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
  background-image: linear-gradient(115deg, #0094d9, #eb008b);

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
    background-size: 84% 160px;
  }

  &.waveMiddle {
    // animation: move_wave 50s linear infinite;
    background-size: 80% 130px;
    animation-delay: 2s;
    background-position-x: -20%;
  }

  &.waveBottom {
    // animation: move_wave 60s linear infinite;
    background-size: 76% 100px;
    animation-delay: 1s;
    background-position-x: 30%;
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
