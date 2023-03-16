package com.namweb.global.quill.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import org.json.JSONObject;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.namweb.global.login.dto.CustomMultipartFile;
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
	public int quillInsertFile(MultipartFile file) {
		int fileNo = quillService.selectBoardFileNo();
		String path = quillService.quillInsertFile(file, fileNo);
		return fileNo;
	}
	
	@DeleteMapping("/quill/image")
	public boolean quillDeleteImage(String photoNo) {
		quillService.deleteNotUploadImage(photoNo);
		return true;
	}
	
	@PostMapping("/quill/image/link")
	public boolean quillUpdateImageNo(@RequestBody QuillImageLinkDto quillImageLinkDto) {
		quillService.updateImagaNoLink(quillImageLinkDto);
		return true;
	}
	
	@PostMapping("/quill/image/convert")
	public String quillConvertImage(MultipartHttpServletRequest request) {
		int photoNo = quillService.selectBoardPhotoNo();
		String path = quillService.quillInsertImage(request, photoNo);
		return path;
	}
	
}
