package com.memo.project.domain.signup.rest;

import com.memo.project.domain.signup.dto.Email;
import com.memo.project.domain.signup.service.SignUpService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RequiredArgsConstructor
@RestController
public class SignUpRestController {
    private final SignUpService signUpService;

    @PostMapping("/signup/dupemail")
    public boolean validateDuplicateEmail(@RequestBody Email email) {
        String emailAddress = email.getEmail();
        log.info("[validate] is duplicate email - input :: {}", emailAddress);
        return signUpService.isEmailUnique(emailAddress);
    }
}
