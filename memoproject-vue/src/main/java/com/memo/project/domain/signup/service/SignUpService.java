package com.memo.project.domain.signup.service;

import com.memo.project.domain.signup.repository.SignUpRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class SignUpService {
    private final SignUpRepository signUpRepository;

    public boolean isEmailUnique(String email) {
        return !signUpRepository.existsByEmail(email);
    }
}
