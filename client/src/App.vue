<template lang="pug">
  #app
      app-burger
      app-header
      section.content
        <div class="morph-wrap">
          <svg class="morph" width="1400" height="770" viewBox="0 0 1400 770">
            <path d="M 415.6,206.3 C 407.4,286.6 438.1,373.6 496.2,454.8 554.3,536.1 497,597.2 579.7,685.7 662.4,774.1 834.3,731.7 898.5,653.4 962.3,575 967.1,486 937.7,370 909.3,253.9 937.7,201.5 833.4,105.4 729.3,9.338 602.2,13.73 530.6,41.91 459,70.08 423.9,126.1 415.6,206.3 Z"/>
          </svg>
        </div>
        router-view(v-if="isLoaded")
      app-footer
</template>

<script>
import appBurger from "@/components/ui/Burger";
import appHeader from "@/components/Header";
import appFooter from "@/components/Footer";
import contentService from "@/services/ContentService";
import Morph from '@/scripts/demo2.js'

export default {
  metaInfo: {
    title: "Default Title",
    titleTemplate: "%s | GTA"
  },
  data() {
    return {
      isLoaded: false,
      time: 0
    };
  },
  components: {
    appBurger,
    appHeader,
    appFooter
  },
  methods: {
    openmenu(ev) {
      ev.target.classList.toggle("open");
    },
    async getSettings() {
      const data = (await contentService.settings.get()).data;
      this.$store.dispatch("setSettings", data);
      this.isLoaded = true;
    }
  },
  beforeMount() {
    this.getSettings();
  },
  mounted() {
    //this.isLoaded = true;
    setTimeout(function() {
      console.log('trying to morph')
      Morph()
    }, 3000)
  }
};
</script>


<style lang="stylus">
@import './assets/css/main';

.loading-lock {
  background-image: linear-gradient(239deg, #0094d9, #4b0997);
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  color: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column-reverse;

  .logo {
    margin-top: -200px;
    height: 100px;
    margin-bottom: 10px;
  }

  svg {
    display: none;
  }

  .blobs {
    filter: url('#goo');
    width: 300px;
    height: 70px;
    position: relative;
    border-radius: 70px;
    transform-style: preserve-3d;

    // Blob center item
    .blob-center {
      transform-style: preserve-3d;
      position: absolute;
      background: rgba(7, 146, 217, 0.5) !important;
      top: 50%;
      left: 50%;
      width: 20px;
      height: 20px;
      transform-origin: left top;
      transform: scale(0.9) translate(-50%, -50%);
      animation: blob-grow linear 3s infinite 0.5s;
      border-radius: 50%;
      box-shadow: 0 -10px 40px -5px rgba(7, 146, 217, 0.5);
    }

    :nth-of-type(3), :nth-of-type(2) {
      background: rgb(255, 240, 0) !important;
    }

    :nth-of-type(5), :nth-of-type(4) {
      background: rgb(235, 1, 139) !important;
    }

    :nth-of-type(7), :nth-of-type(6) {
      background: rgba(7, 146, 217, 0.5) !important;
    }
  }

  // Blob item
  .blob {
    position: absolute;
    background: #FFF200;
    top: 50%;
    left: 50%;
    width: 20px;
    height: 20px;
    border-radius: 50%;
    animation: blobs ease-out 3.4s infinite;
    transform: scale(0.9) translate(-50%, -50%);
    transform-origin: center top;
    opacity: 0;

    // Set animation delay for each of type
    for $i in 1 .. 5 {
      &:nth-child({$i}) {
        animation-delay: unit($i * 0.2, 's');
      }
    }
  }

  // // Keyframes variables
  // $left: calc(-320px - 50%);
  // $right: calc(320px - 50%);

  // Keyframes
  @keyframes blobs {
    0% {
      opacity: 0;
      transform: scale(0) translate(calc(-320px - 50%), -50%);
    }

    1% {
      opacity: 1;
    }

    35%, 65% {
      opacity: 1;
      transform: scale(0.9) translate(-50%, -50%);
    }

    99% {
      opacity: 1;
    }

    100% {
      opacity: 0;
      transform: scale(0) translate(calc(320px - 50%), -50%);
    }
  }

  @keyframes blob-grow {
    0%, 39% {
      transform: scale(0) translate(-50%, -50%);
    }

    40%, 42% {
      transform: scale(1, 0.9) translate(-50%, -50%);
    }

    43%, 44% {
      transform: scale(1.2, 1.1) translate(-50%, -50%);
    }

    45%, 46% {
      transform: scale(1.3, 1.2) translate(-50%, -50%);
    }

    47%, 48% {
      transform: scale(1.4, 1.3) translate(-50%, -50%);
    }

    52% {
      transform: scale(1.5, 1.4) translate(-50%, -50%);
    }

    54% {
      transform: scale(1.7, 1.6) translate(-50%, -50%);
    }

    58% {
      transform: scale(1.8, 1.7) translate(-50%, -50%);
    }

    68%, 70% {
      transform: scale(1.7, 1.5) translate(-50%, -50%);
    }

    78% {
      transform: scale(1.6, 1.4) translate(-50%, -50%);
    }

    80%, 81% {
      transform: scale(1.5, 1.4) translate(-50%, -50%);
    }

    82%, 83% {
      transform: scale(1.4, 1.3) translate(-50%, -50%);
    }

    84%, 85% {
      transform: scale(1.3, 1.2) translate(-50%, -50%);
    }

    86%, 87% {
      transform: scale(1.2, 1.1) translate(-50%, -50%);
    }

    90%, 91% {
      transform: scale(1, 0.9) translate(-50%, -50%);
    }

    92%, 100% {
      transform: scale(0) translate(-50%, -50%);
    }
  }
}
</style>
