package com.namweb.domain.google.email.sender;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import com.namweb.global.constant.GoogleConstant;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class GoogleEmailSender {

	private final JavaMailSender mailSender;
	private String authNum;		// 랜덤 인증 코드
	
	public void createCode() {
		Random random = new Random();
		random.setSeed(System.currentTimeMillis());
		
		StringBuilder key = new StringBuilder(); 
		
		for(int i=0;i<8;i++) {
			key.append((char)((int)random.nextInt(26)+97));
		}
		
		authNum = key.toString();
	}
	
	public MimeMessage createEmailForm(String email, String title) throws MessagingException, UnsupportedEncodingException {
		createCode();
		String setFrom = GoogleConstant.GOOGLE_ID.getName();	// 보낸 host
		String toEmail = email;	// 받는 사람
		
		
		
		return null;
	}
	
}
