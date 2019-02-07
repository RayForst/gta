<template lang="pug">
  .form-group(
    :class="{ 'has-error': form.description.error }"
  )
    label(for="testid-2") 
      | Description
      i.req-star *
    input#t2.form-control(v-model="form.position.value" placeholder="Position")
    span.help-block(
      v-if="form.position.error"
    ) {{ form.position.error }}
</template>

<script>
export default {
  
}
</script>
