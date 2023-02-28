package com.namweb.domain.naver.login.oauth;

import org.springframework.stereotype.Component;

import com.namweb.domain.naver.login.dto.NaverMemberInfoDto;
import com.namweb.domain.naver.login.dto.NaverTokenDto;
import com.namweb.global.constant.NaverConstant;
import com.namweb.global.login.LoginConnector;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class NaverOAuth {
	private String tokenReqUrl = NaverConstant.NAVER_TOKEN_REQ_URL.getName();
	private String userInfoReqUrl = NaverConstant.NAVER_USER_INFO_REQ_URL.getName();
	private String clientId = NaverConstant.CLIENT_ID.getName();
	private String clientSecret = NaverConstant.CLIENT_SECRET.getName();
	
	private final LoginConnector loginConnector;
	
	public NaverTokenDto getAccessToken(String code) {
		StringBuilder sb = new StringBuilder();
		
		sb.append("grant_type=authorization_code");
		sb.append("&client_id=" + clientId);
		sb.append("&client_secret=" + clientSecret);
		sb.append("&code=" + code);
		
		String requestParams = sb.toString();
		
		NaverTokenDto naverTokenDto = (NaverTokenDto) loginConnector.getAccessToken(tokenReqUrl, requestParams, new NaverTokenDto());
		
		return naverTokenDto;
	}
	
	public NaverMemberInfoDto getUserInfo(NaverTokenDto naverTokenDto) {
		String accessToken = naverTokenDto.getAccessToken();
		
		NaverMemberInfoDto naverMemberInfoDto = (NaverMemberInfoDto) loginConnector.getUserInfo(userInfoReqUrl, accessToken, "POST", new NaverMemberInfoDto());
		
		return naverMemberInfoDto;
	}

}
