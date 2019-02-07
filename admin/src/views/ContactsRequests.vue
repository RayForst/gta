<template lang="pug">
  div
    div.content-header
      h1 Contacts Requests: {{ items.length }}
    section.content
      .box.contact-box.collapsed-box(
        v-for="item in items"
        :class="{ 'box-success': !item.readed, 'box-default': item.readed }"
        ref="box"
      )
        .box-header.with-border
          h3.box-title {{ item.fullname }} {{ item.createdAt | formatDate }}
          .box-tools.pull-right
            button.btn.btn-block.btn-success.btn-xs(
              type="button"
              data-widget="collapse"
              @click="read(item.id, $event)"
            ) 
              span View
        .box-body
          .contact-prop Subject: {{ item.type }}
          .contact-prop Fullname: {{ item.fullname }}
          .contact-prop Phone: {{ item.phone }}
          .contact-prop Email: {{ item.email }}
          .contact-prop Message: {{ item.message }}
</template>

<script>
import contentService from '@/services/ContentService'

export default {
  data() {
    return {
      items: []
    }
  },
  methods: {
    async get() {
      const list = (await contentService.contacts.get()).data
      let unreadedCount = 0;

      list.forEach(function (item, index) {
        if (item.readed != 1) unreadedCount++;
      });

      this.$store.dispatch("unreadedRequests", unreadedCount);

      this.items = list;
    },
    read(id, $event) {
      let wrapper = $event.target.closest('.box')

      if (wrapper.classList.contains('box-success')) {
        contentService.contacts.read({
          id
        })

        this.$store.dispatch("unreadedRequests", this.$store.state.unreadedMessages - 1);
        wrapper.classList.remove('box-success')
        wrapper.classList.add('box-default')
      }

      if (wrapper.classList.contains('collapsed-box')) {
        wrapper.classList.remove('collapsed-box')
      } else {
         wrapper.classList.add('collapsed-box')
      }
    }
  },
  mounted() {
    this.get();
  }
}
</script>

<style lang="stylus" scoped>
.contact-box {
  margin-bottom: 10px;
}
.box-header > .box-tools {
      top: 9px;
}
</style>
