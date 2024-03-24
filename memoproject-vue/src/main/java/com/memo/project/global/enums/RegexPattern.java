package com.memo.project.global.enums;

import lombok.Getter;

import java.util.regex.Pattern;

@Getter
public enum RegexPattern {
    EMAIL("^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    , NICK("^[가-힣a-zA-Z0-9]{2,10}$")
    , PWD("^(?=.*[a-zA-Z])(?=.*\\d)[a-zA-Z\\d!@#$%^*+=-]{6,30}$")
    ;

    private String regex;

    RegexPattern(String regex) {
        this.regex = regex;
    }

    public static boolean isMatched(RegexPattern pattern, String param) {
        String regex = pattern.getRegex();
        return Pattern.matches(regex, param);
    }

}
