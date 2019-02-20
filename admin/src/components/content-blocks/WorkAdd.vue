<template lang="pug">
  .box.box-default
    .box-header.with-border
      h3.box-title Add
      .box-tools.pull-right
        button.btn.btn-box-toolbtn.btn-box-tool
          i.fa.fa-minus
    form.box-body(@submit.prevent="save")
      .form-group(
        :class="{ 'has-error': form.title.error }"
      )
        label(for="r1") 
          | Title
          i.req-star *
        input#r1.form-control(v-model="form.title.value" type="text" placeholder="Title")
        span.help-block(
          v-if="form.title.error"
        ) {{ form.title.error }}
      .form-group(
        :class="{ 'has-error': form.slug.error }"
      )
        label(for="r1") 
          | Slug
          i.req-star *
        input#r1.form-control(v-model="form.slug.value" type="text" placeholder="Slug")
        span.help-block(
          v-if="form.slug.error"
        ) {{ form.slug.error }}
      .form-group(
        :class="{ 'has-error': form.category.error }"
      )
        label(for="r3") 
          | Category
          i.req-star *
        input#r3.form-control(v-model="form.category.value" type="text" placeholder="Category")
        span.help-block(
          v-if="form.category.error"
        ) {{ form.category.error }}
      .form-group(
        :class="{ 'has-error': form.person_name.error }"
      )
        label(for="r3") 
          | Person name
          i.req-star *
        input#r3.form-control(v-model="form.person_name.value" type="text" placeholder="Person name")
        span.help-block(
          v-if="form.person_name.error"
        ) {{ form.person_name.error }}
      .form-group(
        :class="{ 'has-error': form.person_position.error }"
      )
        label(for="r3") 
          | Person company
          i.req-star *
        input#r3.form-control(v-model="form.person_position.value" type="text" placeholder="Category")
        span.help-block(
          v-if="form.person_position.error"
        ) {{ form.person_position.error }}
      .form-group(
        :class="{ 'has-error': form.comment.error }"
      )
        label(for="r1") 
          | Person comment
          i.req-star *
        textarea#r1.form-control(v-model="form.comment.value" type="text" placeholder="Person comment")
        span.help-block(
          v-if="form.comment.error"
        ) {{ form.comment.error }}
      .form-group(
        :class="{ 'has-error': form.image.error }"
      )
        div
          img(
            v-if="editImage"
            class="uploaded-image"
            :src="'/uploads/'+editImage"
          )
        label(for="t3") Person photo
        input#t3.form-control(placeholder="File" type="file" @change="onFileSelected" ref="fileInput")
        span.help-block(
          v-if="form.image.error"
        ) {{ form.image.error }}
      .form-group(
        :class="{ 'has-error': form.image2.error }"
      )
        div
          img(
            v-if="editImage2"
            class="uploaded-image"
            :src="'/uploads/'+editImage2"
          )
        label(for="t4") Person company logo
        input#t4.form-control(placeholder="File" type="file" @change="onFileSelected2" ref="fileInput2")
        span.help-block(
          v-if="form.image2.error"
        ) {{ form.image2.error }}
      .form-group(
        :class="{ 'has-error': form.description.error }"
      )
        label(for="testid-2") First column description
        ckeditor#testid-3(
          :editor="editor"
          v-model="form.description.value"
          :config="editorConfig"
        )
      .form-group(
        :class="{ 'has-error': form.description2.error }"
      )
        label(for="testid-2") Second column description
        ckeditor#testid-3(
          :editor="editor"
          v-model="form.description2.value"
          :config="editorConfig"
        )
      template(v-if="editId")
        appImageGallery(v-if="!updateGallery" :keyword="keyword" name="Gallery")
      .btn-grp
        button.btn.btn-success Save
        button(@click="cancel" type="button").btn.btn-danger Cancel
        transition(name="fade")
          span.success-status(v-if="success")
            b Successfully Saved!
</template>

<script>
import contentService from "@/services/ContentService";
import appImageGallery from "@/components/ImageGallery/ImageGallery";
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';

export default {
  data() {
    return {
      editor: ClassicEditor,
      editorConfig: {
        toolbar: [ 'bold', 'italic', 'link', 'blockquote', 'numberedList', 'bulletedList']
      },
      form: {
        title: {
          value: null,
          error: null,
        },
        category: {
          value: null,
          error: null,
        },
        slug: {
          value: null,
          error: null,
        },
        person_name: {
          value: null,
          error: null,
        },
        person_position: {
          value: null,
          error: null,
        },
        comment: {
          value: null,
          error: null,
        },
        description: {
          value: '',  
          error: null,
        },
        description2: {
          value: '',
          error: null,
        },
        file: {
          value: null,
          error: null,
        },
        file2: {
          value: null,
          error: null,
        },
        image: {
          value: null,
          error: null,
        },
        image2: {
          value: null,
          error: null,
        },
      },
      editImage: null,
      editImage2: null,
      items: [],
      success: false,
      serverError: null,
      updateGallery: false
    };
  },
  computed: {
    editId() {
      return this.$store.state.ourWorksId ? this.$store.state.ourWorksId : '';
    },
    keyword() {
      return 'work-'+this.editId
    }
  },
  components: {
    appImageGallery
  },
  methods: {
    async get() {
      this.items = (await contentService.work.get()).data;
    },
    async save() {
      const $this = this;
      $this.clearErrors()
      let img = null;
      let img2 = null;
      let imageEdit = this.form.file.value ? false : imageEdit;
      let imageEdit2 = this.form.file2.value ? false : imageEdit2;

      // new image or edit image
      if (!imageEdit && this.form.file.value)  {
        let fd = new FormData();
        fd.append('file', this.form.file.value)
        let image = (await contentService.upload.save(fd)).data;
        img = image.file.filename;
      } else {
        img = this.editImage;
      }

      // new image or edit image
      if (!imageEdit2 && this.form.file2.value) {
        let fd = new FormData();
        fd.append('file', this.form.file2.value)
        let image = (await contentService.upload.save(fd)).data;
        img2 = image.file.filename;
      } else {
        img2 = this.editImage2;
      }

      try {
        const response = await contentService.work.save({
          title: this.form.title.value,
          category: this.form.category.value,
          slug: this.form.slug.value,
          person_position: this.form.person_position.value,
          person_name: this.form.person_name.value,
          comment: this.form.comment.value,
          description: this.form.description.value,
          description2: this.form.description2.value,
          image: img,
          image2: img2,
          id: this.editId
        });

        if (!this.editId) {
          $this.$store.dispatch("ourWorksEdit", response.data.id);
        }

        setTimeout(function(){
          $this.cancel()
        }, 500)

        $this.success = true;

                
        $this.get();

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
    },
    edit(id) {
      const selected = this.items.filter(obj => obj.id === id)[0];

      this.form.title.value = selected.title;
      this.form.category.value = selected.category;
      this.form.slug.value = selected.slug;
      this.form.person_name.value = selected.person_name;
      this.form.person_position.value = selected.person_position;
      this.form.comment.value = selected.comment;
      this.form.description.value = selected.description;
      this.form.description2.value = selected.description2;
      this.editImage = selected.image;
      this.editImage2 = selected.image2;
      this.$store.dispatch("ourWorksEdit", selected.id);
    },
    async clearGallery() {
      try {
        this.updateGallery = true;

        await contentService.gallery.save({
          images: '',
          keyword: 'work-'
        })

        this.updateGallery = false;
      } catch(err) {
        console.log(err)
      }
    },
    cancel() {
      this.get();

      this.form.title.value = null;
      this.form.category.value = null;
      this.form.slug.value = null;
      this.form.person_name.value = null;
      this.form.person_position.value = null;
      this.form.comment.value = null;
      this.form.description.value = '';
      this.form.description2.value = '';
      this.editImage = null;
      this.editImage2 = null;
      this.$store.dispatch("ourWorksEdit", null);
      this.$refs.fileInput.value = '';
      this.$refs.fileInput2.value = '';
      this.clearGallery();
    },
    clearErrors() {
      this.serverError = '';
      for(var index in this.form) { 
        this.form[index].error = null
      }
    },
    onFileSelected(event) {
      this.form.file.value = event.target.files[0];
    },
    onFileSelected2(event) {
      this.form.file2.value = event.target.files[0];
    },
  },
  watch: {
    editId (newId, oldId) {
      if (newId) this.edit(newId)
    }
  },
  mounted() {
    this.get();
    this.$store.dispatch("ourWorksEdit", null);
    let $this = this;
  }
};
</script>