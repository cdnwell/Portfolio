package com.namweb.domain.kakao.login.oauth;

import org.springframework.stereotype.Component;

import com.namweb.domain.kakao.login.dto.KakaoMemberInfoDto;
import com.namweb.domain.kakao.login.dto.KakaoTokenDto;
import com.namweb.global.constant.KakaoConstant;
import com.namweb.global.login.LoginConnector;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class KakaoOAuth {
	private String tokenReqUrl = KakaoConstant.KAKAO_TOKEN_REQ_URL.getName();
	private String userInfoReqUrl = KakaoConstant.KAKAO_USER_INFO_REQ_URL.getName();
	private String apiKey = KakaoConstant.API_KEY.getName();
	private String redirectUrl = KakaoConstant.REDIRECT_URL.getName();

	private final LoginConnector loginConnector;

	public KakaoTokenDto getAccessToken(String code) {
		StringBuilder sb = new StringBuilder();

		sb.append("grant_type=authorization_code");
		sb.append("&client_id=" + apiKey);
		sb.append("&redirect_url=" + redirectUrl);
		sb.append("&code=" + code);

		String requestParams = sb.toString();

		KakaoTokenDto kakaoTokenDto = (KakaoTokenDto) loginConnector.getAccessToken(tokenReqUrl, requestParams,
				new KakaoTokenDto());

		return kakaoTokenDto;
	}

	public KakaoMemberInfoDto getUserInfo(KakaoTokenDto kakaoTokenDto) {
		String accessToken = kakaoTokenDto.getAccessToken();

		KakaoMemberInfoDto kakaoMemberInfoDto = (KakaoMemberInfoDto) loginConnector.getUserInfo(userInfoReqUrl,
				accessToken, "POST", new KakaoMemberInfoDto());
		
		return kakaoMemberInfoDto;
	}

}
