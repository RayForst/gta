<template lang="pug">
  .box.box-default
    .box-header.with-border
      h3.box-title Add
    form.box-body(@submit.prevent="save")
      .form-group(
        :class="{ 'has-error': form.title.error }"
      )
        label(for="r1") 
        | Title
        i.req-star *
        input#r1.form-control(
          v-model="form.title.value" 
          type="text"
          placeholder="Title"
        )
        span.help-block(
          v-if="form.title.error"
        ) {{ form.title.error }}
      .form-group(
        :class="{ 'has-error': form.articleTitle.error }"
      )
        label(for="r6") 
        | Article Title
        i.req-star *
        input#r6.form-control(
          v-model="form.articleTitle.value"
          type="text"
          placeholder="Title"
        )
        span.help-block(
          v-if="form.articleTitle.error"
        ) {{ form.articleTitle.error }}
      .form-group(
        :class="{ 'has-error': form.slug.error }"
      )
        label(for="r3") 
        | Slug
        i.req-star *
        input#r3.form-control(
          v-model="form.slug.value" 
          type="text" 
          placeholder="Slug"
        )
        span.help-block(
          v-if="form.slug.error"
        ) {{ form.slug.error }}
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
              :src="require('../../assets/img/what-we-do/'+form.icon.value+'.svg')"
              alt=""
            )
        span.help-block(
          v-if="form.icon.error"
        ) {{ form.icon.error }}
      .form-group(
        :class="{ 'has-error': form.shortDescription.error }"
      )
        label(for="r2") 
        | Short description
        i.req-star *
        textarea#r2.form-control(
          v-model="form.shortDescription.value" 
          placeholder="Short description"
        )
        span.help-block(
          v-if="form.shortDescription.error"
        ) {{ form.shortDescription.error }}
      .form-group(
        :class="{ 'has-error': form.description.error }"
      )
        label(for="testid-2") First column description
        wysiwyg#testid-2(
          v-model="form.description.value"
        )
        span.help-block(
          v-if="form.description.error"
        ) {{ form.description.error }}
      .form-group(
        :class="{ 'has-error': form.description2.error }"
      )
        label(for="testid-3") Second column description
        wysiwyg#testid-3(
          v-model="form.description2.value"
        )
        span.help-block(
          v-if="form.description2.error"
        ) {{ form.description2.error }}
      appImageGallery(v-if="!updateGallery" :keyword="keyword" name="Gallery")
      .form-group.has-error(
        v-if="serverError"
      )
        span.help-block
          b {{ serverError }}
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

export default {
  data() {
    return {
      form: {
        title: {
          value: null,
          error: null,
        },
        articleTitle: {
          value: null,
          error: null,
        },
        slug: {
          value: null,
          error: null,
        },
        icon: {
          value: null,
          error: null,
        },
        shortDescription: {
          value: null,
          error: null,
        },
        description: {
          value: null,
          error: null,
        },
        description2: {
          value: null,
          error: null,
        },
      },
      icons: ["3d-letters", "decals", "glass", "large", "promo", "sandvich"],
      items: [],
      success: false,
      serverError: null,
      updateGallery: false
    };
  },
  computed: {
    editId() {
      return this.$store.state.whatWeDoId  ? this.$store.state.whatWeDoId : '';
    },
    keyword() {
      return 'what-we-do-'+this.editId
    }
  },
  components: {
    appImageGallery
  },
  methods: {
    async save() {
      const $this = this;
      $this.clearErrors()

      try {
        const response = await contentService.whatWeDo.save({
          title: this.form.title.value,
          shortDescription: this.form.shortDescription.value,
          slug: this.form.slug.value,
          description: this.form.description.value,
          description2: this.form.description2.value,
          icon: this.form.icon.value,
          articleTitle: this.form.articleTitle.value,
          id: this.editId
        });

          if (!this.editId) {
          $this.$store.dispatch("whatWeDoEdit", response.data.id);
        }

        setTimeout(function(){
          $this.cancel()
        }, 500)

        $this.get();


        $this.success = true;

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
      this.items = (await contentService.whatWeDo.get()).data;
    },
    async clearGallery() {
      try {
        this.updateGallery = true;

        await contentService.gallery.save({
          images: '',
          keyword: 'what-we-do-'
        })

        this.updateGallery = false;
      } catch(err) {
        console.log(err)
      }
    },
    edit(id) {
      const selected = this.items.filter(obj => obj.id === id)[0];

      this.form.title.value = selected.title;
      this.form.articleTitle.value = selected.articleTitle;
      this.form.shortDescription.value = selected.shortDescription;
      this.form.slug.value = selected.slug;
      this.form.icon.value = selected.icon;
      this.form.description.value = selected.description;
      this.form.description2.value = selected.description2;
      this.$store.dispatch("whatWeDoEdit", selected.id);
    },
    cancel() {
      this.get();

      this.form.title.value = null;
      this.form.articleTitle.value = null;
      this.form.shortDescription.value = null;
      this.form.slug.value = null;
      this.form.icon.value = null;
      this.form.description.value = null;
      this.form.description2.value = null;
      this.$store.dispatch("whatWeDoEdit", null);
      this.clearGallery();
    },
    clearErrors() {
      this.serverError = '';
      for(var index in this.form) { 
        this.form[index].error = null
      }
    }
  },
  watch: {
    editId (newId, oldId) {
      if (newId) this.edit(newId)
    }
  },
  mounted() {
    this.get();
    this.$store.dispatch("whatWeDoEdit", null);
  }
};
</script>
