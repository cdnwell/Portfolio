package com.namweb.domain.kakao.login.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.namweb.domain.kakao.login.dto.KakaoMemberInfoDto;
import com.namweb.domain.kakao.login.dto.KakaoTokenDto;
import com.namweb.domain.kakao.login.exception.KakaoDiffTypeException;
import com.namweb.domain.kakao.login.mapper.KakaoLoginMapper;
import com.namweb.domain.kakao.login.oauth.KakaoOAuth;
import com.namweb.domain.member.dto.MemberDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class KakaoLoginService {
	
	private final KakaoOAuth kakaoOAuth;
	private final KakaoLoginMapper kakaoLoginMapper;
	
	public Map<String, Object> kakaoLogin(String code) {
		KakaoTokenDto kakaoTokenDto = kakaoOAuth.getAccessToken(code);
		KakaoMemberInfoDto kakaoMemberInfoDto = kakaoOAuth.getUserInfo(kakaoTokenDto);
		
		Map<String, Object> response = new HashMap<>();
		String email = kakaoMemberInfoDto.getEmail();
		
		try {
			MemberDto memberDto = kakaoLoginMapper.selectMemberInfo(email);
			
			if(!memberDto.getRegister_type().equals("kakao"))
				throw new KakaoDiffTypeException("이미 가입이 되어있는 이메일 주소입니다.(카카오 로그인 오류)");
			
			response.put("email", email);
			response.put("name", memberDto.getNick());
		} catch(KakaoDiffTypeException e) {
			response.put("eror", e.getMessage());
			
			return response;
		}catch (Exception e) {
			kakaoLoginMapper.insertMember(kakaoMemberInfoDto);
			response.put("email", email);
			response.put("name", kakaoMemberInfoDto.getNick());
		}
		
		
		
		return response;
	}

}
