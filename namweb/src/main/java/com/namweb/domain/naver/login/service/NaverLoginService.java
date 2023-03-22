package com.namweb.domain.naver.login.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.namweb.domain.member.dto.MemberDto;
import com.namweb.domain.naver.login.dto.NaverMemberInfoDto;
import com.namweb.domain.naver.login.dto.NaverTokenDto;
import com.namweb.domain.naver.login.exception.NaverDiffTypeException;
import com.namweb.domain.naver.login.mapper.NaverLoginMapper;
import com.namweb.domain.naver.login.oauth.NaverOAuth;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NaverLoginService {

	private final NaverOAuth naverOAuth;
	private final NaverLoginMapper naverLoginMapper;

	public Map<String, Object> naverLogin(String code) {
		NaverTokenDto naverTokenDto = naverOAuth.getAccessToken(code);
		NaverMemberInfoDto naverMemberInfoDto = naverOAuth.getUserInfo(naverTokenDto);

		Map<String, Object> response = new HashMap<>();
		String email = naverMemberInfoDto.getEmail();

		try {
			MemberDto memberDto = naverLoginMapper.selectMemberInfo(email);

			if (!memberDto.getRegister_type().equals("naver"))
				throw new NaverDiffTypeException("이미 가입이 되어있는 이메일 주소입니다.(네이버 로그인 오류)");

			response.put("email", email);
			response.put("nick", memberDto.getNick());
			response.put("name", memberDto.getName());
		} catch (NaverDiffTypeException e) {
			response.put("error", e.getMessage());
			
			return response;
		} catch (Exception e) {
			naverLoginMapper.insertMember(naverMemberInfoDto);
			response.put("email", email);
			response.put("nick", naverMemberInfoDto.getNick());
			response.put("name", "사용자");
		}

		return response;
	}

}
