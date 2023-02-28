package com.namweb.domain.kakao.login.dto;

import org.json.JSONObject;

import com.namweb.global.login.dto.LoginTokenDto;

public class KakaoTokenDto implements LoginTokenDto {
	private String accessToken;
	private String response;

	@Override
	public String getResponse() {
		return response;
	}

	@Override
	public void setResponse(String response) {
		JSONObject jsonResponse = new JSONObject(response);

		this.accessToken = jsonResponse.getString("access_token");
		this.response = response;
	}

	@Override
	public String getAccessToken() {
		return accessToken;
	}

}
