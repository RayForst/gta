<template></template>

<script>
export default {
  data() {
    return {
      meta: {
        title: null,
        keywords: null,
        description: null
      }
    };
  },
  metaInfo() {
    return {
      title: this.meta.title,
      meta: [
        { name: "description", content: this.meta.description },
        { name: "keywords", content: this.meta.keywords }
      ]
    };
  },
  methods: {
    setMeta() {
      const meta = this.$store.getters.meta;

      if (meta) {
        this.meta.title = meta.title;
        this.meta.keywords = meta.keywords;
        this.meta.description = meta.description;
      }
    }
  },
  beforeMount() {
    this.setMeta();
  }
};
</script>
