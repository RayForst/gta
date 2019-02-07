<template lang="pug">
  GmapMap(
    :center="{lat: lat,lng: long}"
    :zoom="10"
    map-type-id="terrain"
    style="width: 100%; height: 500px")
    GmapMarker(
      :position="{lat: lat,lng: long}"
      :clickable="true"
      :draggable="true"
      :icon="{ url: require('../assets/img/gta-marker.svg')}"
      @click="center=m.position")
</template>

<script>
export default {
  data() {
    return {};
  },
  computed: {
    lat() {
      return this.$store.state.settings.lat ? this.$store.state.settings.lat : 0
    },
    long() {
      return this.$store.state.settings.long ? this.$store.state.settings.long : 0
    }
  },
  components: {
    // - GmapMarker
  }
};
</script>
