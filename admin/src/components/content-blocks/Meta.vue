<template lang="pug">
  div
    form(@submit.prevent="save")
      .form-group(:class="{ 'has-error': form.title.error }")
        label(for="meta_title") 
          | Title
          i.req-star *
        input#meta_title.form-control(v-model="form.title.value" type="text" placeholder="Title")
        span.help-block(v-if="form.title.error") {{ form.title.error }}
      .form-group(:class="{ 'has-error': form.keywords.error }")
        label(for="meta_keywords") Keywords
        input#meta_keywords.form-control(v-model="form.keywords.value" type="text" placeholder="Keywords")
        span.help-block(v-if="form.keywords.error") {{ form.keywords.error }}
      .form-group(:class="{ 'has-error': form.description.error }")
        label(for="meta_description") Description
        textarea#meta_description.form-control(v-model="form.description.value" placeholder="Description")
        span.help-block(v-if="form.description.error") {{ form.title.error }}
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
  props: ["page"],
  data() {
    return {
      form: {
        title: {
          value: null,
          error: null,
        },
        description: {
          value: null,
          error: null,
        },
        keywords: {
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
        const response = await contentService.meta.save({
          title: this.form.title.value,
          description: this.form.description.value,
          keywords: this.form.keywords.value,
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
      const meta = (await contentService.meta.get({
        page: this.page
      })).data;

      this.form.title.value = meta.title;
      this.form.description.value = meta.description;
      this.form.keywords.value = meta.keywords;
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
