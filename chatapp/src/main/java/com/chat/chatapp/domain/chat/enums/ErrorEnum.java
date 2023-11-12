package com.chat.chatapp.domain.chat.enums;

public enum ErrorEnum {
    FILE_UPLOAD(403, "파일 업로드에 실패하였습니다.")
    , REGISTER(400, "회원가입에 실패하였습니다.")
    , SIGN_IN(400, "로그인에 실패했습니다.");
    ;

    private final int code;
    private final String msg;

    ErrorEnum(int code, String msg) {
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
