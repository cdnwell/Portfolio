package com.namweb.domain.submit.controller;

import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.submit.dto.SubmitDTO;
import com.namweb.domain.submit.service.SubmitService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class SubmitController {
	private final SubmitService submitService;

	@PostMapping("/submit")
	public String submit(@RequestBody SubmitDTO submitDTO) throws JSONException {
		System.out.println(submitDTO);

		int count = submitService.insertBookWait(submitDTO);

		if(count != 0) {
			return "Submit, complete";
		} else {
			return "Submit, fail";
		}
	}

}
