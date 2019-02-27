<template lang="pug">
  section.relative
    ui-morph(
      type="morph7"
      size="medium"
    )
    .container-fluid.mid
      .row.bottom-md
        .col-xs-12.col-md-7
          form.gta-form(
            @submit.prevent="save"
          )
            .row.center-xs.start-md
              .col-xs-12.col-sm-5.input-container.start-sm.form-group(
                :class="{ 'has-error': form.type.error }"
              )
                span.custom-dropdown
                  select(
                    name='subject'
                    v-model="form.type.value"
                  )
                    option(
                      :value="type" 
                      v-for="type, index in subjectTypes"
                      :selected="index === 0 ? true : false"
                    ) {{ type }}
                span.help-block(
                  v-if="form.type.error"
                ) {{ form.type.error }}
              .col-xs-12.col-sm-5.col-sm-offset-1.input-container.start-sm.form-group(
                :class="{ 'has-error': form.fullname.error }"
              )
                .gta-input
                  label(
                    for='#formName'
                  ) Full Name
                  input(
                    type="text"
                    id="formName"
                    v-model="form.fullname.value"
                    name='name'
                    required
                  )
                span.help-block(
                  v-if="form.fullname.error"
                ) {{ form.fullname.error }}
            .row.center-xs.start-md
              .col-xs-12.col-sm-5.input-container.start-sm.form-group(
                :class="{ 'has-error': form.phone.error }"
              )
                .gta-tel-input
                  label.gta-label(
                    for='#formPhone'
                  ) Phone
                  vue-tel-input(
                    v-model="form.phone.value"
                    :preferredCountries="['ca', 'us']"
                  )
                span.help-block(
                  v-if="form.phone.error"
                ) {{ form.phone.error }}
              .col-xs-12.col-sm-5.col-sm-offset-1.input-container.start-sm.form-group(
                :class="{ 'has-error': form.email.error }"
              )
                .gta-input
                  label(
                    for='#formEmail'
                  ) E-mail
                  input(
                    type="email"
                    id="formEmail"
                    name='email'
                    v-model="form.email.value"
                    required
                  )
                span.help-block(
                  v-if="form.email.error"
                ) {{ form.email.error }}
            .row.center-xs.start-md
              .col-xs-12.col-sm-11.input-container.start-sm.form-group(
                :class="{ 'has-error': form.message.error }"
              )
                .gta-textarea
                  label.gta-label(
                    for='#form-message'
                  ) Message
                  textarea(
                    required 
                    id="form-message" 
                    name="form.message.value"
                    v-model="form.message.value"
                    cols="30"
                    rows="6"
                    placeholder="Hi guys, we want to cooporate…"
                  )
                span.help-block(
                  v-if="form.message.error"
                ) {{ form.message.error }}
            .row.result-wrap
              .col-xs-12.center-xs.start-md.button-wrap(
                v-if="!success"
              )
                button.ui-btn.gta-form__button.button.button-primary.button-big Send
              .col-xs-12.primary.gta-form__response(
                v-if="success"
              ) Thank You for contacting Us!<br />
                | If you have any more questions, click 
                a.link(href='#' @click.prevent="resetForm") here
                |  to write a new message.
            .spacer
        .col-xs-12.col-md-5.first-xs.last-md
          .image-wrap
            img(
              src="../assets/img/gta-house.png"
              srcset="../assets/img/gta-house@2x.png 2x"
              alt=""
            )
</template>

<script>
import uiMorph from "@/components/ui/Morph";
import contentService from "@/services/ContentService";

export default {
  data() {
    return {
      success: false,
      serverError: null,
      form: {
        type: {
            value: null,
            error: null,
        },
        phone: {
            value: null,
            error: null,
        },
        fullname: {
            value: null,
            error: null,
        },
        email: {
            value: null,
            error: null,
        },
        message: {
            value: null,
            error: null,
        },
      },
    };
  },
  components: {
    uiMorph
  },
  computed: {
    subjectTypes() {
      if (this.$store.state.settings.subjects) {
        if (this.$store.state.settings.subjects.indexOf(',') > -1) {
          let arr = this.$store.state.settings.subjects.split(',');
          this.form.type.value = arr[0]

          return arr;
        } else {
          this.form.type.value = this.$store.state.settings.subjects
          return [this.$store.state.settings.subjects]
        }
      } else {
        return [];
      }
    }
  },
  methods: {
    async save() {
      const $this = this;
      $this.clearErrors()

      try {
        const response = await contentService.contactRequest.save({
          type: this.form.type.value,
          phone: this.form.phone.value,
          fullname: this.form.fullname.value,
          email: this.form.email.value,
          message: this.form.message.value,
        });

        
        $this.success = true;
        $this.clearForm();
      } catch(err) {
         if (err.response.status === 422) {
          err.response.data.errors.forEach(function(element) {
            $this.form[element.param].error = element.msg
          })
        } else {
          console.log('ERRR :',err.response.status)
        }
      }
    },
    clearErrors() {
      this.serverError = '';
      for(var index in this.form) { 
        this.form[index].error = null
      }
    },
    clearForm() {
      for(var index in this.form) {
        if (index !== 'type') this.form[index].value = null
      }
    },
    resetForm() {
      this.success = false;
    }
  }
};
</script>

<style lang="stylus" scoped>
.input-container {
  padding-bottom: 32px;
}

.help-block {
  font-size: 14px;
  color: #f50a0a;
  font-weight: bold;
  margin-top: 10px;
  display: block;
}

.gta-form {
  @media only screen and (min-width: 64em) {
    padding-top: 40px;
  }

  &__response {
    text-align: center;
    line-height: 1.6em;
    color: #1ba51b;
    font-weight: bold;
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
    background: transparent;

    &:focus {
      outline: #0094d9 auto 5px;
    }
  }
}

input {
  background: transparent;
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

