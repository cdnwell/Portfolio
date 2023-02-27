package com.namweb.global.http;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

import org.json.JSONObject;

import com.namweb.domain.google.login.dto.GoogleLoginDTO;

public class LoginConnector {

	public String getAccessToken(LoginDTOInt loginDTO) {

		String access_token = "";
//		String req_url = "https://oauth2.googleapis.com/token";
//		String client_id = GoogleConstant.CLIENT_ID.getName();
//		String client_secret = GoogleConstant.CLIENT_PW.getName();
//		String redirect_uri = GoogleConstant.REDIRECT_URI.getName();
		String req_params = loginDTO.getRequestParams();
		String req_url = loginDTO.getRequestURL();

		try {
			URL url = new URL(req_url);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
//			StringBuilder sb = new StringBuilder();

//			sb.append("code=" + code);
//			sb.append("&client_id=" + client_id);
//			sb.append("&client_secret=" + client_secret);
//			sb.append("&redirect_uri=" + redirect_uri);
//			sb.append("&grant_type=authorization_code");

			bw.write(req_params);
			bw.flush();

			int response_code = conn.getResponseCode();
			System.out.println("response code : " + response_code);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			System.out.println("response body : " + result);

			JSONObject jObject = new JSONObject(result);
			access_token = jObject.getString("access_token");

			System.out.println("access token : " + access_token);

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

}
