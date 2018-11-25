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
</template>

<script>
export default {
  data() {
    return {
      routes: [
        {
          text: 'What we do',
          route: 'what-we-do'
        },
        {
          text: 'Our works',
          route: 'works'
        },
        {
          text: 'Logo',
          route: 'index'
        },
        {
          text: 'Company',
          route: 'about'
        },
        {
          text: 'Contact us',
          route: 'contacts'
        },
      ]
    }
  }
}
</script>

<style lang="stylus" scoped>
header {
  position: relative;
  padding-bottom: 160px;
}

nav {
  color: #fff;
  padding: 10px 0;
}

.logo {
  opacity: 1;
}

a {
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
  justify-content: space-around;
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
