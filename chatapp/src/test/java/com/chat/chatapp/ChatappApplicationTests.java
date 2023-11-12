package com.chat.chatapp;

import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Base64;

@SpringBootTest
class ChatappApplicationTests {

	@Test
	void encodeSecretKeyStr() {
		String str = "secretkey512";

		try {
			// SHA-512 알고리즘으로 MessageDigest 객체 생성
			MessageDigest diges = MessageDigest.getInstance("SHA-512");

			// 문자열을 바이트 배열로 변환
			byte[] inputBytes = str.getBytes(StandardCharsets.UTF_8);

			// 해시값 계산
			byte[] hashBytes = diges.digest(inputBytes);

			// 바이트 배열을 16진수 문자열로 변환
			StringBuilder hexString = new StringBuilder();
			for (byte b : hashBytes) {
				String hex = Integer.toHexString(0xff & b);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}

			System.out.println("Hashed String (SHA-512): " + hexString.toString());

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}

}
