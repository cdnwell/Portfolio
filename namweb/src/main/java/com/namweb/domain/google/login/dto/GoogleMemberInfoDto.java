package com.namweb.domain.google.login.dto;

import org.apache.ibatis.type.Alias;
import org.json.JSONObject;

import com.namweb.global.login.dto.LoginUserInfoDto;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;

@Alias("gMember")
@Getter
@Setter
public class GoogleMemberInfoDto implements LoginUserInfoDto {
	public String email;
	public String name;
	@Setter(AccessLevel.NONE)
	public String response;

	public void setResponse(String response) {
		JSONObject jsonResponse = new JSONObject(response);

		String name = jsonResponse.getString("name");
		String email = jsonResponse.getString("email");

		this.name = name;
		this.email = email;
		this.response = response;
	}

}
