<template>
  <svg
    data-icon-name="blob"
    id="organic-blob"
    xmlns="http://www.w3.org/2000/svg"
    width="400"
    height="330"
    class="css-glamorous-svg--98o1ry icon Menu"
  >
    <circle
      id="Circle1"
      stroke-dashoffset="0"
      stroke-dasharray="0"
      class="css-glamorous-circle--1shryo8 primary"
    ></circle>
    <circle
      id="Circle2"
      stroke-dashoffset="0"
      stroke-dasharray="0"
      class="css-glamorous-circle--1shryo8 secondary"
    ></circle>
    <circle
      id="Circle3"
      stroke-dashoffset="0"
      stroke-dasharray="0"
      class="css-glamorous-circle--1shryo8 tertiary"
    ></circle>
    <circle
      id="Circle4"
      stroke-dashoffset="0"
      stroke-dasharray="0"
      class="css-glamorous-circle--1shryo8 base"
    ></circle>
  </svg>
</template>


<style lang="stylus" scoped>
svg {
  circle {
    fill: #4b0997;
  }
}

#Circle1 {
  cx: 170;
  cy: 175;
  r: 150;
  -webkit-transform-origin: 175px 170px;
  transform-origin: 175px 170px;
  animation: from360to0 4.2s linear infinite;
}

#Circle2 {
  cx: 170;
  cy: 175;
  r: 150;
  -webkit-transform-origin: 175px 170px;
  transform-origin: 175px 170px;
  animation: from360to0 3s linear infinite;
}

#Circle3 {
  cx: 170;
  cy: 170;
  r: 150;
  -webkit-transform-origin: 170px 175px;
  transform-origin: 170px 175px;
  animation: from360to0 4s linear infinite;
}

#Circle4 {
  cx: 175;
  cy: 175;
  r: 150;
  -webkit-transform-origin: 175px 175px;
  transform-origin: 175px 175px;
  animation: from360to0 4.5s linear infinite;
}

@keyframes from360to0 {
  from {
    -webkit-transform: rotate(360deg);
    transform: rotate(360deg);
  }

  to {
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);
  }
}

circle {
  stroke-dasharray: 0;
  stroke-dashoffset: 0;
}
</style>
