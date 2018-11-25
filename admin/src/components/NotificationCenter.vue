<template lang="pug">
  .alerts
    div.alert.alert-success.alert-dismissible(v-for="item in list" :key="title" v-if="item.open")
      button.close(@click="close" type="button" data-dismiss="alert" aria-hidden="true") ×
      h4 
        i.icon.fa.fa-check
        | Notification
      | Success alert preview. This alert is dismissable.
</template>

<script>
export default {
  data() {
    return {
      list: [
        {
          icon: 'check',
          title: 'Saved!',
          description: 'Meta for Index page succesfully updated',
          open: false
        },
        {
          icon: 'check',
          title: 'Saved!',
          description: 'Meta for Index page succesfully updated',
          open: false
        },
        {
          icon: 'check',
          title: 'Saved!',
          description: 'Meta for Index page succesfully updated',
          open: false
        },
      ]
    }
  },
  methods: {
    add() {

    },
    close() {
      this.open = false
    }
  }
}
</script>

<style lang="stylus" scoped>
.alerts {
  z-index: 9999;
  position: fixed;
  top: 0px;
  width: 30vw;
  right: 0;
  margin: 10px;
}
</style>
