<template>
  <form class="signup_box">
    <SignUpBackBtn class="signup_back_btn" @click="onBackBtnClick" />
    <SingUpTitle class="signup_title" :text="SIGNUP_TITLE_TEXT" />
    <div class="signup_email_div">
      <SignUpInput class="signup_email_input" v-model="userEmail" :type="INPUT_TEXT_TYPE" :text="SIGNUP_EMAIL_TEXT" />
      <SingUpDupEmailChkBtn @isDupClick="onIsDupClick" class="signup_dup_email_btn" :text="SIGNUP_EMAIL_DUP_TEXT" />
    </div>
    <SignUpInput class="signup_pw_input" :type="INPUT_PW_TYPE" :text="SIGNUP_PW_TEXT" />
    <SignUpInput class="signup_pw_input" :type="INPUT_PW_TYPE" :text="SIGNUP_RE_PW_TEXT" />
    <SignUpInput class="signup_nick_input" :type="INPUT_TEXT_TYPE" :text="SIGNUP_NICK_TEXT" />
    <SignUpBtn @signUpClick="onSignUpClick" :text="SIGNUP_BTN_TEXT" />
  </form>
</template>

<script setup lang="ts">
import SingUpTitle from "@/domain/components/signup/title/SingUpTitle.vue";
import SignUpBackBtn from "@/domain/components/signup/button/SignUpBackBtn.vue";
import {LOGIN_ID} from "@/domain/components/login/enum/LoginEnum";
import SignUpInput from "@/domain/components/signup/input/SignUpInput.vue";
import {
  SIGNUP_BTN_TEXT,
  SIGNUP_EMAIL_DUP_TEXT,
  SIGNUP_EMAIL_TEXT, SIGNUP_NICK_TEXT,
  SIGNUP_PW_TEXT,
  SIGNUP_RE_PW_TEXT,
  SIGNUP_TITLE_TEXT
} from "@/domain/components/signup/enum/SignUpEnum";
import {INPUT_PW_TYPE, INPUT_TEXT_TYPE} from "@/domain/components/enum/input/InputEnum";
import SingUpDupEmailChkBtn from "@/domain/components/signup/button/SingUpDupEmailChkBtn.vue";
import SignUpBtn from "@/domain/components/signup/button/SignUpBtn.vue";
import axios from "axios";
import {ref} from "vue";

const emit = defineEmits(['ancClick']);

const userEmail = ref('');

const onBackBtnClick = () => {
  emit('ancClick', LOGIN_ID);
}

const onSignUpClick = () => {

}

const onIsDupClick = () => {
  const email = userEmail.value;
  console.log('email : ' + email);
  // axios.post('/signUp/dupEmail', { email }).then(result => {
  //   console.log(result);
  // }).catch(error => console.log(error));
}

</script>

<style scoped>
.signup_box {
  width: 500px;
  height: 600px;

  position: relative;

  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  background-color: white;

  border-radius: 10px;

  padding: 30px;

  box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
}

.signup_back_btn {
  position: absolute;

  top: 20px;
  left: 20px;

  box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;

  cursor: pointer;
}

.signup_title {
  margin-bottom: 10px;
}

.signup_email_div {
  width: 100%;

  position: relative;
}

.signup_email_div
, .signup_pw_input
, .signup_nick_input {
  margin-bottom: 15px;
}

.signup_dup_email_btn {
  position: absolute;

  top: 3.5px;
  right: 2px;
}

</style>

<style>
.signup_back_btn svg {
  rotate: 180deg;
  transform: translateX(1px);
}
</style>