package com.namweb.domain.google.login.dto;

import org.apache.ibatis.type.Alias;
import org.json.JSONObject;

import com.namweb.global.login.dto.LoginUserInfoDto;

@Alias("gMember")
public class GoogleMemberInfoDto implements LoginUserInfoDto {
	public String email;
	public String name;
	public String response;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getResponse() {
		return response;
	}

	public void setResponse(String response) {
		JSONObject jsonResponse = new JSONObject(response);

		String name = jsonResponse.getString("name");
		String email = jsonResponse.getString("email");

		this.name = name;
		this.email = email;
		this.response = response;
	}

}
