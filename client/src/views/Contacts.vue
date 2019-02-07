<template lang="pug">
  section
    app-meta
    app-contacts-form
    app-map
    .spacer
</template>

<script>
import appContactsForm from "@/components/ContactsForm";
import appMap from "@/components/Map";
import appMeta from "@/components/Meta";

export default {
  components: {
    appContactsForm,
    appMap,
    appMeta
  },
  mounted() {
    document.body.className = "bg-purple";
  }
};
</script>
