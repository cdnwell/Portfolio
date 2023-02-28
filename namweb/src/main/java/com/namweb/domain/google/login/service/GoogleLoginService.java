package com.namweb.domain.google.login.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.namweb.domain.google.login.dto.GoogleMemberInfoDto;
import com.namweb.domain.google.login.dto.GoogleTokenDto;
import com.namweb.domain.google.login.exception.GoogleDiffTypeException;
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

		Map<String, Object> response = new HashMap<>();
		String email = googleMemberInfoDto.getEmail();

		try {
			MemberDto memberDto = googleLoginMapper.selectMemberInfo(email);

			if (!memberDto.getRegister_type().equals("google"))
				throw new GoogleDiffTypeException("이미 가입되어 있는 이메일 주소입니다.(구글 로그인 오류)");

			response.put("email", email);
			response.put("name", memberDto.getName());
		} catch (GoogleDiffTypeException e) {
			response.put("error", e.getMessage());
			
			return response;
		} catch (Exception e) {
			googleLoginMapper.insertMember(googleMemberInfoDto);
			response.put("email", email);
			response.put("name", googleMemberInfoDto.getName());
		}

		return response;
	}

}
