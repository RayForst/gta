<template lang="pug">
  section
    .container-fluid
      .row
        .col-xs-12
          h2 We’re a collection of more than 900 full-service sign stores located across the globe – a fact that truly makes us “where the world goes for signs.”
          router-link(:to="{ name: 'works-project', params: { name: 'test' } }") Test
</template>

<script>
export default {
}
</script>
