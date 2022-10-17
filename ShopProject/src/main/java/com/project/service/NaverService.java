package com.project.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class NaverService {

	public String getAccessToken(String code) throws UnsupportedEncodingException {
		String clientId = "1gT6ptILkTkiIXDqGrGi";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "7d6iOETonj";// 애플리케이션 클라이언트 시크릿값";
		String redirectURI = URLEncoder.encode("http://127.0.0.1:9999/naverLogin.do", "UTF-8");
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		String access_token = "";
		String refresh_token = "";
		System.out.println("apiURL=" + apiURL);
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.println("responseCode=" + responseCode);
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if (responseCode == 200) {
				JSONObject object = new JSONObject(res.toString());
				access_token = object.getString("access_token");
				return access_token;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public HashMap<String, Object> getUserInfo(String token) {
		String header = "Bearer " + token; // Bearer 다음에 공백 추가
		String apiURL = "https://openapi.naver.com/v1/nid/me";
		InputStreamReader streamReader = null;
		HashMap<String, Object> result = new HashMap<>();
		HttpURLConnection con = null;

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("Authorization", header);

		try {

			URL url = new URL(apiURL);

			con = (HttpURLConnection) url.openConnection();

			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header_one : requestHeaders.entrySet()) {
				con.setRequestProperty(header_one.getKey(), header_one.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				streamReader = new InputStreamReader(con.getInputStream());
			} else { // 에러 발생
				streamReader = new InputStreamReader(con.getErrorStream());
			}

			try (BufferedReader lineReader = new BufferedReader(streamReader)) {
				StringBuilder responseBody = new StringBuilder();

				String line;
				while ((line = lineReader.readLine()) != null) {
					responseBody.append(line);
				}

				System.out.println("responseBody : " + responseBody.toString());

				JSONObject json = new JSONObject(responseBody.toString());
				JSONObject response = json.getJSONObject("response");
				String id = response.getString("id");
				String nickname = response.getString("nickname");
				String email = response.getString("email");
				System.out.println("id : " + id + "\n" + "nickname : " + nickname + "\n" + "email : " + email);

				result.put("nickname", nickname);
				result.put("email", email);

				return result;
			} catch (IOException e) {
				throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
			}

		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiURL, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiURL, e);
		} finally {
			if (con != null)
				con.disconnect();
		}

	}

}
