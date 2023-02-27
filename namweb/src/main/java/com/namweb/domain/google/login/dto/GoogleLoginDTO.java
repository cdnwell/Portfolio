package com.namweb.domain.google.login.dto;

import com.namweb.global.constant.GoogleConstant;
import com.namweb.global.http.LoginDTOInt;

public class GoogleLoginDTO implements LoginDTOInt {
	private String code;
	private String req_url = GoogleConstant.GOOGLE_TOKEN_REQ_URL.getName();
	private String client_id = GoogleConstant.CLIENT_ID.getName();
	private String client_secret = GoogleConstant.CLIENT_PW.getName();
	private String redirect_uri = GoogleConstant.REDIRECT_URI.getName();

	public GoogleLoginDTO(String code) {
		this.code = code;
	}
	
	@Override
	public String getRequestParams() {
		StringBuilder sb = new StringBuilder();
		
		sb.append("code=" + code);
		sb.append("&client_id=" + client_id);
		sb.append("&client_secret=" + client_secret);
		sb.append("&redirect_uri=" + redirect_uri);
		sb.append("&grant_type=authorization_code");
		
		return sb.toString();
	}
	
	@Override
	public String getRequestURL() {
		return req_url;
	}
	
}
