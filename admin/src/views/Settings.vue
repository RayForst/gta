<template lang="pug">
  div
    div.content-header
      h1 Settings
    section.content
      .box.box-default.color-palette-box
        .box-body
          form.box-body(
            @submit.prevent="save"
          )
            .form-group(
              :class="{ 'has-error': form.email.error }"
            )
              label(for="r1") Email
              input#r1.form-control(v-model="form.email.value" type="email" placeholder="Email")
              span.help-block(
                v-if="form.email.error"
              ) {{ form.email.error }}
            .form-group(
              :class="{ 'has-error': form.contactFormEmail.error }"
            )
              label(for="r1") Email for contact form requests
              input#r1.form-control(v-model="form.contactFormEmail.value" type="text" placeholder="Email")
              span.help-block(
                v-if="form.contactFormEmail.error"
              ) {{ form.contactFormEmail.error }}
            .form-group(
              :class="{ 'has-error': form.contactFormSubject.error }"
            )
              label(for="r1") Contact form subjects
              input#r1.form-control(v-model="form.contactFormSubject.value" type="text" placeholder="Subjects")
              span.help-block(
                v-if="form.contactFormSubject.error"
              ) {{ form.contactFormSubject.error }}
            .form-group(
              :class="{ 'has-error': form.lat.error }"
            )
              label(for="r1") Map Latitude
              input#r1.form-control(v-model="form.lat.value" type="text" placeholder="Latitude")
              span.help-block(
                v-if="form.lat.error"
              ) {{ form.lat.error }}
            .form-group(
              :class="{ 'has-error': form.long.error }"
            )
              label(for="r1") Map Longitude
              input#r1.form-control(v-model="form.long.value" type="text" placeholder="Longitude")
              span.help-block(
                v-if="form.long.error"
              ) {{ form.long.error }}
            .form-group(
              :class="{ 'has-error': form.phone.error }"
            )
              label(for="r1") Phone
              input#r1.form-control(v-model="form.phone.value" type="text" placeholder="Phone")
              span.help-block(
                v-if="form.phone.error"
              ) {{ form.phone.error }}
            .form-group(
              :class="{ 'has-error': form.address.error }"
            )
              label(for="r1") Address
              input#r1.form-control(v-model="form.address.value" type="text" placeholder="Address")
              span.help-block(
                v-if="form.address.error"
              ) {{ form.address.error }}
            .form-group(
              :class="{ 'has-error': form.copyright.error }"
            )
              label(for="r1") Copyright
              input#r1.form-control(v-model="form.copyright.value" type="text" placeholder="Copyright")
              span.help-block(
                v-if="form.copyright.error"
              ) {{ form.copyright.error }}
            .form-group(
              :class="{ 'has-error': form.facebook.error }"
            )
              label(for="r1") Facebook
              input#r1.form-control(v-model="form.facebook.value" type="text" placeholder="Facebook")
              span.help-block(
                v-if="form.facebook.error"
              ) {{ form.facebook.error }}
            .form-group(
              :class="{ 'has-error': form.twitter.error }"
            )
              label(for="r1") Twitter
              input#r1.form-control(v-model="form.twitter.value" type="text" placeholder="Twitter")
              span.help-block(
                v-if="form.twitter.error"
              ) {{ form.twitter.error }}
            .form-group(
              :class="{ 'has-error': form.instagram.error }"
            )
              label(for="r1") Instagram
              input#r1.form-control(v-model="form.instagram.value" type="text" placeholder="Instagram")
              span.help-block(
                v-if="form.instagram.error"
              ) {{ form.instagram.error }}
            .form-group(
              :class="{ 'has-error': form.youtube.error }"
            )
              label(for="r1") Youtube
              input#r1.form-control(v-model="form.youtube.value" type="text" placeholder="Youtube")
              span.help-block(
                v-if="form.youtube.error"
              ) {{ form.youtube.error }}
            .btn-grp
              button.btn.btn-success Save
              transition(name="fade")
                span.success-status(v-if="success")
                  b Successfully Saved!
</template>


<script>
import contentService from "@/services/ContentService";

export default {
  data() {
    return {
      form: {
        email: {
          value: '',
          error: null
        },
        contactFormEmail: {
          value: '',
          error: null
        },
        contactFormSubject: {
          value: '',
          error: null
        },
        phone: {
          value: '',
          error: null
        },
        address: {
          value: '',
          error: null
        },
        copyright: {
          value: '',
          error: null
        },
        facebook: {
          value: '',
          error: null
        },
        twitter: {
          value: '',
          error: null
        },
        instagram: {
          value: '',
          error: null
        },
        youtube: {
          value: '',
          error: null
        },
        lat: {
          value: '',
          error: null
        },
        long: {
          value: '',
          error: null
        }
      },
      success: false,
      serverError: null,
    }
  },
  methods: {
    async get() {
      let settings = (await contentService.settings.get()).data;

      if (settings.length) {
        let setting = settings[0]

        for(var index in this.form) {
          this.form[index].value = setting[index]
        }
      }
    },
    async save() {
      const $this = this;
      $this.clearErrors();
      let data = {};

      for(var index in this.form) { 
        data[index] = this.form[index].value
      }

      try {
        const response = await contentService.settings.save(data);

        $this.success = true;

        setTimeout(() => {
          $this.success = false;
        }, 4000)
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
    }
  },
  mounted() {
    this.get()
  }
}
</script>
