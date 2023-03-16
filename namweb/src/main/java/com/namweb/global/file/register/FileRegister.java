package com.namweb.global.file.register;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.namweb.domain.board.image.service.BoardImageService;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class FileRegister {
	
	private final BoardImageService boardImageService;
	
	public String randomFileName() {
		StringBuilder sb = new StringBuilder();
		
		Random random = new Random();
		
		for (int i=0;i<8;i++) {
			sb.append(random.nextInt(9) + 1);
		}
		
		return sb.toString();
	}

	public File insertFile(String root, MultipartFile file, String type) {
		File userRoot = new File(root);
		if (!userRoot.exists())
			userRoot.mkdirs();

		String originalFileName = file.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddhhmmss");
		String date = sdf.format(Calendar.getInstance().getTime());
		
		String delimiter = "";
		switch(type) {
		case "image" :
			delimiter = "_img_";
			break;
		case "file" :
			delimiter = "_fl_";
			break;
		default :
			delimiter = "_n_";
		}
		
		String fileName = date + delimiter + originalFileName;
		switch(type) {
		case "image" :
			fileName = date + delimiter + randomFileName() + ".png";
		}

		File uploadFile = new File(root + "\\" + fileName);
		
		try {
			file.transferTo(uploadFile);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return uploadFile;
	}

	public void deleteBoardImageFiles(int[] photoNumbers) {
		for(int photoNo : photoNumbers) {
			String photoPath = boardImageService.selectImagePath(photoNo);
			
			File deleteFile = new File(photoPath);
			
			deleteFile.delete();
		}
	}
	
}
