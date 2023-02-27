package com.namweb.domain.google.login.controller;

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

import org.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.namweb.domain.google.login.dto.GoogleLoginDTO;
import com.namweb.domain.google.login.service.GoogleLoginService;
import com.namweb.global.constant.GoogleConstant;
import com.namweb.global.http.LoginConnector;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class GoogleLoginController {
	
	private final GoogleLoginService googleLoginService;

	@PostMapping("/login/googleLogin")
	public String googleLogin(String code){
//		System.out.println("code : " + data);
//		JSONObject jObject = new JSONObject(data);
//		String code = jObject.getString("code");
		System.out.println("changed code : "+code);
//		ResponseEntity<String> access_token = getAccessToken(code);
//		String access_token = getAccessToken(code);
		
		String access_token = googleLoginService.googleLogin(code);
		
		System.out.println("access_token(success) : " + access_token);
		
		return "google login, success";
	}

	private String getAccessToken(String code) {
		String access_token = "";
		String req_url = "https://oauth2.googleapis.com/token";
		String client_id = GoogleConstant.CLIENT_ID.getName();
		String client_secret = GoogleConstant.CLIENT_PW.getName();
		String redirect_uri = GoogleConstant.REDIRECT_URI.getName();

		try {
			URL url = new URL(req_url);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();

			sb.append("code=" + code);
			sb.append("&client_id=" + client_id);
			sb.append("&client_secret=" + client_secret);
			sb.append("&redirect_uri=" + redirect_uri);
			sb.append("&grant_type=authorization_code");

			bw.write(sb.toString());
			bw.flush();
			
			int response_code = conn.getResponseCode();
			System.out.println("response code(google) : " + response_code);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			System.out.println("response body(google) : " + result);

			JSONObject jObject = new JSONObject(result);
			access_token = jObject.getString("access_token");

			System.out.println("access token(google) : " + access_token);

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return access_token;
	}
	
	private ResponseEntity<String> getAccessTokenTmp(String code) {
		String req_url = "https://oauth2.googleapis.com/token";
		String client_id = GoogleConstant.CLIENT_ID.getName();
		String client_secret = GoogleConstant.CLIENT_PW.getName();
		String redirect_uri = GoogleConstant.REDIRECT_URI.getName();
		
		RestTemplate restTemplate = new RestTemplate();
		Map<String, Object> params = new HashMap<>();
		params.put("code", code);
		params.put("client_id", client_id);
		params.put("client_secret", client_secret);
		params.put("redirect_uri", redirect_uri);
		params.put("grant_type", "authorization_code");
		
		System.out.println("login");
		ResponseEntity<String> responseEntity = restTemplate.postForEntity(req_url, params, String.class);
		System.out.println("login pass");
		
		System.out.println(responseEntity.getBody());
		
		return null;
	}

}
