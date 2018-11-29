<template lang="pug">
  .container-fluid 
    .row
      .col-xs-12
        | Contacts page
    form.swp-form.p_b_6_sm#contactForm
      .row.p_b_5.p_b_4_sm.flex_align-items_flex-end
        .col-xs-12.col-md-6.p_b_5.p_b_4_sm.p_b_0_md
          span.custom-dropdown
            select(name='subject')
              option(value="1") Payment question
              option(value="2") Life meaning question
              option(value="3") Drug question
        .col-xs-12.col-md-6
          .swp-input
            input(type="text" id="formName" name='name' required)
            label(for='#formName') Full Name
      .row.p_b_5.p_b_4_sm.flex_align-items_flex-end
        .col-xs-12.col-md-6.p_b_5.p_b_4_sm.p_b_0_md
          .swp-tel-input
            label.swp-label(for='#formPhone') Phone
            input(type="text" id="formPhone" name='phone')
        .col-xs-12.col-md-6
          .swp-input
            input(type="email" id="formEmail" name='email' required)
            label(for='#formEmail') E-mail
      .row.p_b_1.p_b_2_sm
        .col-xs-12
          .swp-textarea
            label.swp-label(for='#formMesssge') Message
            textarea(id="formMesssge" name="message", cols="30", rows="6" placeholder="Hi guys, we want to cooporate…")
      .row.p_t_2
        .col-xs-12.center-xs.start-md
          button.ui-btn.swp-form__button.button.button-primary.button-big Send
        .col-xs-12.p_t_2.primary.swp-form__response.hide
          | Thank You for contacting Us! If you have any more questions, click here to write a new message.
    app-map
</template>

<script>
import appMap from "@/components/Map";

export default {
  components: {
    appMap
  }
};
</script>
