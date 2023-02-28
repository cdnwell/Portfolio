package com.namweb.global.login.dto;

import java.util.Map;

import org.json.JSONObject;

public interface LoginDto {
	public String getRequestParams();
	public String getRequestURL();
	public String getUserInfoRequestURL();
	public Map<String, Object> getUserInfo(JSONObject response);
}
