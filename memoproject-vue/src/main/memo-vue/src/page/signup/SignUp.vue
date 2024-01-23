<template>
  <section class="sign_up">
    <SignUpBox />
  </section>
</template>

<script setup lang="ts">

import SignUpBox from "@/domain/components/signup/SignUpBox.vue";
</script>

<style scoped>
.sign_up {
  width: 100%;
  height: 100%;

  display: flex;
  justify-content: center;
  align-items: center;
}
</style>