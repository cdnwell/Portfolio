package com.project.namweb.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloContorller {

	@RequestMapping("/api/hello")
	public String main() {
		return "Hello, api!";
	}
	
}
