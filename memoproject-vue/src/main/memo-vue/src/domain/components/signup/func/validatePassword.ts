import {
    SIGNUP_PW_EQUAL_CODE,
    SIGNUP_PW_EQUAL_TEXT,
    SIGNUP_PW_NOT_EQUAL_CODE,
    SIGNUP_PW_NOT_EQUAL_TEXT,
    SIGNUP_PW_NOT_VALID_CODE,
    SIGNUP_PW_NOT_VALID_TEXT,
    SIGNUP_PW_VALID_CODE,
    SIGNUP_PW_VALID_TEXT
} from '@/domain/components/signup/enum/SignUpEnum'
import {SIGNUP_PW_REGEX} from "@/domain/components/signup/enum/SignUpRegex";

/**
 * 비밀번호가 유효한지 판별한다.
 * @param {string} pw 비밀번호
 * @param {value: string} pwMsg 비밀번호의 메시지를 담은 ref 객체
 * @param {value: string} pwCode 비밀번호의 코드를 담은 ref 객체
 * @returns {boolean}
 */
export function isPwValid(pw : string, pwMsg: { value: string }, pwCode: { value: string }) {
    const pwRegex = SIGNUP_PW_REGEX;

    if (pw.match(pwRegex)) {
        pwMsg.value = SIGNUP_PW_VALID_TEXT;
        pwCode.value = SIGNUP_PW_VALID_CODE;
        return true;
    } else {
        pwMsg.value = SIGNUP_PW_NOT_VALID_TEXT;
        pwCode.value = SIGNUP_PW_NOT_VALID_CODE;
        return false;
    }
}

/**
 * 비밀번호와 재입력한 비밀번호가 일치하는지 판별한다.
 * @param {string} pw1 입력한 비밀번호
 * @param {string} pw2 재입력한 비밀번호
 * @param {value: string} pwMsg 비밀번호 메시지를 담은 ref 객체
 * @param {value: string} pwCode 비밀번호 코드를 담은 ref 객체
 * @returns {boolean}
 */
export function isPwEqual(pw1 : string, pw2 : string, pwMsg: { value: string }, pwCode: { value: string }) {
    if (pw1 === pw2) {
        pwMsg.value = SIGNUP_PW_EQUAL_TEXT;
        pwCode.value = SIGNUP_PW_EQUAL_CODE;
        return true;
    } else {
        pwMsg.value = SIGNUP_PW_NOT_EQUAL_TEXT;
        pwCode.value = SIGNUP_PW_NOT_EQUAL_CODE;
        return false;
    }
}

/**
 * 둘 중 하나 이상의 비밀번호 문자열의 길이가 4 이하인지 판별한다.
 * @param {string} pw1 입력한 비밀번호
 * @param {string} pw2 재입력한 비밀번호
 */
export function isPwLengthOver4(pw1: string, pw2: string) {
    return pw1.length >= 4 && pw2.length >= 4;
}
