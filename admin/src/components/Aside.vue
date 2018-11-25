<template lang="pug">
 aside.main-sidebar
  .sidebar
    ul.sidebar-menu
      li.header Page content
      li.treeview
        router-link(:to="{ name: 'index' }")
          span Index
        router-link(:to="{ name: 'what-we-do' }")
          span What we do
        router-link(:to="{ name: 'service' }")
          span Service
        router-link(:to="{ name: 'works' }")
          span Works
        router-link(:to="{ name: 'works-project' }")
          span Works Project
        router-link(:to="{ name: 'about' }")
          span About us
        router-link(:to="{ name: 'contacts' }")
          span Contact us
        router-link(:to="{ name: 'customer-reviews' }")
          span Customer Reviews
        
    ul.sidebar-menu
      li.header Other
      li.treeview
        router-link(:to="{ name: 'contacts-requests' }")
          span Contact requests
        router-link(:to="{ name: 'settings' }")
          span Settings
</template>
