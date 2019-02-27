<template lang="pug">
 aside.main-sidebar
  .sidebar
    ul.sidebar-menu
      li.treeview.menu-open
        a
          i.fa.fa-files-o
          span Page content
        ul.treeview-menu(style="display: block;")
          li
            router-link(:to="{ name: 'index' }")
              span Index
          li
            router-link(:to="{ name: 'what-we-do' }")
              span What we do
          li
            router-link(:to="{ name: 'works' }")
              span Our Works
          li
            router-link(:to="{ name: 'about' }")
              span About us
          li
            router-link(:to="{ name: 'contacts' }")
              span Contact us
      li.treeview.menu-open
        a
          i.fa.fa-th
          span Content blocks
        ul.treeview-menu(style="display: block;")
          li
            router-link(:to="{ name: 'why-us' }")
              span Why us
          li
            router-link(:to="{ name: 'team' }")
              span Team
      li.treeview.menu-open
        a
          i.fa.fa-edit
          span Other
        ul.treeview-menu(style="display: block;")
          li
            router-link(:to="{ name: 'contacts-requests' }")
              span Contact requests
          li
            router-link(:to="{ name: 'settings' }")
              span Settings
</template>

<script>
export default {
  methods: {
    toggleThree($event) {
      const li = $event.target.closest('.treeview');
      
      if (li.classList.contains('menu-open')) {
        li.classList.remove('menu-open')
      } else {
         li.classList.add('menu-open')
      }
    }
  }
}
</script>

