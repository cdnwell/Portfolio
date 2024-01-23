<template>
  <input :type="type" :placeholder="placeholder">
</template>

<script setup lang="ts">
const props = defineProps({
  type: String,
  placeholder: String
});

</script>

<style scoped>
input {
  width: 100%;

  padding: 10px;

  outline: none;

  border: 1px solid black;
}
</style>