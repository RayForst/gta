<template lang="pug">
  div.login-box
   
    .login-logo
      img(src="../assets/img/logo.svg", alt="")
    .login-box-body
      p.login-box-msg
        b Sign in to start your session
      form
        .form-group.has-feedback
          input.form-control(type="text" placeholder="Login")
          span.glyphicon.glyphicon-user.form-control-feedback
        .form-group.has-feedback
          input.form-control(type="password" placeholder="Password")
          span.glyphicon.glyphicon-lock.form-control-feedback
      .row
        .col-xs-12.text-center
          button.btn.btn-primary Sign In
        
</template>

<script>
export default {
  beforeCreate: function() {
  }
}
</script>
