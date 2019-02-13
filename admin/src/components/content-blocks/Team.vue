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
                th Fullname
                th Position
                th Photo
                th Actions
            tbody
              tr(v-for="item in list" :key="item.id")
                td {{ item.id }}
                td {{ item.fullname }}
                td {{ item.position }}
                td
                  img(
                    v-if="item.image"
                    class="uploaded-image"
                    :src="'/uploads/'+item.image"
                  )
                td
                  span.edit(@click="edit(item.id)") Edit
                  span.delete(@click="remove(item.id)") Delete
    .box.box-default
      .box-header.with-border
        h3.box-title Add
      form.box-body(@submit.prevent="save")
        .form-group(
          :class="{ 'has-error': form.fullname.error }"
        )
          label(for="t1") Fullname 
          input#t1.form-control(v-model="form.fullname.value" type="text" placeholder="Title")
          span.help-block(
            v-if="form.fullname.error"
          ) {{ form.fullname.error }}
        .form-group(
          :class="{ 'has-error': form.position.error }"
        )
          label(for="t2") Position
          input#t2.form-control(v-model="form.position.value" placeholder="Position")
          span.help-block(
            v-if="form.position.error"
          ) {{ form.position.error }}
        .form-group(
          :class="{ 'has-error': form.image.error }"
        )
          div
            img(
              v-if="editImage"
              class="uploaded-image"
              :src="'/uploads/'+editImage"
            )
          label(for="t3") Photo
          input#t3.form-control(placeholder="File" type="file" @change="onFileSelected" ref="fileInput")
          span.help-block(
            v-if="form.image.error"
          ) {{ form.image.error }}
        .btn-grp
          button.btn.btn-success Save
          button(@click="cancel" type="button").btn.btn-danger Cancel
          transition(name="fade")
            span.success-status(v-if="success")
              b Successfully Saved!
</template>

<script>
import contentService from "@/services/ContentService";

export default {
  props: ["page"],
  data() {
    return {
      form: {
        position: {
          value: null,
          error: null,
        },
        fullname: {
          value: null,
          error: null,
        },
        file: {
          value: null,
          error: null,
        },
        image: {
          value: null,
          error: null,
        },
      },
      id: null,
      editImage:null,
      list: null,
      serverError: null,
      success: false
    };
  },
  methods: {
    async save() {
      const $this = this;
      $this.clearErrors()
      let img = null;
      let imageEdit = this.form.file.value ? false : imageEdit;

      // new image or edit ima
      if (!imageEdit) {
        let fd = new FormData();
        fd.append('file', this.form.file.value)
        let image = (await contentService.upload.save(fd)).data;
        img = image.file.filename;
      } else {
        img = this.editImage;
      }

      try {
        const response = await contentService.team.save({
          position: this.form.position.value,
          fullname: this.form.fullname.value,
          image: img,
          id: this.id
        });

        $this.success = true;
        $this.form.position.value = null;
        $this.form.fullname.value = null;
        $this.form.file.value = null;
        $this.editImage = null;
        $this.$refs.fileInput.value = '';
        $this.id = null;

        setTimeout(() => {
              this.get();
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
    },
    async get() {
      const list = (await contentService.team.get()).data;

      сщтыщ
      this.list = list;
    },
    edit(id) {
      const selected = this.list.filter(obj => obj.id === id)[0];

      this.form.position.value = selected.position;
      this.form.fullname.value = selected.fullname;
      this.editImage = selected.image;
      this.id = id;
    },
    async remove(id) {
      if (confirm('Are you sure you want to delete this item?')) {
        await contentService.team.remove({id})
        this.get(); 
      }
    },
    onFileSelected(event) {
      this.form.file.value = event.target.files[0];
    },
    clearErrors() {
      this.serverError = '';
      for(var index in this.form) { 
        this.form[index].error = null
      }
    },
    cancel() {
      this.clearErrors();
      this.get();
    }
  },
  mounted() {
    this.get();
  }
};
</script>
