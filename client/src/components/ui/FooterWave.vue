<template lang="pug">
   .waveWrapper.waveAnimation
      .waveWrapperInner.bgTop
        .wave.waveTop(style="background-image: url('http://front-end-noobs.com/jecko/img/wave-bot.png')")
</template>

<style lang="stylus" scoped>
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
    background-size: 76% 40px;

    @media only screen and (min-width: 48em) {
      background-size: 76% 120px;
    }

    @media only screen and (min-width: 64em) {
      background-size: 76% 160px;
    }
  }
}
</style>

