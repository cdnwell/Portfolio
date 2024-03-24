package com.memo.project.domain.sign.rest;

import com.memo.project.domain.sign.exception.SignInException;
import com.memo.project.domain.sign.service.SignInService;
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
@RestController
@RequiredArgsConstructor
@RequestMapping("/signin")
public class SingInRestController {
    private final SignUpService signUpService;
    private final SignInService signInService;
    
    @PostMapping({"/", ""})
    public Map<String, Object> signin(@RequestBody Map<String, Object> params) {
        Map<String, Object> result = new HashMap<>();
        String email = (String) params.get("email");
        String pwd = (String) params.get("pwd");
        boolean isSignInOk = false;
        log.info("[SignIn] params :: {}", params);

        // 유효성 검사 시작 -----------------------------------------------

        // 1. email 유효성 검사
        // 1.1. email이 유효한지 검사
        if (!signUpService.isEmailValid(email, result)) {
            log.error("[validate] Email regex is not valid!");
            return result;
        }

        // 1.2. email이 존재하는지 검사
        if (!signInService.doesEmailExist(email, result)) {
            log.error("[SignIn/validate] Email doesn't exist!\nEmail :: {}", email);
            return result;
        }

        // 유효성 검사 완료 -----------------------------------------------

        // sign in -----------------------------------------------

        try {
            isSignInOk = signInService.signIn(email, pwd);
            if(!isSignInOk)
                return RespCode.setRespCode(result, RespCode.PWD_NOT_CORRECT);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[SignIn/Exception] error :: {}", e.getMessage());
            return RespCode.setRespCode(result, RespCode.SIGNIN_FAIL);
        }

        // sign in end -----------------------------------------------

        return RespCode.setRespCode(result, RespCode.SIGNIN_OK);
    }
}
