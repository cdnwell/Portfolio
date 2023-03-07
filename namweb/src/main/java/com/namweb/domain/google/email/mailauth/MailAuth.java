package com.namweb.domain.google.email.mailauth;

import javax.mail.PasswordAuthentication;

import com.namweb.global.constant.GoogleConstant;

import javax.mail.Authenticator;

public class MailAuth extends Authenticator{
	
	PasswordAuthentication pa;
	
	public MailAuth() {
		String mailId = GoogleConstant.GOOGLE_EMAIL_ID.getName();
		String mailPw = GoogleConstant.GOOGLE_EMAIL_PW.getName();
		
		pa = new PasswordAuthentication(mailId, mailPw);
	}

	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}

}
