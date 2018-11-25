<template lang="pug">
  section
    .container-fluid
      .row
        .col-xs-12
          p 
            | A Toronto based marketing company that specializes in Signs, promotional items and printing to meet the needs of its small, mid size and large corporations. 
            br
            br
            | We specialize in custom made designs to suit any special marketing needs of our clients.
          router-link(:to='{ name: "about" }') Learn more
</template>
