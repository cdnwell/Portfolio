package com.namweb.global.quill.service;

import java.io.File;
import java.util.Arrays;
import java.util.HashMap;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.namweb.global.file.dto.FileDto;
import com.namweb.global.file.dto.FileImageDto;
import com.namweb.global.file.register.FileRegister;
import com.namweb.global.quill.dto.QuillBoardDto;
import com.namweb.global.quill.dto.QuillFileLinkDto;
import com.namweb.global.quill.dto.QuillImageLinkDto;
import com.namweb.global.quill.mapper.QuillMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QuillService {

	private final QuillMapper quillMapper;
	private final FileRegister fileRegister;

	public int selectBoardNo() {
		return quillMapper.selectBoardNo();
	}

	public int selectBoardPhotoNo() {
		return quillMapper.selectBoardPhotoNo();
	}

	public int selectBoardFileNo() {
		return quillMapper.selectBoardFileNo();
	}

	public String quillInsertImage(MultipartHttpServletRequest request, int pNo) {
		String root = "c:\\namweb\\image\\";
		MultipartFile file = request.getFiles("image").get(0);
		File uploadFile = fileRegister.insertFile(root, file, "image");
		quillMapper.insertQuillOnlyImage(new FileImageDto(uploadFile, pNo));
		
		return uploadFile.getAbsolutePath();
	}

	public String quillInsertFile(MultipartFile file, int fileNo) {
		String root = "c:\\namweb\\file\\";
		File uploadFile = fileRegister.insertFile(root, file, "file");
		quillMapper.insertQuillOnlyFile(new FileDto(uploadFile, fileNo));

		return uploadFile.getAbsolutePath();
	}

	public void updateImageNoLink(QuillImageLinkDto quillImageLinkDto) {
		quillMapper.updateImageNoLink(quillImageLinkDto);
	}

	public void updateFileNoLink(QuillFileLinkDto quillFileLinkDto) {
		quillMapper.updateFileNoLink(quillFileLinkDto);
	}

	public void insertBoard(QuillBoardDto quillBoardDto) {
		quillMapper.insertBoard(quillBoardDto);
	}

}
