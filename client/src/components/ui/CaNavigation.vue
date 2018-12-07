<template lang="pug">
  div
    h4 {{ heading }}
    p {{ text }}
</template>

<script>
export default {
  data() {
    return {
      heading: "Printing services",
      text:
        "We want you to feel assured that your shirts are being printed by the best of the best."
    };
  }
};
</script>

<style lang="stylus" scoped>
h4 {
  opacity: 0.5;
  font-size: 18px;
  font-weight: bold;
  color: #ffffff;
}

p {
  font-size: 14px;
  line-height: 1.57;
  color: #ffffff;
  max-width: 380px;
  margin-top: 6px;
  margin-bottom: 30px;
}
</style>

