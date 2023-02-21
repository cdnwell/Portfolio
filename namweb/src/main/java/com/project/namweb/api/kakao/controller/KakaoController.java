package com.project.namweb.api.kakao.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.namweb.constant.KakaoConstant;

@RestController
public class KakaoController {

	@GetMapping("/login/kakaoLoginIntro")
	public String kakaoLoginIntro() {
		String reqURL = "https://kauth.kakao.com/oauth/authorize";
		String restAPIKey = KakaoConstant.REST_API_KEY;

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();

			sb.append("client_id=" + restAPIKey);
			sb.append("&redirect_url=http://127.0.0.1:9997/kakaoLogin");
			sb.append("response_type=code");

			bw.write(sb.toString());
			bw.flush();

			int responseCode = conn.getResponseCode();
			System.out.println("response code : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			System.out.println("response body : " + result);
			
			return result;
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "connection, failed";
	}
	
	@GetMapping("/login/kakaoLogin")
	public String kakaoLogin(String code) {
		System.out.println(code);
		
		return "kakao login, success";
	}

}
