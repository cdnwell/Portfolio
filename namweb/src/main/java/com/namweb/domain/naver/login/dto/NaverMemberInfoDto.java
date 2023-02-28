package com.namweb.domain.naver.login.dto;

import org.apache.ibatis.type.Alias;
import org.json.JSONObject;

import com.namweb.global.login.dto.LoginUserInfoDto;

@Alias("nMember")
public class NaverMemberInfoDto implements LoginUserInfoDto {
	private String email;
	private String nick;
	private String response;

	@Override
	public String getResponse() {
		return response;
	}

	@Override
	public void setResponse(String response) {
		JSONObject jsonResponse = new JSONObject(response);

		JSONObject jResponse = jsonResponse.getJSONObject("response");

		this.nick = jResponse.getString("nickname");
		this.email = jResponse.getString("email");
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

}
