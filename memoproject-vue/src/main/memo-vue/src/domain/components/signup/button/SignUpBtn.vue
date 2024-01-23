<template>
  <button class="sign_up_btn" @click="onSignUpBtnClick">{{ text }}</button>
</template>

<script setup lang="ts">
const props = defineProps({
  text: String
});

const emit = defineEmits(['signUpClick'])

const onSignUpBtnClick = () => {
  emit('signUpClick');
}

</script>

<style scoped>
.sign_up_btn {
  width: 100%;

  padding: 10px;

  border: 1px solid var(--light-blue);

  color: var(--light-blue);
  background-color: white;

  transition: 0.2s;

  cursor: pointer;
}

.sign_up_btn:hover {
  color: white;
  background-color: var(--light-blue);
}
</style>