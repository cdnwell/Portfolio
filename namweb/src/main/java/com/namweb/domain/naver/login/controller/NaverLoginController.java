package com.namweb.domain.naver.login.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.naver.login.service.NaverLoginService;
import com.namweb.global.constant.NaverConstant;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class NaverLoginController {
	
	private final NaverLoginService naverLoginService;

	@PostMapping("/login/naverLogin")
	public Map<String, Object> naverLogin(String code) {
		Map<String, Object> response = naverLoginService.naverLogin(code);
		return response;
	}

}
