package com.namweb.domain.kakao.login.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.kakao.login.service.KakaoLoginService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class KakaoLoginController {
	
	private final KakaoLoginService kakaoLoginService;

	@PostMapping("/login/kakaoLogin")
	public Map<String, Object> kakaoLogin(String code) {
		return kakaoLoginService.kakaoLogin(code);
	}

}
