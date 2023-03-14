package com.namweb.domain.kakao.login.dto;

import org.apache.ibatis.type.Alias;
import org.json.JSONObject;

import com.namweb.global.login.dto.LoginUserInfoDto;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;

@Alias("kMember")
@Getter
@Setter
public class KakaoMemberInfoDto implements LoginUserInfoDto {
	private String email;
	private String nick;
	@Setter(AccessLevel.NONE)
	private String response;

	@Override
	public void setResponse(String response) {
		JSONObject jsonResponse = new JSONObject(response);

		JSONObject properties = jsonResponse.getJSONObject("properties");
		JSONObject kakao_account = jsonResponse.getJSONObject("kakao_account");

		this.nick = properties.getString("nickname");
		this.email = kakao_account.getString("email");
		this.response = response;
	}

}
