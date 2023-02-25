package com.namweb.domain.naver.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

import org.json.JSONObject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.global.constant.NaverConstant;

@RestController
public class NaverLoginController {

	@GetMapping("/login/naverLogin")
	public String naverLogin(String code) {
		System.out.println("naver code : " + code);
		String access_token = getAccessToken(code);

		HashMap<String, Object> user_info = getUserInfo(access_token);

		for (String str : user_info.keySet()) {
			System.out.println(str + " : " + user_info.get(str));
		}

		return "naver login, success";
	}

	private String getAccessToken(String code) {
		String access_token = "";
		String req_url = "https://nid.naver.com/oauth2.0/token";
		String client_id = NaverConstant.CLIENT_ID.getName();
		String client_secret = NaverConstant.CLIENT_SECRET.getName();

		try {
			URL url = new URL(req_url);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();

			sb.append("grant_type=authorization_code");
			sb.append("&client_id=" + client_id);
			sb.append("&client_secret=" + client_secret);
			sb.append("&code=" + code);

			bw.write(sb.toString());
			bw.flush();

			int response_code = conn.getResponseCode();
			System.out.println("response code(naver) : " + response_code);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			System.out.println("response body(naver) : " + result);

			JSONObject jObject = new JSONObject(result);
			access_token = jObject.getString("access_token");

			System.out.println("access token(naver) : " + access_token);

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return access_token;

	}

	private HashMap<String, Object> getUserInfo(String access_token) {
		HashMap<String, Object> user_info = new HashMap<>();
		String req_url = "https://openapi.naver.com/v1/nid/me";
		String nickname = "";
		String email = "";

		try {
			URL url = new URL(req_url);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + access_token);

			int response_code = conn.getResponseCode();
			System.out.println("response code(naver) : " + response_code);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			JSONObject jObject = new JSONObject(result);
			JSONObject jResponse = jObject.getJSONObject("response");

			nickname = jResponse.getString("nickname");
			email = jResponse.getString("email");

			user_info.put("nickname", nickname);
			user_info.put("email", email);

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user_info;
	}

}
