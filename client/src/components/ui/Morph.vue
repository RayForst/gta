<template>
  <div class="morph-wrap">
    <svg ref="svg" class="morph" viewBox="0 0 969 606">
      <path ref="shape" :d="shapes.second.start"></path>
    </svg>
  </div>
</template>

<style lang="stylus" scoped>
.morph-wrap {
  max-height: 700px;
}

.morph {
  max-height: none;
  height: 100%;
}
</style>


<script>
import anime from "animejs";

export default {
  data() {
    return {
      shapes: {
        second: {
          start:
            "M33.7138503,411.204065 C126.368134,613.482731 495.436955,662.97963 816.000612,526.83149 C1136.56427,390.683349 718.221694,278.517787 918.767842,201.217044 C1119.31399,123.9163 671.213373,-122.016524 347.665893,78.123647 C24.1184132,278.263818 -58.9404334,208.925398 33.7138503,411.204065 Z",
          end:
            "M24.6177325,275.332558 C77.3068445,390.361059 287.685071,562.253166 459.396473,572.425739 C589.641136,580.141728 668.633698,449.685641 806.904494,390.959983 C1127.46815,254.811842 779.470461,-144.95179 455.922981,55.1883803 C132.375501,255.328551 -68.0365512,73.0538915 24.6177325,275.332558 Z",
          fill: {
            color: "#d65640",
            duration: 4500,
            easing: "linear"
          },
          scaleX: 1,
          scaleY: 1,
          rotate: 0,
          tx: 0,
          ty: 100
        }
      }
    };
  },
  mounted() {
    const that = this;

    const initShapeLoop = function(pos) {
      anime.remove(that.$refs.shape);
      anime({
        targets: that.$refs.shape,
        easing: "linear",
        d: [
          { value: that.shapes.second.end, duration: 1500 },
          { value: that.shapes.second.start, duration: 1500 }
        ],
        loop: true,
        fill: {
          value: "rgba(#4a90e2, 0.05)",
          duration: that.shapes.second.fill.duration,
          easing: that.shapes.second.fill.easing
        },
        direction: "alternate"
      });
    };

    const initShapeEl = function() {
      anime.remove(that.$refs.svg);
      anime({
        targets: that.$refs.svg,
        duration: 1,
        easing: "linear",
        scaleX: that.shapes.second.scaleX,
        scaleY: that.shapes.second.scaleY,
        translateX: that.shapes.second.tx + "px",
        translateY: that.shapes.second.ty + "px",
        rotate: that.shapes.second.rotate + "deg"
      });

      initShapeLoop();
    };

    initShapeEl();
  }
};
</script>
