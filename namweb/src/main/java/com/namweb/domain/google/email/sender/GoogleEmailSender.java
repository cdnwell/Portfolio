package com.namweb.domain.google.email.sender;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;

import com.namweb.domain.google.email.exception.GoogleEmailException;
import com.namweb.domain.google.email.mailauth.MailAuth;
import com.namweb.domain.google.email.mapper.GoogleEmailMapper;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class GoogleEmailSender {

	private final GoogleEmailMapper googleEmailMapper;

	public int createRandom() {
		Random random = new Random(System.currentTimeMillis());

		int number = random.nextInt(900000) + 100000;

		return number;
	}

	public boolean emailCheck(String email) {
		try {
			String emailChecked = googleEmailMapper.selectEmailCheck(email);
			if(emailChecked == null) throw new Exception();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public int mailSend(String email) {
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587");

		Authenticator auth = new MailAuth();
		Session session = Session.getInstance(prop, auth);
		MimeMessage msg = new MimeMessage(session);

		int randomNumber = createRandom();

		String message = "";
		message += "안녕하세요.\n";
		message += "비밀번호 찾기 서비스입니다.\n";
		message += "인증 번호는 아래와 같습니다.\n";
		message += "인증 번호 : " + randomNumber + "\n";
		message += "비밀번호 찾기 페이지에 인증 번호를 입력해주시길 바랍니다.\n";

		try {
			msg.setSentDate(new Date());

			msg.setFrom(new InternetAddress("cdnwellhk@gmail.com", "Admin"));
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject("비밀번호 찾기 : 인증 번호", "UTF-8");
			msg.setText(message);

//			Transport.send(msg);

			return randomNumber;

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return -1;
	}

}
