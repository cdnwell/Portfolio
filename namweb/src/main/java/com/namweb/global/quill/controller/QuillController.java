package com.namweb.global.quill.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.namweb.global.quill.dto.QuillBoardDto;
import com.namweb.global.quill.dto.QuillFileLinkDto;
import com.namweb.global.quill.dto.QuillImageLinkDto;
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
	
	@GetMapping("/quill/image/photoNo")
	public int quillSelectPhotoNo() {
		return quillService.selectBoardPhotoNo();
	}

	@PostMapping("/quill/setImage")
	public Map<String, Object> quillInsertImage(MultipartHttpServletRequest request) {
		int photoNo = quillService.selectBoardPhotoNo();
		String path = quillService.quillInsertImage(request, photoNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("photoNo", photoNo);
		map.put("url", path);
		
		return map;
	}
	
	@PostMapping("/quill/setFile")
	public int quillInsertFile(MultipartHttpServletRequest request) {
		int fileNo = quillService.selectBoardFileNo();
		MultipartFile file = request.getFile("file");
		String path = quillService.quillInsertFile(file, fileNo);
		return fileNo;
	}
	
//	@DeleteMapping("/quill/image")
//	public void quillDeleteImage(String photoNo) {
//		quillService.deleteNotUploadImage(photoNo);
//	}
	
	@PostMapping("/quill/image/link")
	public void quillUpdateImageNo(@RequestBody QuillImageLinkDto quillImageLinkDto) {
		quillService.updateImageNumLink(quillImageLinkDto);
	}
	
	@PostMapping("/quill/file/link")
	public void quillUpdateFileNum(@RequestBody QuillFileLinkDto quillFileLinkDto) {
		quillService.updateFileNumLink(quillFileLinkDto);
	}
	
	@PostMapping("/quill/board")
	public void quillInsertBoard(@RequestBody QuillBoardDto quillBoardDto) {
		System.out.println(quillBoardDto);
		quillService.insertBoard(quillBoardDto);
	}
	
}
