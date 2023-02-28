package com.namweb.domain.google.login.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.namweb.domain.google.login.dto.GoogleMemberInfoDto;
import com.namweb.domain.google.login.dto.GoogleTokenDto;
import com.namweb.domain.google.login.mapper.GoogleLoginMapper;
import com.namweb.domain.google.login.oauth.GoogleOAuth;
import com.namweb.domain.member.dto.MemberDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GoogleLoginService {

	private final GoogleOAuth googleOAuth;
	private final GoogleLoginMapper googleLoginMapper;

	public Map<String, Object> googleLogin(String code) {
		GoogleTokenDto googleTokenDto = googleOAuth.getAccessToken(code);
		GoogleMemberInfoDto googleMemberInfoDto = googleOAuth.getUserInfo(googleTokenDto);

		Map<String, Object> memberInfo = new HashMap<>();
		String email = googleMemberInfoDto.getEmail();

		try {
			MemberDto memberDto = googleLoginMapper.selectMemberInfo(email);
			memberInfo.put("email", email);
			memberInfo.put("name", memberDto.getName());
		} catch (Exception e) {
			googleLoginMapper.insertMember(googleMemberInfoDto);
			memberInfo.put("email", email);
			memberInfo.put("name", googleMemberInfoDto.getName());
		}

		return memberInfo;
	}

}
