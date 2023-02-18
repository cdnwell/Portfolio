package com.project.namweb.controller;

import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloContorller {

	@RequestMapping("/api/hello")
	public String main() {
		return "Hello, api!";
	}

	@PostMapping("/submit")
	public String submit(@RequestBody String json) throws JSONException {
		System.out.println(json);
		JSONObject jObject = new JSONObject(json);
		String name = jObject.getString("name");
		String phone = jObject.getString("phone");
		String content = jObject.getString("content");
		String address = jObject.getString("address");
		double latitude = jObject.getDouble("latitude");
		double longitude = jObject.getDouble("longitude");

		System.out.println("name : " + name);
		System.out.println("phone : " + phone);
		System.out.println("content : " + content);
		System.out.println("latitude : " + latitude);
		System.out.println("longitude : " + longitude);
		System.out.println("address : " + address);
		
		return "submit, complete";
	}

}
