package com.namweb.domain.google.email.service;

import org.springframework.stereotype.Service;

import com.namweb.domain.google.email.sender.GoogleEmailSender;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GoogleEmailService {

	private final GoogleEmailSender googleEmailSender;

	public int sendGoogleEmail(String email) {
		boolean emailCheck = googleEmailSender.emailCheck(email);
		if (emailCheck) return googleEmailSender.mailSend(email);
		return -1;
	}

}
