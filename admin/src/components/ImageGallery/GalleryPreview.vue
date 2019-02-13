<template lang="pug">
  div
    div(v-if="images.length")
      .uploaded-image-gallery-wrap(
        v-for="image in images"
      )
        a(
          target="_blank"
          :href="require('uploads/'+image)"
        )
          img(
            v-if="image"
            class="uploaded-image-gallery"
            :src="require('uploads/'+image)"
          )
        a.remove(@click="remove(image)")
          i.glyphicon.glyphicon-trash
</template>


<script>
import contentService from "@/services/ContentService";

export default {
  props: ['keyword', 'images'],
  data() {
    return {}
  },
  methods: {
    remove(name) {
      if (confirm('Are you sure you want to delete this item?')) {
        this.$emit('gallery-remove', name)
      }
    }
  }
}
</script>


<style lang="stylus" scoped>
.uploaded-image-gallery {
  max-width: 200px;
  margin-right: 10px;
  margin-bottom: 10px;
  margin-top: 10px;
}

.uploaded-image-gallery-wrap {
  position:relative;
  display: inline-block;

  .remove {
    position:absolute;
    right:20px;
    top:20px;
    width:20px;
    height: 20px;
    z-index: 23;
    cursor: pointer;
  }
}
</style>
