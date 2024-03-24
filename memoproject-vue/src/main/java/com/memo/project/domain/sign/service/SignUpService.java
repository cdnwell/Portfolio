package com.memo.project.domain.sign.service;

import com.memo.project.domain.sign.dto.User;
import com.memo.project.domain.sign.repository.SignRepository;
import com.memo.project.global.enums.RegexPattern;
import com.memo.project.global.enums.RespCode;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@RequiredArgsConstructor
@Service
public class SignUpService {
    private final SignRepository signRepository;

    public boolean isEmailUnique(String email, Map<String, Object> result) {
        boolean isEmailUnique = !signRepository.existsByEmail(email);
        if(!isEmailUnique)
            RespCode.setRespCode(result, RespCode.EMAIL_NOT_UNIQUE);
        return isEmailUnique;
    }

    public boolean isEmailValid(String email, Map<String, Object> result) {
        boolean isEmailValid = RegexPattern.isMatched(RegexPattern.EMAIL, email);
        if(!isEmailValid)
            RespCode.setRespCode(result, RespCode.EMAIL_NOT_VALID);
        return isEmailValid;
    }

    public boolean isNickValid(String nick, Map<String, Object> result) {
        boolean isNickValid = RegexPattern.isMatched(RegexPattern.NICK, nick);
        if(!isNickValid)
            RespCode.setRespCode(result, RespCode.NICK_NOT_VALID);
        return isNickValid;
    }

    public boolean isNickUnique(String nick, Map<String, Object> result) {
        boolean isNickUnique = !signRepository.existsByNick(nick);
        if(!isNickUnique)
            RespCode.setRespCode(result, RespCode.NICK_NOT_UNIQUE);
        return isNickUnique;
    }

    public boolean isPwdEqual(String pwd1, String pwd2, Map<String, Object> result) {
        boolean isPwdEqual = pwd1.equals(pwd2);
        if(!isPwdEqual)
            RespCode.setRespCode(result, RespCode.PWD_NOT_EQUAL);
        return isPwdEqual;
    }

    public boolean isPwdValid(String pwd1, Map<String, Object> result) {
        boolean isPwdValid = RegexPattern.isMatched(RegexPattern.PWD, pwd1);
        if (!isPwdValid)
            RespCode.setRespCode(result, RespCode.PWD_NOT_VALID);
        return isPwdValid;
    }

    @Transactional
    public void insertUser(User user) {
        signRepository.save(user);
    }
}
