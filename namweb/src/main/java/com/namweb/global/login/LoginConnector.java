package com.namweb.global.login;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.namweb.global.login.dto.LoginTokenDto;
import com.namweb.global.login.dto.LoginUserInfoDto;

@Component
public class LoginConnector {

	public LoginTokenDto getAccessToken(String reqUrl, String reqParams, LoginTokenDto loginTokenDto) {
		try {
			URL url = new URL(reqUrl);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

			bw.write(reqParams);
			bw.flush();

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			StringBuilder result = new StringBuilder();

			while ((line = br.readLine()) != null) {
				result.append(line);
			}

			String response = result.toString();

			loginTokenDto.setResponse(response);

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (ProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return loginTokenDto;
	}

	public LoginTokenDto getAccessTokenRt(String reqUrl, String reqParams, LoginTokenDto loginTokenDto) {
		RestTemplate rt = new RestTemplate();
		
		HttpHeaders header = new HttpHeaders(); 
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		
		String[] params = reqParams.split("&");
		
		for(String param : params) {
			String key = param.split("=")[0];
			String value = param.split("=")[1];
			
			body.add(key, value);
		}
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, header);
		
		ResponseEntity<String> response = rt.exchange(reqUrl, HttpMethod.POST, entity, String.class);
		
		loginTokenDto.setResponse(response.getBody());
		
		return loginTokenDto;
	}

	public LoginUserInfoDto getUserInfo(String reqUrl, String accessToken, String method,
			LoginUserInfoDto loginUserInfoDto) {
		try {
			URL url = new URL(reqUrl);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod(method);
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			StringBuilder result = new StringBuilder();

			while ((line = br.readLine()) != null) {
				result.append(line);
			}

			String response = result.toString();

			loginUserInfoDto.setResponse(response);

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return loginUserInfoDto;
	}

}
