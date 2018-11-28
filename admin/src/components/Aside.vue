<template lang="pug">
 aside.main-sidebar
  .sidebar
    ul.sidebar-menu
      li.header Page content
      li.treeview
        router-link(:to="{ name: 'index' }")
          span Index
      li.treeview
        router-link(:to="{ name: 'what-we-do' }")
          span What we do
      li.treeview
        router-link(:to="{ name: 'service' }")
          span Service
      li.treeview
        router-link(:to="{ name: 'works' }")
          span Works
      li.treeview
        router-link(:to="{ name: 'works-project' }")
          span Works Project
      li.treeview
        router-link(:to="{ name: 'about' }")
          span About us
      li.treeview
        router-link(:to="{ name: 'contacts' }")
          span Contact us
    ul.sidebar-menu
      li.header Content blocks
      li.treeview
        router-link(:to="{ name: 'why-us' }")
          span Why us
      li.treeview
        router-link(:to="{ name: 'customer-reviews' }")
          span Customer Reviews
      li.treeview
        router-link(:to="{ name: 'about-company' }")
          span About company
    ul.sidebar-menu
      li.header Other
      li.treeview
        router-link(:to="{ name: 'contacts-requests' }")
          span Contact requests
      li.treeview
        router-link(:to="{ name: 'settings' }")
          span Settings
</template>
