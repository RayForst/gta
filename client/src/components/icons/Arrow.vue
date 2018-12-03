<template>
  <svg
    :class="iconClass"
    width="10px"
    height="10px"
    viewBox="0 0 10 10"
    version="1.1"
    xmlns="http://www.w3.org/2000/svg"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    fill-rule="evenodd"
    fill="#EB008B"
  >
    <!-- Generator: Sketch 52.5 (67469) - http://www.bohemiancoding.com/sketch -->
    <title>arrow</title>
    <desc>Created with Sketch.</desc>
    <g id="Page-1" stroke="none" stroke-width="1">
      <g id="01-gta-frontpage" transform="translate(-396.000000, -3708.000000)">
        <g id="Group-4" transform="translate(293.000000, 3702.000000)">
          <polygon
            id="arrow"
            points="108 6 107.116667 6.88333333 110.608333 10.375 103 10.375 103 11.625 110.608333 11.625 107.116667 15.1166667 108 16 113 11"
          ></polygon>
        </g>
      </g>
    </g>
  </svg>
</template>

<script>
export default {
  props: {
    iconClass: {
      type: String,
      default: ""
    }
  }
};
</script>
