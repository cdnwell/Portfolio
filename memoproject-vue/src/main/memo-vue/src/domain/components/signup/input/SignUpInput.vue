<template>
  <div class="signup_input_div">
    <div class="signup_input_wrapper">
      <p class="signup_p" :class="{ onclick: !isInputEmpty }">{{ text }}</p>
      <IconEye
          class="signup_pw_eye"
          :class="{ onview: isPwType }"
          @click="onEyeIconClick" />
      <input
        class="signup_input"
        :type="inputType"
        v-model="inputVal"
        ref="inputRef"
        @keyup="onInputKeyup"
        @click="onInputClick"
        @blur="onInputBlur"
      />
    </div>
    <p
        class="signup_msg"
       :class="{ onview: msg, msg_ok_color: isCodeOk }"
    >{{ msg }}</p>
  </div>
</template>

<script setup lang="ts">
import {computed, ref} from 'vue'
import { INPUT_PW_TYPE } from '@/domain/components/enum/input/InputEnum'
import IconEye from '@/domain/components/icons/IconEye.vue'

const props = defineProps({
  text: String,
  type: String,
  msg: String,
  code: String,
});

const isInputEmpty = ref<boolean>(true);
const isPwType = ref<boolean>(false);
const isPwEyeClick = ref<boolean>(false);
const isMsgEmpty = ref<boolean>(true);
const inputVal = ref<string>('');
const inputRef = ref<HTMLInputElement>();

const msgText = ref<string>('');

// 문자열 길이 제한 = 20개
const strLimit = 30;

// watch(() => props.value, (newVal) => {
//   inputVal.value = newVal ?? '';
// });

const emit = defineEmits(['update:modelValue']);

if (props.type === INPUT_PW_TYPE) {
  isPwType.value = true
}

const onInputKeyup = (evt) => {
  let val = evt.target.value;

  if (val.length !== 0 && val.length <= strLimit) {
    isInputEmpty.value = false
    emit('update:modelValue', val);
  }
  if (val.length > strLimit) {
    inputVal.value = val.slice(0, strLimit);
    emit('update:modelValue', inputVal.value);
  }
}

const onInputClick = () => {
  isInputEmpty.value = false
}

const onInputBlur = (evt) => {
  const val = evt.target.value
  if (val.length > 0) return
  isInputEmpty.value = true
}

const onEyeIconClick = () => {
  isPwEyeClick.value = !isPwEyeClick.value;
}

const inputType = computed(() => {
  return isPwEyeClick.value ? 'text' : props.type;
});

const isCodeOk = computed(() => parseInt(props.code ?? '') < 100);

const getFocusOn = () => {
  inputRef?.value?.focus();
}

defineExpose({
  getFocusOn
})
</script>

<style scoped>
.signup_input_div {
  width: 100%;
}

.signup_input_wrapper {
  width: 100%;

  position: relative;
}

.signup_p {
  position: absolute;
  top: 50%;
  left: 15px;

  transform: translateY(-50%);

  color: gray;

  transition: 0.3s;
}

.signup_p.onclick {
  top: 0;

  transform: translateY(-50%);

  background-color: white;
}

.signup_input {
  width: 100%;

  padding: 15px;

  outline: none;
}

.signup_pw_eye.onview {
  display: flex;
}

.signup_pw_eye {
  display: none;

  position: absolute;

  top: 50%;
  right: 15px;

  transform: translateY(-50%);

  cursor: pointer;
}

.signup_msg {
  display: none;

  padding-top: 10px;
  padding-left: 10px;

  color: red;

  font-size: 12px;
}

.signup_msg.onview {
  display: flex;
}

.msg_ok_color {
  color: green;
}
</style>