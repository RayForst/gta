<template lang="pug">
  div
    .box.box-default
      .box-header.with-border
        h3.box-title List
      .row
        .col-xs-12
          table.table.table-bordered.table-hover.dataTable
            thead
              tr(role="row")
                th Id
                th Text
                th Icon
                th Actions
            tbody
              tr(v-for="item in items" :key="item.id")
                td {{ item.id }}
                td {{ item.text }}
                td
                  img(v-if="item.icon" :src="require('../../assets/img/why-us/'+item.icon+'.svg')" alt="")
                td
                  span.edit(@click="edit(item.id)") Edit
                  span.delete(@click="remove(item.id)") Delete
    .box.box-default
      .box-header.with-border
        h3.box-title Add
      form.box-body(@submit.prevent="save")
        .form-group(
          :class="{ 'has-error': form.text.error }"
        )
          label(for="r1") 
            | Text
            i.req-star *
          input#r1.form-control(v-model="form.text.value" type="text" placeholder="Title")
          span.help-block(
            v-if="form.text.error"
          ) {{ form.text.error }}
        .form-group(
          :class="{ 'has-error': form.icon.error }"
        )
          .row
            .col-xs-6
              label(for="r4") 
              | Icon
              i.req-star *
              select#r4.form-control(
                v-model="form.icon.value" 
              )
                option(v-for="icon in icons" :key="icon" value=icon) {{ icon }}
            .col-xs-6
              img(
                height="100" 
                v-if="form.icon.value"
                :src="require('../../assets/img/why-us/'+form.icon.value+'.svg')"
                alt=""
              )
          span.help-block(
            v-if="form.icon.error"
          ) {{ form.icon.error }}
        .btn-grp
          button.btn.btn-success Save
          button(@click="cancel" type="button").btn.btn-danger Cancel
          transition(name="fade")
            span.success-status(v-if="success")
              b Successfully Saved!
</template>

<script>
import contentService from '@/services/ContentService'

export default {
  data() {
    return {
      items: [],
      form: {
        text: {
          value: null,  
          error: null,
        },
        icon: {
          value: null,  
          error: null,
        }
      },
      serverError: null,
      success: false,
      icons: ["care", "do-our-best", "experience", "vision"],
      editId: null
    }
  },
  methods: {
    async save() {
      const $this = this;
      $this.clearErrors()

      try {
        const response = await contentService.whyUs.save({
          icon: this.form.icon.value,
          text: this.form.text.value,
          id: this.editId
        })
        $this.success = true;

        $this.form.text.value = null
        $this.form.icon.value = null

        setTimeout(() => {
          $this.success = false;
        }, 4000)  
      } catch(err) {
        if (err.response.status === 422) {
          err.response.data.errors.forEach(function(element) {
            $this.form[element.param].error = element.msg
          })
        } else {
          console.log('ERRR :',err.response.status)
        }
      }

      this.get();
    },
    async get() {
      const list = (await contentService.whyUs.get()).data

      this.items = list;
    },
    async remove(id) {
      if (confirm('Are you sure you want to delete this item?')) {
        await contentService.whyUs.remove({id})
        this.get(); 
      }
    },
    edit(id) {
      const selected = this.items.filter(obj => obj.id === id)[0];

      this.form.text.value = selected.text;
      this.form.icon.value = selected.icon;
      this.editId = id;
    },
    cancel() {
      this.form.text.value = null;
      this.form.icon.value = null;
      this.editId = null;

      this.get();
    },
    clearErrors() {
      this.serverError = '';
      for(var index in this.form) { 
        this.form[index].error = null
      }
    },
  },
  mounted() {
    this.get()
  }
}
</script>
