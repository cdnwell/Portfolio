package com.namweb.domain.kakao.login.dto;

import org.apache.ibatis.type.Alias;
import org.json.JSONObject;

import com.namweb.global.login.dto.LoginUserInfoDto;

@Alias("kMember")
public class KakaoMemberInfoDto implements LoginUserInfoDto {
	private String email;
	private String nickname;
	private String response;

	@Override
	public String getResponse() {
		return response;
	}

	@Override
	public void setResponse(String response) {
		JSONObject jsonResponse = new JSONObject(response);

		JSONObject properties = jsonResponse.getJSONObject("properties");
		JSONObject kakao_account = jsonResponse.getJSONObject("kakao_account");

		this.nickname = properties.getString("nickname");
		this.email = kakao_account.getString("email");
		this.response = response;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

}
