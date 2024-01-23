<template>
  <section class="login_page">
    <LoginBackground class="login_bg" />
    <LoginBox class="login_box" v-if="currentBox === LOGIN_ID" @ancClick="onEmitClick" />
    <SignUpBox class="signup_box" v-else-if="currentBox === LOGIN_SIGN_UP_ID" @ancClick="onEmitClick" />
  </section>
</template>

<script setup lang="ts">
import { ref } from 'vue'

import LoginBox from '@/domain/components/login/LoginBox.vue'
import {
  LOGIN_ID_PW_ID,
  LOGIN_ID,
  LOGIN_SIGN_UP_ID,
} from '@/domain/components/login/enum/LoginEnum'
import SignUpBox from "@/domain/components/signup/SignUpBox.vue";
import LoginBackground from "@/domain/components/login/background/LoginBackground.vue";

const currentBox = ref(LOGIN_ID);

const onEmitClick = (id: string) => {
  currentBox.value = id;
}

</script>

<style scoped>
.login_page {
  width: 100%;
  height: 100%;

  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  background-color: #2c3e50;
}

.login_bg {
  width: 100%;
  height: 100%;

  position: absolute;

  top: 0;
  left: 0;

  background-size: cover;

  transition: 0.5s;
}

.login_bg
, .login_box
, .signup_box {
  z-index: 10;
}

.fade_in {
  opacity: 1;
}

.fade_out {
  opacity: 0;
}
</style>
