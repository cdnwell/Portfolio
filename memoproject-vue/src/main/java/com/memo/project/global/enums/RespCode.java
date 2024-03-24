package com.memo.project.global.enums;

import java.util.Map;

public enum RespCode {
    SUCCESS("000", "Success")
    , EMAIL_IS_UNIQUE("001", "이메일 사용이 가능합니다.")
    , FAIL("400", "Fail")
    , EMAIL_NOT_VALID("401", "올바른 이메일을 적어주세요.")
    , EMAIL_NOT_UNIQUE("402", "중복된 이메일이 존재합니다.")
    , NICK_NOT_VALID("403", "올바른 닉네임을 입력해주세요.(한글, 영문, 숫자 가능)")
    , NICK_NOT_UNIQUE("404", "중복된 닉네임이 존재합니다.")
    , NICK_IS_UNIQUE("002", "닉네임 사용이 가능합니다.")
    , PWD_NOT_EQUAL("410", "비밀번호가 일치하지 않습니다.")
    , PWD_NOT_VALID("411", "비밀번호가 유효하지 않습니다.")
    , SIGNUP_OK("010", "회원가입이 완료되었습니다.")
    , SIGNUP_FAIL("420", "회원가입에 실패하였습니다.")
    , SIGNIN_OK("020", "로그인 성공.")
    , SIGNIN_FAIL("502", "오류가 발생했습니다. 로그인에 실패하였습니다.")
    , EMAIL_NOT_EXIST("405", "이메일이 존재하지 않습니다.")
    , PWD_NOT_CORRECT("412", "비밀번호가 일치하지 않습니다.");
    ;

    private String code;
    private String message;

    RespCode(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public String getCode() {
        return this.code;
    }

    public String getMessage() {
        return this.message;
    }

    public static Map<String, Object> setRespCode(Map<String, Object> params, RespCode resp) {
        params.put("code", resp.getCode());
        params.put("message", resp.getMessage());
        return params;
    }
}
