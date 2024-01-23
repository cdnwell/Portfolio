<template>
  <a @click="onAnchorClick">{{ text }}</a>
</template>

<script setup lang="ts">
const emit = defineEmits(['ancClick']);

const props = defineProps({
  text: String
  , id: String
});

const onAnchorClick = () => {
  // router.push({ path: props.to });
  emit('ancClick', props.id);
}


</script>

<style scoped>
a {
  font-size: 12px;

  cursor: pointer;
}

a:hover {
  color: var(--btn-permit);
}
</style>