<template>
  <button type="button">
    {{ placeholder }}
  </button>
</template>

<script setup lang="ts">
const props = defineProps({
  placeholder: String
});

</script>

<style scoped>
button {
  width: 100%;

  background-color: white;
  color: var(--btn-permit);

  border: 1px solid var(--btn-permit);

  border-radius: 5px;

  padding: 10px;

  transition: 0.5s;

  cursor: pointer;
}

button:hover {
  background-color: var(--btn-permit);
  color: white;

  border: 1px solid var(--btn-permit);
}
</style>