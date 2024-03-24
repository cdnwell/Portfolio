<template>
  <nav class="db_nav">
    <ul>
      <DbNavItem />
      <DbNavItem />
      <DbNavItem />
      <DbNavItem />
    </ul>
  </nav>
</template>

<script setup>

import DbNavItem from "@/domain/components/dashboard/nav/item/DbNavItem.vue";
</script>

<style scoped>
.db_nav {
  width: 100%;
  height: 100%;

  background-color: var(--main-nav-color);
}

</style>