package com.namweb.domain.naver.login.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.naver.login.service.NaverLoginService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class NaverLoginController {
	
	private final NaverLoginService naverLoginService;

	@PostMapping("/login/naverLogin")
	public Map<String, Object> naverLogin(String code) {
		return naverLoginService.naverLogin(code);
	}

}
