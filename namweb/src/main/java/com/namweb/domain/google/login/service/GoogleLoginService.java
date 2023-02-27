package com.namweb.domain.google.login.service;

import org.springframework.stereotype.Service;

import com.namweb.domain.google.login.dto.GoogleLoginDTO;
import com.namweb.global.http.LoginConnector;

import lombok.RequiredArgsConstructor;

@Service
public class GoogleLoginService {
	private LoginConnector loginConnector = new LoginConnector();
	
	public String googleLogin(String code) {
		
		GoogleLoginDTO googleLoginDTO = new GoogleLoginDTO(code);
		String access_token = loginConnector.getAccessToken(googleLoginDTO);
		
		return access_token;
	}
	
}
