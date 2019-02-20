<template lang="pug">
  div
    div(v-if="images.length")
      .uploaded-image-gallery-wrap(
        v-for="image in images"
      )
        a(
          target="_blank"
          :href="'/uploads/'+image"
        )
          img(
            v-if="image"
            class="uploaded-image-gallery"
            :src="'/uploads/'+image"
          )
        a.remove(@click="remove(image)")
          i.glyphicon.glyphicon-remove
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
    position: absolute;
    right: 18px;
    top: 18px;
    width: 18px;
    height: 18px;
    z-index: 23;
    cursor: pointer;
    color: red;
    font-size: 18px;
  }
}
</style>
