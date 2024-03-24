<template>
  <article class="db_article">
    <section class="db_nav_section">
      <DashboardNav />
    </section>
    <section class="db_content_section">
      <DbContent />
    </section>
  </article>
</template>

<script setup>

import DashboardNav from "@/domain/components/dashboard/nav/DashboardNav.vue";
import DbContent from "@/domain/components/dashboard/content/DbContent.vue";
</script>

<style scoped>
.db_article {
  width: 100%;
  height: 100%;

  display: flex;
}

.db_nav_section {
  width: 20rem;
  height: 100%;
  flex-shrink: 0;
}

.db_content_section {
  width: 100%;
  height: 100%;
}
</style>