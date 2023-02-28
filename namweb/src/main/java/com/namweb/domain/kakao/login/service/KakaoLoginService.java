package com.namweb.domain.kakao.login.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.namweb.domain.kakao.login.dto.KakaoMemberInfoDto;
import com.namweb.domain.kakao.login.dto.KakaoTokenDto;
import com.namweb.domain.kakao.login.oauth.KakaoOAuth;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class KakaoLoginService {
	
	private final KakaoOAuth kakaoOAuth;
	
	public Map<String, Object> kakaoLogin(String code) {
		KakaoTokenDto kakaoTokenDto = kakaoOAuth.getAccessToken(code);
		KakaoMemberInfoDto kakaoMemberInfoDto = kakaoOAuth.getUserInfo(kakaoTokenDto);
		
		Map<String, Object> memberInfo = new HashMap<>();
		String email = kakaoMemberInfoDto.getEmail();
		
		try {
			
		} catch (Exception e) {
			
		}
		
		return null;
	}

}
