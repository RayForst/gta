<template lang="pug">
  section.relative
    <div class="morph-wrap">
      <svg class="morph" width="1400" height="770" viewBox="0 0 1400 770">
        <path d="M 415.6,206.3 C 407.4,286.6 438.1,373.6 496.2,454.8 554.3,536.1 497,597.2 579.7,685.7 662.4,774.1 834.3,731.7 898.5,653.4 962.3,575 967.1,486 937.7,370 909.3,253.9 937.7,201.5 833.4,105.4 729.3,9.338 602.2,13.73 530.6,41.91 459,70.08 423.9,126.1 415.6,206.3 Z"/>
      </svg>
    </div>
    .container-fluid.mid
      .row.bottom-md
        .col-xs-12.col-md-7
          form.gta-form
            .row.center-xs.start-md
              .col-xs-12.col-sm-5.input-container.start-sm
                span.custom-dropdown
                  select(name='subject')
                    option(value="1") Payment question
                    option(value="2") Life meaning question
                    option(value="3") Drug question
              .col-xs-12.col-sm-5.col-sm-offset-1.input-container.start-sm
                .gta-input
                  label(for='#formName') Full Name
                  input(type="text" id="formName" name='name' required)
            .row.center-xs.start-md
              .col-xs-12.col-sm-5.input-container.start-sm
                .gta-tel-input
                  label.gta-label(for='#formPhone') Phone
                  vue-tel-input(v-model="phone"
                        @onInput="onInput"
                        :preferredCountries="['ca', 'us']")
              .col-xs-12.col-sm-5.col-sm-offset-1.input-container.start-sm
                .gta-input
                  label(for='#formEmail') E-mail
                  input(type="email" id="formEmail" name='email' required)
            .row.center-xs.start-md
              .col-xs-12.col-sm-11.input-container.start-sm
                .gta-textarea
                  label.gta-label(for='#formMesssge') Message
                  textarea(required id="formMesssge" name="message", cols="30", rows="6" placeholder="Hi guys, we want to cooporate…")
            .row.result-wrap
              .col-xs-12.center-xs.start-md.button-wrap
                button.ui-btn.gta-form__button.button.button-primary.button-big Send
              .col-xs-12.primary.gta-form__response(v-if="success")
                | Thank You for contacting Us! If you have any more questions, click here to write a new message.
        .col-xs-12.col-md-5.first-xs.last-md
          .image-wrap
              img(src="../assets/img/gta-house.svg", alt="")
</template>

<script>
export default {
  data() {
    return {
      phone: "",
      success: false
    };
  },
  methods: {
    onInput({ number, isValid, country }) {
      console.log(number, isValid, country);
    }
  }
};
</script>

<style lang="stylus" scoped>
.input-container {
  padding-bottom: 32px;
}

.gta-form {
  @media only screen and (min-width: 64em) {
    padding-top: 40px;
  }
}

.result-wrap {
  height: 160px;
}

.image-wrap {
  margin-bottom: 50px;
  text-align: center;

  @media only screen and (min-width: 64em) {
    padding-bottom: 60px;
  }

  img {
    width: 100%;
    max-width: 430px;
    margin-left: 10%;

    @media only screen and (min-width: 64em) {
      margin-left: 0;
    }
  }
}

.custom-dropdown {
  position: relative;
  display: inline-block;
  vertical-align: middle;
  border-bottom: solid 1px #0094d9;
  width: 100%;
  margin-top: 11px;

  select {
    background-color: transparent;
    color: #576574;
    font-size: inherit;
    padding: 0.5em;
    padding-right: 2.5em;
    border: 0;
    margin: 0;
    border-radius: 3px;
    text-indent: 0.01px;
    text-overflow: 'elepsis';
    -webkit-appearance: button; /* hide default arrow in chrome OSX */
    cursor: pointer;
    padding-left: 15px;
    width: 100%;
    line-height: 22px;
    padding: 8px 16px;

    &:focus {
      outline: #0094d9 auto 5px;
    }
  }

  &::before, &::after {
    content: '';
    position: absolute;
    pointer-events: none;
  }

  &::after { /* Custom dropdown arrow */
    ontent: '';
    width: 0;
    right: 10px;
    top: 50%;
    margin-top: -3px;
    bottom: 0;
    border-left: 4px solid transparent;
    border-right: 4px solid transparent;
    border-top: 6px solid #0094d9;
  }

  &::before { /* Custom dropdown arrow cover */
    width: 2em;
    right: 0;
    top: 0;
    bottom: 0;
    border-radius: 0 3px 3px 0;
  }

  select[disabled] {
    color: rgba(0, 0, 0, 0.3);
  }

  select[disabled]::after {
    color: rgba(0, 0, 0, 0.1);
  }
}

label {
  display: block;
  font-size: 9px;
  font-weight: bold;
  font-style: normal;
  font-stretch: normal;
  line-height: normal;
  letter-spacing: 1.5px;
  color: #8395a7;
  text-transform: uppercase;
}

.gta-input {
  border-bottom: 1px solid #0094d9;

  input {
    border: 0;
    width: 100%;
    line-height: 22px;
    padding: 5px 16px 5px 16px;
    margin: 3px 0;
    box-sizing: border-box;

    &:focus {
      outline: #0094d9 auto 5px;
    }
  }
}

textarea {
  width: 100%;
  height: 140px;
  background-color: rgba(0, 148, 217, 0.1);
  border: 1px solid #0094d9;
  padding: 23px;
  box-sizing: border-box;
  resize: none;
  margin: 10px 0;

  &:focus {
    outline: #0094d9 auto 5px;
  }
}

select {
  width: 100%;
  background: none;
  border: none;
}

div.vue-tel-input {
  border: none;
  line-height: 22px;
  padding: 5px 16px 5px 6px;
  height: 22px;
  margin: 3px 0;
}

.gta-tel-input {
  border-bottom: 1px solid #0094d9;
}
</style>

