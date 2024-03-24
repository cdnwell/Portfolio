<template>
  <button type="button" class="dup_chk_btn">{{ text }}</button>
</template>

<script setup lang="ts">
const props = defineProps({
  text: String
});
</script>

<style scoped>
.dup_chk_btn {
  padding: 11px 10px;

  border: 1px solid var(--light-blue);
  border-radius: 3px;

  color: white;
  background-color: var(--light-blue);

  transition: 0.2s;

  cursor: pointer;
}
</style>