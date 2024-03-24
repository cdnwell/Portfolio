package com.memo.project.domain.sign.service;

import com.memo.project.domain.sign.dto.User;
import com.memo.project.domain.sign.repository.SignRepository;
import com.memo.project.global.enums.RespCode;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class SignInService {
    private final SignRepository signRepository;

    @Transactional
    public boolean signIn(String email, String pwd) {
        User user = signRepository.findByEmail(email);
        log.info("[SignIn/Transaction] User :: {}", user);
        if(user != null && user.getPw().equals(pwd))
            return true;
        return false;
    }

    public boolean doesEmailExist(String email, Map<String, Object> result) {
        boolean doesEmailExist = signRepository.existsByEmail(email);
        if (!doesEmailExist)
            RespCode.setRespCode(result, RespCode.EMAIL_NOT_EXIST);
        return doesEmailExist;
    }
}
