package com.namweb.domain.kakao.login.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.kakao.login.service.KakaoLoginService;
import com.namweb.global.constant.KakaoConstant;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class KakaoLoginController {
	
	private final KakaoLoginService kakaoLoginService;

	@PostMapping("/login/kakaoLogin")
	public Map<String, Object> kakaoLogin(String code) {
//		System.out.println(code);
//		String access_token = getAccessToken(code);
		
		Map<String, Object> userInfo = kakaoLoginService.kakaoLogin(code);
		
		return userInfo;
	}
	
	private HashMap<String, Object> getUserInfo(String access_token) {
		HashMap<String, Object> user_info = new HashMap<>();
		String req_url = "https://kapi.kakao.com/v2/user/me";
		String nickname = "";
		String email = "";
		JSONObject properties = null;
		JSONObject kakao_account = null;
		
		try {
			URL url = new URL(req_url);
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + access_token);
			
			int response_code = conn.getResponseCode();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine())!= null) {
				result += line;
			}
			
			JSONObject jObject = new JSONObject(result);
			
			properties = jObject.getJSONObject("properties");
			kakao_account = jObject.getJSONObject("kakao_account");
			
			nickname = properties.getString("nickname");
			email = kakao_account.getString("email");
			
			user_info.put("nickname", nickname);
			user_info.put("email", email);
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}

	private String getAccessToken(String authorize_code) {
		String access_token = "";
		String req_url = "https://kauth.kakao.com/oauth/token";
		

		try {
			URL url = new URL(req_url);
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			
			sb.append("grant_type=authorization_code");
//			sb.append("&client_id="+rest_api_key);
//			sb.append("&redirect_url="+redirect_url);
			sb.append("&code="+authorize_code);
			
			bw.write(sb.toString());
			bw.flush();
			
			int response_code = conn.getResponseCode();
			System.out.println("response code : " + response_code);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			System.out.println("response body : "+result);
			
			JSONObject jObject = new JSONObject(result);
			access_token = jObject.getString("access_token");
			
			System.out.println("access token : " + access_token);
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return access_token;
	}

}
