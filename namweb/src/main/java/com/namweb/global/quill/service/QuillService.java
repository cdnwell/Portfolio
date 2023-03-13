package com.namweb.global.quill.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.namweb.global.file.dto.FileImageDto;
import com.namweb.global.quill.mapper.QuillMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QuillService {

	private final QuillMapper quillMapper;

	public int selectBoardNo() {
		return quillMapper.selectBoardNo();
	}

	public int selectBoardPhotoNo() {
		return quillMapper.selectBoardPhotoNo();
	}

	public String quillInsertImage(MultipartHttpServletRequest request, int pNo) {
		String root = "c:\\namweb\\image\\";
		File userRoot = new File(root);
		if (!userRoot.exists())
			userRoot.mkdirs();

		// 이미지 불러오기
		MultipartFile file = request.getFiles("image").get(0);

		String originalFileName = file.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddhhmmss");
		String date = sdf.format(Calendar.getInstance().getTime());
		String fileName = date + "fn" + originalFileName;

		if (file.getSize() == 0)
			return "no image";

		File uploadFile = new File(root + "\\" + fileName);
		quillMapper.insertQuillOnlyImage(new FileImageDto(uploadFile, pNo));

		try {
			file.transferTo(uploadFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		// 이미지의 절대경로 반환
		return uploadFile.getAbsolutePath();
	}

}
