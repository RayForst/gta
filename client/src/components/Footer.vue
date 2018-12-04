<template lang="pug">
    footer
      .waveWrapper.waveAnimation
        .waveWrapperInner.bgTop
          .wave.waveTop(style="background-image: url('http://front-end-noobs.com/jecko/img/wave-bot.png')")
      .container-fluid
        .row.ca
          .col-xs-12.col-sm-5.col-md-3.align-start.center-xs.start-sm
            router-link(:to="{ name: 'index' }")
              img(src="../assets/img/logo-no-text.svg", alt="")
          .col-xs-12.col-sm-7.col-md-9.align-center
            .row.align-center.w100
              .col-xs-12.col-md-7
                h4 Printing services
                p We want you to feel assured that your shirts are being printed by the best of the best.
              .col-xs-12.col-md-5.center-xs.start-sm
                router-link.ui-btn(:to="{ name: 'contacts' }") Request a quote 
        .row.content
          .col-xs-12.col-sm-5.col-md-3.address.last-xs.first-sm
            div
              img(src="../assets/img/flag-can.png" srcset="../assets/img/flag-can@2x.png 2x" alt="")
              span 790 Eglinton Ave East Toronto, ON M4G 2L1
            div.copy © 2018 GTA Image solutions Inc
          .col-xs-12.col-sm-7.col-md-9
            .row
              .col-xs-12.col-md-7
                section
                  h4 Find what you’re looking for
                  ul.links
                    li(v-for="item in routes")
                      router-link(:to='{ name: item.route }') {{ item.text }}
              .col-xs-12.col-md-5
                section.contacts
                  h4 Feel free to contact us
                  div
                    a(href="#") {{ phone }}
                  div
                    a(href="#") {{ email }}
                  div.social
                    a(href="#")
                      img(src="../assets/img/social/facebook.svg", alt="")
                    a(href="#")
                      img(src="../assets/img/social/twitter.svg", alt="")
                    a(href="#")
                      img(src="../assets/img/social/instagram.svg", alt="")
                    a(href="#")
                      img(src="../assets/img/social/youtube.svg", alt="")
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
  padding-top: 40px;

  @media only screen and (min-width: 48em) {
    padding-top: 120px;
  }

  @media only screen and (min-width: 48em) {
    padding-top: 160px;
  }
}

.copy {
  margin-top: auto;
}

.ca {
  border-bottom: 1px solid rgba(255, 255, 255, 0.4);
  padding: 80px 0 35px 0;
}

.align-start {
  display: flex;
  align-items: flex-start;
}

.align-center {
  display: flex;
  align-items: center;
}

.w100 {
  min-width: 100%;
}

.content {
  padding: 50px 0;
}

.links a {
  font-size: 14px;
  font-weight: bold;
  font-style: normal;
  font-stretch: normal;
  line-height: 2.71;
  letter-spacing: normal;
  color: #ffffff;
  text-decoration: none;
}

.copy {
  opacity: 0.5;
  font-size: 11px;
  line-height: 2;
  color: #ffffff;
}

.address {
  display: flex;
  align-items: flex-start;
  flex-direction: column;

  div:first-child {
    display: flex;
    align-items: flex-start;
  }

  span {
    opacity: 0.5;
    font-size: 14px;
    font-weight: bold;
    line-height: 1.64;
    color: #ffffff;
    max-width: 160px;
    padding-left: 0;
    padding-top: 20px;
    padding-bottom: 25px;

    @media only screen and (min-width: 48em) {
      padding-left: 15px;
      padding-top: 0;
      padding-bottom: 0;
    }
  }
}

h3, h4, ul {
  padding: 0;
  margin: 0;
}

.contacts a {
  font-size: 16px;
  font-weight: bold;
  line-height: 1.78;
  color: #fff;
  text-decoration: none;

  @media only screen and (min-width: 64em) {
    font-size: 18px;
  }
}

h4 {
  opacity: 0.5;
  font-size: 18px;
  font-weight: bold;
  color: #ffffff;
}

.content {
  h4 {
    margin-bottom: 25px;
  }
}

ul {
  list-style-type: none;
}

p {
  font-size: 14px;
  line-height: 1.57;
  color: #ffffff;
  max-width: 380px;
  margin-top: 6px;
  margin-bottom: 30px;
}

.social {
  margin-top: 30px;

  a {
    margin-right: 30px;
  }
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
    animation: move_wave 120s linear infinite;
    background-size: 76% 40px;

    @media only screen and (min-width: 48em) {
      background-size: 76% 120px;
    }

    @media only screen and (min-width: 64em) {
      background-size: 76% 160px;
    }
  }
}

ul {
  margin-bottom: 50px;

  @media only screen and (min-width: 64em) {
    margin-bottom: 0;
  }
}

.contacts {
  margin-bottom: 50px;

  @media only screen and (min-width: 48em) {
    margin-bottom: 0;
  }
}

.address {
  div:first-child {
    flex-direction: column;

    @media only screen and (min-width: 48em) {
      flex-direction: row;
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
