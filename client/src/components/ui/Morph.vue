<template>
  <div class="morph-wrap" :class="[size, type]">
    <svg ref="svg" class="morph" :viewBox="viewbox">
      <path :fill="color" ref="shape" :d="path"></path>
    </svg>
  </div>
</template>

<style lang="stylus" scoped>
.morph-wrap {
  .morph {
    left: 0;
    width: 100%;
  }

  &.small {
    height: 600px;

    &.morph4 {
      top: -20%;
      min-width: 500px;

      @media only screen and (min-width: 64em) {
        top: -30%;
      }
    }
  }

  &.medium {
    height: 1700px;
    top: -150px;

    &.morph2 {
      display: none;

      @media only screen and (min-width: 64em) {
        display: block;
        height: 1050px;
        top: -163px;
      }
    }

    &.morph7 {
      height: 1100px;
      top: -100px;
      left: -20%;
    }
  }

  &.large {
    height: 2020px;
    top: -150px;

    &.morph3 {
      .morph {
        height: 100%;
      }
    }

    &.morph5 {
      top: 20px;
    }

    &.morph6 {
      top: -200px;
    }
  }
}
</style>


<script>
import anime from "animejs";

export default {
  data() {
    return {
      loaded: false,
      color: "rgba(74, 144, 226, 0.05)",
      shapes: {
        small: {
          viewbox: "0 0 397 305",
          start:
            "M1.0964702,210.295657 C23.5073558,259.342195 81.1496004,288.86761 152.199947,296.659219 C215.981049,303.653659 305.446915,320.633347 375.050821,290.998969 C522.191514,228.352732 293.712679,-35.0566735 145.202392,57.0344017 C-3.30789458,149.125477 -41.4324168,117.22059 1.0964702,210.295657 Z",
          end:
            "M28.1517099,202.169947 C70.680597,295.245015 240.08546,318.020166 387.226153,255.373928 C534.366846,192.727691 342.345027,141.116627 434.396944,105.548012 C526.448862,69.9793978 320.767918,-43.1823833 172.257632,48.9086919 C23.7473452,140.999767 -14.3771771,109.09488 28.1517099,202.169947 Z",
          scaleX: 1,
          scaleY: 1,
          rotate: 0,
          tx: 0,
          ty: 100,
          duration: 4000
        },
        medium: {
          viewbox: "0 0 969 606",
          start:
            "M33.7138503,411.204065 C126.368134,613.482731 495.436955,662.97963 816.000612,526.83149 C1136.56427,390.683349 718.221694,278.517787 918.767842,201.217044 C1119.31399,123.9163 671.213373,-122.016524 347.665893,78.123647 C24.1184132,278.263818 -58.9404334,208.925398 33.7138503,411.204065 Z",
          end:
            "M24.6177325,275.332558 C77.3068445,390.361059 287.685071,562.253166 459.396473,572.425739 C589.641136,580.141728 668.633698,449.685641 806.904494,390.959983 C1127.46815,254.811842 779.470461,-144.95179 455.922981,55.1883803 C132.375501,255.328551 -68.0365512,73.0538915 24.6177325,275.332558 Z",
          scaleX: 1,
          scaleY: 1,
          rotate: 0,
          tx: 0,
          ty: 100,
          duration: 4000
        },
        large: {
          viewbox: "0 0 1400 800",
          start:
            "M 415.6,206.3 C 407.4,286.6 438.1,373.6 496.2,454.8 554.3,536.1 497,597.2 579.7,685.7 662.4,774.1 834.3,731.7 898.5,653.4 962.3,575 967.1,486 937.7,370 909.3,253.9 937.7,201.5 833.4,105.4 729.3,9.338 602.2,13.73 530.6,41.91 459,70.08 423.9,126.1 415.6,206.3 Z",
          end:
            "M 415.6,206.3 C 407.4,286.6 415.5,381.7 473.6,462.9 531.7,544.2 482.5,637.6 579.7,685.7 676.9,733.8 826.2,710.7 890.4,632.4 954.2,554 926.8,487.6 937.7,370 948.6,252.4 937.7,201.5 833.4,105.4 729.3,9.338 602.2,13.73 530.6,41.91 459,70.08 423.9,126.1 415.6,206.3 Z",
          scaleX: 2,
          scaleY: 1,
          rotate: 0,
          tx: 0,
          ty: 100,
          duration: 2000
        }
      }
    };
  },
  props: ["type", "size"],
  computed: {
    path() {
      return this.shapes[this.size].start;
    },
    viewbox() {
      let that = this;
      return this.shapes[this.size].viewbox;
    }
  },
  mounted() {
    const that = this;
    const size = this.size;
    const initShapeLoop = function(pos) {
      anime.remove(that.$refs.shape);
      anime({
        targets: that.$refs.shape,
        easing: "linear",
        d: [
          {
            value: that.shapes[size].end,
            duration: that.shapes[size].duration
          },
          {
            value: that.shapes[size].start,
            duration: that.shapes[size].duration
          }
        ],
        loop: true,
        direction: "alternate"
      });
    };

    const initShapeEl = function() {
      anime.remove(that.$refs.svg);
      anime({
        targets: that.$refs.svg,
        duration: 1,
        easing: "linear",
        scaleX: that.shapes[size].scaleX,
        scaleY: that.shapes[size].scaleY,
        translateX: that.shapes[size].tx + "px",
        translateY: that.shapes[size].ty + "px",
        rotate: that.shapes[size].rotate + "deg"
      });

      initShapeLoop();
    };

    initShapeEl();
  }
};
</script>
