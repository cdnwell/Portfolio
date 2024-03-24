package com.memo.project.domain.sign.rest;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.memo.project.domain.sign.dto.User;
import com.memo.project.domain.sign.service.SignUpService;
import com.memo.project.global.enums.RespCode;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/signup")
public class SignUpRestController {
    private final SignUpService signUpService;
    private final Gson gson;

    @PostMapping("/dupEmail")
    public Map<String, Object> validateDuplicateEmail(@RequestBody String email) {
        Map<String, Object> result = new HashMap<>();
        String emailAddr = gson.fromJson(email, JsonObject.class).get("email").getAsString();

        log.info("[validate] email json :: {}", email);
        log.info("[validate] email string :: {}", emailAddr);

        if (!signUpService.isEmailValid(emailAddr, result)) {
            log.error("[validate] Email regex is not valid!");
            return result;
        }

        if (!signUpService.isEmailUnique(emailAddr, result)) {
            log.error("[validate] Email is not unique!");
            return result;
        }

        log.info("[validate] Email is valid!\nEmail :: {}", emailAddr);
        RespCode.setRespCode(result, RespCode.EMAIL_IS_UNIQUE);
        return result;
    }

    @PostMapping("/dupNick")
    public Map<String, Object> validateDuplicateNick(@RequestBody String nickJson) {
        Map<String, Object> result = new HashMap<>();
        String nick = gson.fromJson(nickJson, JsonObject.class).get("nick").getAsString();

        log.info("[validate] nick :: {}", nick);

        if(!signUpService.isNickValid(nick, result)) {
            log.error("[validate] Nick is not valid!");
            return result;
        }

        if(!signUpService.isNickUnique(nick, result)) {
            log.error("[validate] Email is not unique!");
            return result;
        }

        log.info("[validate] Nick is valid!\nNick :: {}", nick);
        RespCode.setRespCode(result, RespCode.NICK_IS_UNIQUE);
        return result;
    }

    @PostMapping("/submit")
    public Map<String, Object> submitSignUpForm(@RequestBody Map<String, String> params) {
        log.info("[SignUp#submit] params :: {}", params);

        Map<String, Object> result = new HashMap<>();
        String emailAddr = params.get("userEmail");
        String pwd1 = params.get("userPw1");
        String pwd2 = params.get("userPw2");
        String nick = params.get("userNick");

        // 유효성 검사 -----------------------------------------------

        // 1. email 유효성 검사
        // 1.1. email이 유효한지 검사
        if (!signUpService.isEmailValid(emailAddr, result)) {
            log.error("[validate] Email regex is not valid!");
            return result;
        }

        // 1.2. email이 유일한지 검사
        if (!signUpService.isEmailUnique(emailAddr, result)) {
            log.error("[validate] Email is not unique!");
            return result;
        }

        // 2. 비밀번호 유효성 검사
        // 2.1. 기존 입력된 비밀번호와 재입력한 비밀번호가 같은지 검사
        if (!signUpService.isPwdEqual(pwd1, pwd2, result)) {
            log.error("[validate] Pwd is not equal!");
            return result;
        }

        // 2.2. 비밀번호가 비밀번호 정책에 유효한지 검사
        if (!signUpService.isPwdValid(pwd1, result)) {
            log.error("[validate] Pwd is not valid!");
            return result;
        }

        // 3. 닉네임 유효성 검사
        // 3.1. 닉네임 유효한지 검사
        if(!signUpService.isNickValid(nick, result)) {
            log.error("[validate] Nick is not valid!");
            return result;
        }

        // 3.2. 닉네임이 유일한지 검사
        if(!signUpService.isNickUnique(nick, result)) {
            log.error("[validate] Email is not unique!");
            return result;
        }

        // 유효성 검사 완료 -----------------------------------------------
        User user = User.builder()
                        .email(emailAddr)
                        .pw(pwd1)
                        .nick(nick)
                        .build();
        try {
            signUpService.insertUser(user);
        } catch(Exception e) {
            e.printStackTrace();
            log.error("[SignUp/error] 회원가입 중 오류가 발생했습니다. Error :: {}\n가입 정보 :: {}", e.getMessage(), params);
            RespCode.setRespCode(result, RespCode.SIGNUP_FAIL);
            return result;
        }

        RespCode.setRespCode(result, RespCode.SIGNUP_OK);
        log.error("[SignUp/success] 회원가입이 완료되었습니다. 가입 정보 :: {}", params);
        return result;
    }
}
