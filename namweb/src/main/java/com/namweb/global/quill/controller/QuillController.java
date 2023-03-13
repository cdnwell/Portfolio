package com.namweb.global.quill.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.namweb.global.quill.service.QuillService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class QuillController {
	
	private final QuillService quillService;
	
	@GetMapping("/quill/bno")
	public int selectBoardNo() {
		return quillService.selectBoardNo();
	}

	@PostMapping("/quill/setImage")
	public Map<String, Object> quillInsertImage(MultipartHttpServletRequest request) {
		int photoNo = quillService.selectBoardPhotoNo();
		String url = quillService.quillInsertImage(request, photoNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("photoNo", photoNo);
		map.put("url", url);
		
		return map;
		
	}
	
}
