<template>
  <form class="signup_box">
    <SignUpBackBtn class="signup_back_btn" @click="onBackBtnClick" />
    <SingUpTitle class="signup_title" :text="SIGNUP_TITLE_TEXT" />
    <div class="signup_email_div">
      <SignUpInput
        class="signup_email_input"
        v-model="userEmail"
        :type="INPUT_TEXT_TYPE"
        :text="SIGNUP_EMAIL_TEXT"
        :msg="emailMsg"
        :code="emailCode"
        ref="emailRef"
        @keyup="handleEmailInput"
      />
      <SingUpDupChkBtn
        @click="onEmailDupClick"
        class="signup_dup_email_btn"
        :text="SIGNUP_DUP_TEXT"
      />
      <IconCheck
        class="singup_check_icon"
        :class="{ onview: cachedUserEmailChecked }"
      />
    </div>
    <SignUpInput
      class="signup_pw_input"
      v-model="userPw1"
      :type="INPUT_PW_TYPE"
      :text="SIGNUP_PW_TEXT"
      :msg="pw1Msg"
      :code="pw1Code"
      ref="pw1Ref"
      @keyup="handlePasswordInput"
    />
    <SignUpInput
      class="signup_pw_input"
      v-model="userPw2"
      :type="INPUT_PW_TYPE"
      :text="SIGNUP_RE_PW_TEXT"
      :msg="pw2Msg"
      :code="pw2Code"
      @keyup="handlePasswordInput"
    />
    <div class="signup_nick_div">
      <SignUpInput
          class="signup_nick_input"
          v-model="userNick"
          :type="INPUT_TEXT_TYPE"
          :text="SIGNUP_NICK_TEXT"
          :msg="nickMsg"
          :code="nickCode"
          ref="nickRef"
          @keyup="handleNickInput"
      />
      <SingUpDupChkBtn
          class="nick_dup_btn"
          :text="SIGNUP_DUP_TEXT"
          @click="onNickDupClick"
      />
      <IconCheck
          class="singup_check_icon"
          :class="{ onview: cachedUserNickChecked }"
      />
    </div>
    <SignUpBtn @click="onSingUpSubmit" :text="SIGNUP_BTN_TEXT" />
  </form>
</template>

<script setup lang="ts">
import SingUpTitle from '@/domain/components/signup/title/SingUpTitle.vue'
import SignUpBackBtn from '@/domain/components/signup/button/SignUpBackBtn.vue'
import { LOGIN_ID } from '@/domain/components/login/enum/LoginEnum'
import SignUpInput from '@/domain/components/signup/input/SignUpInput.vue'
import {
  SIGNUP_BTN_TEXT,
  SIGNUP_DUP_TEXT,
  SIGNUP_EMAIL_TEXT,
  SIGNUP_NICK_TEXT,
  SIGNUP_PW_TEXT,
  SIGNUP_RE_PW_TEXT,
  SIGNUP_TITLE_TEXT
} from '@/domain/components/signup/enum/SignUpEnum'
import { INPUT_PW_TYPE, INPUT_TEXT_TYPE } from '@/domain/components/enum/input/InputEnum'
import SingUpDupChkBtn from '@/domain/components/signup/button/SingUpDupChkBtn.vue'
import SignUpBtn from '@/domain/components/signup/button/SignUpBtn.vue'
import axios from '@/global/axios'
import {ref} from 'vue'
import {
  isPwEqual,
  isPwLengthOver4,
  isPwValid
} from '@/domain/components/signup/func/validatePassword'
import IconCheck from "@/domain/components/icons/IconCheck.vue";
import {useRouter} from "vue-router";

const emit = defineEmits(['ancClick'])
const router = useRouter();

const userEmail = ref('')
const userPw1 = ref('')
const userPw2 = ref('')
const userNick = ref('');

const emailMsg = ref('')
const emailCode = ref('')
const emailRef = ref();

const pw1Msg = ref('')
const pw1Code = ref('')
const pw1Ref = ref()
const pw2Msg = ref('')
const pw2Code = ref('')

const nickMsg = ref('')
const nickCode = ref('')
const nickRef = ref()

const cachedUserEmail = ref('')
const cachedUserEmailChecked = ref(false)

const cachedUserNickChecked = ref(false)

const okLimit = 100;

const onBackBtnClick = () => {
  emit('ancClick', LOGIN_ID)
}

// email이 유효한 상태에서 입력을하면 유효한 상태를 해제한다.
const handleEmailInput = () => {
  if(cachedUserEmailChecked.value) {
    console.log("cachedUserEmailChecked.value : " + cachedUserEmailChecked.value);
    emailMsg.value = "";
    emailCode.value = "";
    return cachedUserEmailChecked.value = false;
  }
}

const handlePasswordInput = () => {
  if (!isPwValid(userPw1.value, pw1Msg, pw1Code)) return false
  if (!isPwLengthOver4(userPw1.value, userPw2.value)) return false
  if (!isPwEqual(userPw1.value, userPw2.value, pw1Msg, pw1Code)) return false
  return true
}

const onEmailDupClick = () => {
  const email = userEmail.value
  console.log('email : ' + email)
  axios
    .post('/signup/dupEmail', { email }, {
      headers: {
        'Content-Type': 'application/json'
      }
    })
    .then((result) => {
      console.log(result)
      const data = result.data
      const code = data.code
      const msg = data.message

      // code 0 - 100은 success
      cachedUserEmailChecked.value = parseInt(code) < okLimit
      cachedUserEmail.value = userEmail.value
      console.log('cached user email : ' + cachedUserEmail.value)
      console.log('curr user email : ' + userEmail.value)
      console.log('cached user email checked : ', cachedUserEmailChecked.value)
      // alert(msg);
      emailMsg.value = msg
      emailCode.value = code
    })
    .catch((error) => console.log(error))
}

const onNickDupClick = () => {
  const nick = userNick.value;

  axios.post('/signup/dupNick', { nick }, {
    headers: {
      "Content-Type" : "application/json"
    }
  })
      .then((result) => {
        console.log(result);
        const data = result.data;
        const code = data.code;
        const msg = data.message;

        cachedUserNickChecked.value = parseInt(code) < okLimit
        console.log('result : ' + result);
        console.log('nick chk : ' + cachedUserNickChecked.value);

        nickMsg.value = msg;
        nickCode.value = code;
      })
      .catch((error) => console.log(error))
}

const handleNickInput = () => {
  if(cachedUserNickChecked.value)
    return cachedUserNickChecked.value = false;
  return true;
}

const focusOnEmail = () => emailRef.value.getFocusOn();
const focusOnPwd = () => pw1Ref.value.getFocusOn();
const focusOnNick = () => nickRef.value.getFocusOn();

const onSingUpSubmit = () => {
  console.log('[click] submit');
  console.log('is email chk : ' + cachedUserEmailChecked.value);
  if(!cachedUserEmailChecked.value) {
    console.log('entered!')
    console.log('emailRef?.value : ' + emailRef);
    focusOnEmail();
    return false;
  } else if (!handlePasswordInput()) {
    focusOnPwd();
    return false;
  } else if (!cachedUserNickChecked.value) {
    focusOnNick();
    return false;
  }
  axios.post('/signup/submit',
      { userEmail: userEmail.value
        , userPw1: userPw1.value
        , userPw2: userPw2.value
        , userNick: userNick.value
      }
  ).then((result) => {
      console.log('[result]');
      console.log(result);
      const { data } = result;
      const { message } = data;
      let { code } = data;
      code = parseInt(code);

      // code < 100 == OK
      // code >= 400 == FAIL
      if (code < 100) {
        // === 회원가입 성공 === //
        // Dashboard 페이지로 이동
        router.push('/dashboard');
      } else if (code >= 400) {
        // === 회원가입 실패 === //
        alert(message);
      }

  }).catch((err) => {
      console.error(err);
  })
  return true;
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
  position: absolute;

  top: 17px;
  z-index: -1;
}

.signup_email_div {
  width: 100%;

  position: relative;
}

.signup_email_div,
.signup_pw_input,
.signup_nick_input {
  margin-bottom: 15px;
}

.signup_dup_email_btn {
  position: absolute;

  top: 3.5px;
  right: 2px;
}

.signup_nick_div {
  position: relative;

  width: 100%;
}

.nick_dup_btn {
  position: absolute;
  top: 3.5px;
  right: 2px;
}

.singup_check_icon {
  position: absolute;
  display: none;

  top: 13px;
  right: 87px;
}

.onview {
  display: block;
}
</style>

<style>
.signup_back_btn svg {
  rotate: 180deg;
  transform: translateX(1px);
}
</style>