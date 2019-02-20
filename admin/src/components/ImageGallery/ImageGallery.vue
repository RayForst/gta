<template lang="pug">
  div
    div
    h4 {{ name }}
    appGalleryPreview(@gallery-remove="removeFromList" :keyword="keyword" :images="images")
    appGaleryUpload(@image-upload="upload")
</template>

<script>
import appGalleryPreview from './GalleryPreview'
import appGaleryUpload from './GaleryUpload'
import contentService from "@/services/ContentService";

export default {
  props: ['keyword', 'name'],
  data() {
    return {
      images: []
    }
  },
  components: {
    appGalleryPreview,
    appGaleryUpload
  },
  methods: {
    upload(image) {
      this.addToList(image.filename)
    },
    addToList(imageMame) {
      this.images.push(imageMame)
      this.save()
    },
    removeFromList(imageMame) {
      var index = this.images.indexOf(',');

      console.log('remove images', this.images);
      index = this.images.indexOf(imageMame);
      if (index > -1) {
        this.images.splice(index, 1);
      }

      console.log('result', this.images)
      this.save();
    },
    async save() {
      let images
      let $that = this;

      if (this.images.length > 1) {
        images = this.images.join(',')
      } else if(this.images.length === 1) {
        images = this.images[0];
      } else {
        images = '';
      }

      console.log('savving with keyword ', this.keyword)
      const savedArr = (await contentService.gallery.save({
        images,
        keyword: this.keyword
      })).data; 


      setTimeout(function(){
        $that.get();
      }, 500);
    },
    async get() {
      const $that = this;

      const data = (await contentService.gallery.get({
        keyword: $that.keyword
      })).data;


      console.log('getting imaages leng', data.images)

      if (data.hasOwnProperty('images')) {
        if (data.images.length) {
          $that.images = data.images.split(',')
        } else {
          $that.images = []
        }
      }
    },
  },

  watch: {
    keyword (newId, oldId) {
      console.log('watchh fire in immage galllery component, keyword now ', this.keyword)
      if (
        (newId === 'work-') ||
        (newId === 'what-we-do-') 
      )
       {
         this.save()
      }
      this.get()
    },
  },
  mounted() {
    this.get()
  },
}
</script>
