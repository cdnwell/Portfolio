package com.memo.project.domain.signup.rest;

import com.memo.project.domain.signup.service.SignUpService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/signup")
@RestController
public class SignUpRestController {
    private final SignUpService signUpService;

    @PostMapping("/dupEmail")
    public boolean validateDuplicateEmail(String email) {
        log.info("[validate] is duplicate email - input :: {}", email);
        return signUpService.isEmailUnique(email);
    }
}
