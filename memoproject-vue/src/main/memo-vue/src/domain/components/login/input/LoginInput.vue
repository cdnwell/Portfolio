<template>
  <div class="login_input_div">
    <input :type="type" :placeholder="placeholder" v-model="inputVal" @keyup="onInputKeyup">
    <p :class="{ on_view: msg }">{{ msg }}</p>
  </div>
</template>

<script setup lang="ts">
import {ref} from "vue";

const emit = defineEmits(['update:modelValue']);

const props = defineProps({
  type: String,
  placeholder: String,
  msg: String,
});

const inputVal = ref<string>('');

const onInputKeyup = (evt) => {
  const val = evt.target.value;
  emit('update:modelValue', val);
}

</script>

<style scoped>
input {
  width: 100%;

  padding: 10px;

  outline: none;

  border: 1px solid black;
}

p {
  display: none;

  width: 100%;

  font-size: var(--log-font-size);

  color: red;

  padding: 5px;
  padding-bottom: 0;
}

.login_input_div {
  width: 100%;
}

.on_view {
  display: block;
}
</style>