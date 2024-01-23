<template>
  <form class="login_box">
    <LoginTitle class="login_title" />
    <LoginInput class="login_id_input" :type="INPUT_TEXT_TYPE" :placeholder="LOGIN_ID_PH" />
    <LoginInput class="login_pw_input" :type="INPUT_PW_TYPE" :placeholder="LOGIN_PW_PH" />
    <LoginBtn class="login_btn" :placeholder="LOGIN_BTN_PH" />
    <div class="login_p_box">
      <LoginA class="id_pw_a" :text="LOGIN_ID_PW_TEXT" :id="LOGIN_ID_PW_ID" />
      <LoginA
        class="sign_up_a"
        :text="LOGIN_SIGN_UP_TEXT"
        :id="LOGIN_SIGN_UP_ID"
        @ancClick="onSignUpAnchorClick"
      />
    </div>
  </form>
</template>

<script setup lang="ts">
import LoginTitle from '@/domain/components/login/title/LoginTitle.vue'
import LoginInput from '@/domain/components/login/input/LoginInput.vue'
import LoginBtn from '@/domain/components/login/button/LoginBtn.vue'
import LoginA from '@/domain/components/login/anchor/LoginA.vue'
import {
  LOGIN_ID_PH,
  LOGIN_ID_PW_ID,
  LOGIN_ID_PW_TEXT,
  LOGIN_BTN_PH,
  LOGIN_PW_PH,
  LOGIN_SIGN_UP_ID,
  LOGIN_SIGN_UP_TEXT
} from '@/domain/components/login/enum/LoginEnum'
import {INPUT_PW_TYPE, INPUT_TEXT_TYPE} from "@/domain/components/enum/input/InputEnum";

const emit = defineEmits(['ancClick'])

const onSignUpAnchorClick = (to: string) => {
  emit('ancClick', to)
}
</script>

<style scoped>
.login_box {
  width: 400px;
  height: 400px;

  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  border-radius: 10px;

  padding: 30px;

  background-color: white;

  box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
}

.login_title {
  margin-bottom: 55px;
}

.login_id_input,
.login_pw_input {
  margin-bottom: 10px;
}

.login_btn {
  margin-top: 10px;
}

.login_p_box {
  width: 100%;

  display: flex;

  margin-top: 10px;
}

.id_pw_a {
  margin-right: 7px;
}

.id_pw_a:after {
  content: '|';
  margin-left: 7px;
}
</style>
