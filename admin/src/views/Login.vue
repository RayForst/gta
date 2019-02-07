<template lang="pug">
  div.login-box
    .login-logo
      img(src="../assets/img/logo.svg", alt="")
    .login-box-body
      p.login-box-msg
        b Sign in to start your session
      form(@submit.prevent="sign")
        .form-group.has-feedback
          input.form-control(v-model="login" type="text" placeholder="Login")
          span.glyphicon.glyphicon-user.form-control-feedback
        .form-group.has-feedback
          input.form-control(v-model="password" type="password" placeholder="Password")
          span.glyphicon.glyphicon-lock.form-control-feedback
        .form-group.has-error(
          v-if="error"
        )
          span.help-block
            b {{ error }}
        .row
          .col-xs-12.text-center
            button.btn.btn-primary(type="submit") Sign Inn
</template>

<script>
import AuthenticationService from "@/services/AuthenticationService";

export default {
  data() {
    return {
      login: "",
      password: "",
      error: null 
    };
  },
  methods: {
    async sign() {
      try {
        const response = (await AuthenticationService.login({
          login: this.login,
          password: this.password
        })).data;

        this.$store.dispatch("setToken", response.token);
        this.$store.dispatch("setUser", response.user);

        this.$router.push("dashboard");
      } catch (err) {
        console.log(err.response.data.message);
        this.error = err.response.data.message;
      }
    }
  }
};
</script>
