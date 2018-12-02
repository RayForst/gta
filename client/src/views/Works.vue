<template lang="pug">
  section
    app-works
</template>

<script>
import appWorks from "@/components/ProjectsList";

export default {
  components: {
    appWorks
  },
  mounted() {
    document.body.className = "bg-purple-red";
  }
};
</script>
