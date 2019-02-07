<template lang="pug">
  form(@submit.prevent="save")
    .form-group(
      :class="{ 'has-error': form.title.error }"
    )
      label(for="tp1") 
        | Title
        i.req-star *
      input#tp1.form-control(v-model="form.title.value" type="text" placeholder="Title")
      span.help-block(v-if="form.title.error") {{ form.title.error }}
    .form-group(
      :class="{ 'has-error': form.caption.error }"
    )
      label(for="tp2") Caption
      input#tp2.form-control(v-model="form.caption.value" placeholder="Caption")
      span.help-block(v-if="form.caption.error") {{ form.caption.error }}
    .form-group(
      v-if="button !== 'false'"
      :class="{ 'has-error': form.buttonText.error }"
    )
      label(for="tp3") Button text
      input#tp3.form-control(v-model="form.buttonText.value" type="text" placeholder="buttonText")
      span.help-block(v-if="form.buttonText.error") {{ form.buttonText.error }}
    .btn-grp
      button.btn.btn-success Save
      button(@click="cancel" type="button").btn.btn-danger Cancel
      transition(name="fade")
        span.success-status(v-if="success")
          b Successfully Saved!
</template>

<script>
import contentService from "@/services/ContentService";

export default {
  props: ["page", "name", "button"],
  data() {
    return {
      form: {
        title: {
          value: null,
          error: null,
        },
        caption: {
          value: null,
          error: null,
        },
        buttonText: {
          value: null,
          error: null,
        }
      },
      serverError: null,
      success: false
    };
  },
  methods: {
    async save() {
      const $this = this;
      $this.clearErrors()

       try {
        const response  = await contentService.blockInfo.save({
          title: this.form.title.value,
          caption: this.form.caption.value,
          buttonText: this.form.buttonText.value,
          page: this.page
        });

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
    async get() {
      const meta = (await contentService.blockInfo.get({
        page: this.page
      })).data;

      this.form.title.value = meta.title;
      this.form.caption.value = meta.caption;
      this.form.buttonText.value = meta.buttonText;
    },
    clearErrors() {
      this.serverError = '';
      for(var index in this.form) { 
        this.form[index].error = null
      }
    },
    cancel() {
      this.get();
    }
  },
  mounted() {
    this.get();
  }
};
</script>
