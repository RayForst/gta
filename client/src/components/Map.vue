<template lang="pug">
  .container-fluid
    .row
      .col-xs-12
        GmapMap(
          :center="{lat:10, lng:10}"
          :zoom="7"
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
