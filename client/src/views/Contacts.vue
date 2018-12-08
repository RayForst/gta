<template lang="pug">
  section
    app-contacts-form
    app-map
</template>

<script>
import appContactsForm from "@/components/ContactsForm";
import appMap from "@/components/Map";

export default {
  components: {
    appContactsForm,
    appMap
  },
  mounted() {
    document.body.className = "bg-purple";
  }
};
</script>
