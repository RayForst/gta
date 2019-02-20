<template lang="pug">
  form(@submit.prevent="save")
    appImageGallery(keyword="about-gallery" name="First gallery")
    .form-group(
      :class="{ 'has-error': form.description.error }"
    )
      label(for="testid-2") 
        | Description
        i.req-star *
      ckeditor#testid-2(
        :editor="editor"
        v-model="form.description.value"
        :config="editorConfig"
      )
      span.help-block(v-if="form.description.error") {{ form.description.error }}
    appImageGallery(keyword="about-gallery-2" name="Second gallery")
    .form-group(
      :class="{ 'has-error': form.shortDescription.error }"
    )
      label(for="r2") 
        | Short Description
        i.req-star *
      textarea#r2.form-control(v-model="form.shortDescription.value" placeholder="text")
      span.help-block(v-if="form.shortDescription.error") {{ form.shortDescription.error }}
    .btn-grp
      button.btn.btn-success Save
      button(@click="cancel" type="button").btn.btn-danger Cancel
      transition(name="fade")
        span.success-status(v-if="success")
          b Successfully Saved!
</template>

<script>
import appImageGallery from "@/components/ImageGallery/ImageGallery";
import contentService from "@/services/ContentService";
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';

export default {
  data() {
    return {
      editor: ClassicEditor,
      editorConfig: {
        toolbar: [ 'bold', 'italic', 'link', 'blockquote', 'numberedList', 'bulletedList']
      },
      form: {
        gallery: {
          value: [],
          error: null,
        },
        gallery2: {
          value: [],
          error: null,
        },
        description: {
          value: null,
          error: null,
        },
        shortDescription: {
          value: null,
          error: null,
        }
      },
      serverError: null,
      success: false
    };
  },
  components: {
    appImageGallery
  },
  methods: {
    async save() {
      const $this = this;
      $this.clearErrors()
      let img;

      try {
        const response =  await contentService.about.save({
          shortDescription: this.form.shortDescription.value,
          description: this.form.description.value
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
      const meta = (await contentService.about.get({
        id: 1
      })).data;
      this.form.shortDescription.value = meta.shortDescription;
      this.form.description.value = meta.description;
    },
    addToGallery(prop, fileName) {
        var names = prop.split(',')
        names.push(fileName)
        prop = names.join(',')
    },
    onFileSelected(event) {
      this.form[event.target.getAttribute('id')].value = event.target.files[0];
    },
    cancel() {
      this.get();
    },
    clearErrors() {
      this.serverError = '';
      for(var index in this.form) { 
        this.form[index].error = null
      }
    },
  },
  mounted() {
    this.get();
  }
};
</script>
