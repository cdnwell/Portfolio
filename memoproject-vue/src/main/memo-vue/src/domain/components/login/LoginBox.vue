<template>
  <form class="login_box">
    <LoginTitle class="login_title" />
    <LoginInput
      class="login_id_input"
      :type="INPUT_TEXT_TYPE"
      :placeholder="LOGIN_ID_PH"
      :msg="signinEmailMsg"
      v-model="userEmail"
    />
    <LoginInput
      class="login_pw_input"
      :type="INPUT_PW_TYPE"
      :placeholder="LOGIN_PW_PH"
      :msg="signinPwdMsg"
      v-model="userPwd"
    />
    <LoginBtn class="login_btn" @click="onSignInSubmit" :placeholder="LOGIN_BTN_PH" />
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
import { INPUT_PW_TYPE, INPUT_TEXT_TYPE } from '@/domain/components/enum/input/InputEnum'
import { ref } from 'vue'
import {signInRepo} from "@/domain/components/login/repo/signInRepo";
import {EMAIL_NOT_EXIST, EMAIL_NOT_VALID, PWD_NOT_CORRECT, RESPONSE_OK_LIMIT} from "@/global/enum/ResponseEnum";
import {useRouter} from "vue-router";

const router = useRouter();
const emit = defineEmits(['ancClick'])

const onSignUpAnchorClick = (to: string) => {
  emit('ancClick', to)
}

const userEmail = ref('')
const userPwd = ref('')

const signinEmailMsg = ref<string>('');
const signinPwdMsg = ref<string>('');

// Sign in 버튼 클릭시
const onSignInSubmit = async () => {
  console.log('email : ' + userEmail.value);
  console.log('pwd : ' + userPwd.value);

  const { code, message } = await signInRepo(userEmail.value, userPwd.value);

  console.log('code : ' + code);
  console.log('message : ' + message);

  // sign in 성공
  if (code < RESPONSE_OK_LIMIT) {
    router.push('/dashboard');
  } else if (code >= RESPONSE_OK_LIMIT) {
    // 이전 문자열 초기화
    signinEmailMsg.value = '';
    signinPwdMsg.value = '';

    switch(code) {
      case EMAIL_NOT_VALID:
      case EMAIL_NOT_EXIST:
        signinEmailMsg.value = message;
        break;
      case PWD_NOT_CORRECT:
        signinPwdMsg.value = message;
        break;
    }
  }
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
