<template lang="pug">
  form(@submit.prevent="save")
    .form-group(
      :class="{ 'has-error': form.title.error }"
    )
      label(for="caption1")
        | Title
        i.req-star *
      input#caption1.form-control(v-model="form.title.value" type="text" placeholder="Title")
      span.help-block(v-if="form.title.error") {{ form.title.error }}
    .form-group(
      :class="{ 'has-error': form.caption.error }"
    )
      label(for="caption2") Caption
      input#caption2.form-control(v-model="form.caption.value" placeholder="Caption")
      span.help-block(v-if="form.caption.error") {{ form.caption.error }}
    .form-group.has-error(
      v-if="serverError"
    )
      span.help-block
        b {{ serverError }}
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
        title: {
          value: null,
          error: null,
        },
        caption: {
          value: null,
          error: null,
        }
      },
      serverError: null,
      success: false
    };
  },
  props: ["page"],
  methods: {
    async save() {
      const $this = this;
      $this.clearErrors()

      try {
        const response = await contentService.head.save({
          title: this.form.title.value,
          caption: this.form.caption.value,
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
      const response = (await contentService.head.get({
        page: this.page
      })).data;

      this.form.title.value = response.title;
      this.form.caption.value = response.caption;
      this.caption = response.caption;
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
