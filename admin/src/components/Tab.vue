<template lang="pug">
    <div class="tab-pane" v-show="isActive" :class="{ 'active': isActive }">
      <slot></slot>
    </div>
</template>

<script>
export default {
  data() {
    return {
      isActive: false
    };
  },
  props: {
    name: { required: true },
    selected: { default: false }
  },
  computed: {
    href() {
      return "#" + this.name.toLowerCase().replace(/ /g, "-");
    }
  },
  mounted() {
    this.isActive = this.selected;
  }
};
</script>
