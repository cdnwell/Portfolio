package com.namweb.domain.google.email.sender;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;

import com.namweb.domain.google.email.mailauth.MailAuth;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class GoogleEmailSender {
	
	public void mailSend() {
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587");
		
		Authenticator auth = new MailAuth();
		
		Session session = Session.getInstance(prop, auth);
		
		MimeMessage msg = new MimeMessage(session);
		
		try {
			msg.setSentDate(new Date());
			
			msg.setFrom(new InternetAddress("cdnwellhk@gmail.com", "VISITOR"));
			InternetAddress to = new InternetAddress("heshah@naver.com");
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject("cdnwell에서 보내는 이메일입니다.", "UTF-8");
			msg.setText("테스트 메일입니다.\nGoogle Email.");
			
			Transport.send(msg);
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}
