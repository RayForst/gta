<template lang="pug">
  .form-group(
    :class="{ 'has-error': error }"
  )
    label(for="gallery") Upload image
    input#gallery.form-control(placeholder="File" type="file" @change="onFileSelected" ref="galleryUpload")
    span(v-if="loading") Loading...
    span.help-block(
      v-if="error"
    ) {{ error }}
</template>

<script>
import contentService from "@/services/ContentService";
import {eventBus} from "@/main";

export default {
  data() {
    return {
      loading: false,
      selectedFile: null,
      error: null
    }
  },
  methods: {
    async save() {
      const $that = this;
      $that.error = null;
      $that.loading = true

      let fd = new FormData();
      fd.append('file', $that.selectedFile)
      try {
        const uploaded = (await contentService.upload.save(fd)).data;

        
        console.log(uploaded);
        $that.$emit('image-upload', uploaded.file)
        eventBus.$emit('uploaded', true)
        $that.$refs.galleryUpload.value = '';

      } catch(err) {
        console.log(err)
        console.log('errrr catchedd', err.error)
         $that.error = 'Only images allowed';
      }


      this.loading = false
  },
   onFileSelected(event) {
      this.selectedFile = event.target.files[0];
      this.save()
    },
  }
}
</script>
