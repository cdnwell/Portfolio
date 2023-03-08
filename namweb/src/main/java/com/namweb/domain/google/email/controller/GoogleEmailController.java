package com.namweb.domain.google.email.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.google.email.service.GoogleEmailService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class GoogleEmailController {
	
	private final GoogleEmailService googleEmailService;
	
	@GetMapping("/login/find-email")
	public int googleEMailSender(String email) {
		return googleEmailService.sendGoogleEmail(email);
	}
}
