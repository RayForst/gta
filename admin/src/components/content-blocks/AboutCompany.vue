<template lang="pug">
  form.mt-3(@submit.prevent="save")
    .form-group(
      :class="{ 'has-error': form.text.error }"
    )
      label(for="r2") Text
      textarea#r2.form-control(v-model="form.text.value" placeholder="text")
      span.help-block(v-if="form.text.error") {{ form.text.error }}
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
  data() {
    return {
      form: {
        text: {
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
        const response = await contentService.aboutCompany.save({
          text: this.form.text.value
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
      const meta = (await contentService.aboutCompany.get({
        id: 1
      })).data;

      this.form.text.value = meta.text;
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

<style scoped>
  .mt-3 {
    margin-top: 30px;
  }
</style>
