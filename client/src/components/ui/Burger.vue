<template lang="pug">
  <div id="menu" ref="menu">
    .trigger(@click.self="openmenu($event)")
      .text(@click.self="openmenu($event)") {{ triggerText }}
    .content
      | hey
  </div>
</template>

<script>
export default {
  data() {
    return {
      triggerText: "menu"
    };
  },
  methods: {
    openmenu(ev) {
      let menu = this.$refs.menu;

      if (menu.classList.contains("open")) {
        menu.classList.remove("open");
        this.triggerText = "menu";
      } else {
        menu.classList.add("open");
        this.triggerText = "close";
      }
    }
  }
};
</script>
