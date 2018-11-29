<template lang="pug">
    footer
      .waveWrapper.waveAnimation
        .waveWrapperInner.bgTop
          .wave.waveTop(style="background-image: url('http://front-end-noobs.com/jecko/img/wave-bot.png')")
      .container-fluid
        .row
          .col-xs-3
            | Logo
          .col-xs-9
            .row
              .col-xs-9
                h4 Find what you’re looking for
                p We want you to feel assured that your shirts are being printed by the best of the best.
              .col-xs-3
                router-link.ui-btn(:to="{ name: 'contacts' }") Request a quote 
        .row
          .col-xs-12
            section
              h4 Find what you’re looking for
              ul
                li(v-for="item in routes")
                  router-link(:to='{ name: item.route }') {{ item.text }}
            section
              h4 Feel free to contact us
              a(href="#") {{ phone }}
              a(href="#") {{ email }}
</template>

<script>
export default {
  data() {
    return {
      phone: "+1 (416) 522-4501",
      email: "hello@gtaimagesolutions.com",
      routes: [
        {
          text: "What we do",
          route: "what-we-do"
        },
        {
          text: "Works",
          route: "works"
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
  }
};
</script>

<style lang="stylus" scoped>
footer {
  position: relative;
  padding-top: 160px;
}

h3, h4, ul {
  padding: 0;
  margin: 0;
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
  transform: rotate(180deg);
  opacity: 0.92;
}

.waveWrapperInner {
  position: absolute;
  width: 100%;
  overflow: hidden;
  height: 100%;
  top: -1px;
  background-image: linear-gradient(127deg, #0094d9, #a709ff);
  z-index: 15;
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
    // animation: move_wave 120s linear infinite;
    background-size: 76% 160px;
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
