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
      password: ""
    };
  },
  methods: {
    async sign() {
      try {
        const response = (await AuthenticationService.login({
          login: this.login,
          password: this.password
        })).data;

        console.log(response);

        this.$store.dispatch("setToken", response.token);
        this.$store.dispatch("setUser", response.user);

        this.$router.push("dashboard");
      } catch (err) {
        console.warn(err);
      }
    }
  }
};
</script>
