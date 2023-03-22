package com.namweb.domain.google.login.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.google.login.service.GoogleLoginService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class GoogleLoginController {

	private final GoogleLoginService googleLoginService;

	@PostMapping("/login/googleLogin")
	public Map<String, Object> googleLogin(String code) {
		return googleLoginService.googleLogin(code);
	}

}
