package com.namweb.domain.google.login.oauth;

import org.springframework.stereotype.Component;

import com.namweb.domain.google.login.dto.GoogleTokenDto;
import com.namweb.domain.google.login.dto.GoogleMemberInfoDto;
import com.namweb.global.constant.GoogleConstant;
import com.namweb.global.login.LoginConnector;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class GoogleOAuth {
	private String reqUrl = GoogleConstant.GOOGLE_TOKEN_REQ_URL.getName();
	private String userInfoReqUrl = GoogleConstant.GOOGLE_USER_INFO_REQ_URL.getName();
	private String clientId = GoogleConstant.CLIENT_ID.getName();
	private String clientSecret = GoogleConstant.CLIENT_PW.getName();
	private String redirectUri = GoogleConstant.REDIRECT_URI.getName();

	private final LoginConnector loginConnector;

	public GoogleTokenDto getAccessToken(String code) {
		StringBuilder sb = new StringBuilder();

		sb.append("code=" + code);
		sb.append("&client_id=" + clientId);
		sb.append("&client_secret=" + clientSecret);
		sb.append("&redirect_uri=" + redirectUri);
		sb.append("&grant_type=authorization_code");

		String requestParams = sb.toString();

//		GoogleTokenDto googleTokenDto = (GoogleTokenDto) loginConnector.getAccessToken(reqUrl, requestParams,
//				new GoogleTokenDto());
		GoogleTokenDto googleTokenDto = (GoogleTokenDto) loginConnector.getAccessTokenRt(reqUrl, requestParams,
				new GoogleTokenDto());

		return googleTokenDto;
	}

	public GoogleMemberInfoDto getUserInfo(GoogleTokenDto googleTokenDto) {
		String accessToken = googleTokenDto.getAccessToken();
		
		GoogleMemberInfoDto googleMemberInfoDto = (GoogleMemberInfoDto) loginConnector.getUserInfo(
				userInfoReqUrl, accessToken, "GET", new GoogleMemberInfoDto());
		
		return googleMemberInfoDto;
	}

}
