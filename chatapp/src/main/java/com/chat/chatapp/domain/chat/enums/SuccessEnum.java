package com.chat.chatapp.domain.chat.enums;

public enum SuccessEnum {
    FILE_UPLOAD(200, "파일 업로드에 성공하였습니다.")
    , REGISTER(200, "회원가입에 성공하였습니다.")
    , SIGN_IN(200, "로그인에 성공하였습니다.")
    ;

    private int code;
    private String msg;

    SuccessEnum(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
