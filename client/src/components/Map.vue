<template lang="pug">
  GmapMap(
    :center="coords"
    :zoom="15"
    map-type-id="terrain"
    style="width: 100%; height: 500px")
    GmapMarker(
      :key="index"
      v-for="(m, index) in markers"
      :position="m.position"
      :clickable="true"
      :draggable="true"
      @click="center=m.position")
</template>

<script>
export default {
  data() {
    return {
      coords: {
        lat: 43.7132835,
        lng: -79.3691667
      },
      markers: []
    };
  }
};
</script>
