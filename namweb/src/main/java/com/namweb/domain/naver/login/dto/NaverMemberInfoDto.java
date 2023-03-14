package com.namweb.domain.naver.login.dto;

import org.apache.ibatis.type.Alias;
import org.json.JSONObject;

import com.namweb.global.login.dto.LoginUserInfoDto;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;

@Alias("nMember")
@Getter
@Setter
public class NaverMemberInfoDto implements LoginUserInfoDto {
	private String email;
	private String nick;
	@Setter(AccessLevel.NONE)
	private String response;

	@Override
	public void setResponse(String response) {
		JSONObject jsonResponse = new JSONObject(response);

		JSONObject jResponse = jsonResponse.getJSONObject("response");

		this.nick = jResponse.getString("nickname");
		this.email = jResponse.getString("email");
	}

}
