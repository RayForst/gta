<template lang="pug">
  section
    app-meta
    app-works
</template>

<script>
import appWorks from "@/components/ProjectsList";
import appMeta from "@/components/Meta";

export default {
  components: {
    appWorks,
    appMeta
  },
  mounted() {
    document.body.className = "bg-purple-red";
  }
};
</script>
