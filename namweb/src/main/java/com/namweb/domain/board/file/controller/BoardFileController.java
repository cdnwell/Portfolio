package com.namweb.domain.board.file.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.board.file.service.BoardFileService;
import com.namweb.global.file.dto.FileDto;

import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class BoardFileController {
	
	private final BoardFileService boardFileService; 

	@GetMapping("/namweb/board/fileDown")
	public void boardFileDown(int bno, HttpServletResponse response) throws IOException {
		String path = boardFileService.selectFilePath(bno);
		
		File file = new File(path);
		
		response.setHeader("Content-Disposition", "attachement;fileName="+file.getName());
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setContentLength((int) file.length());
		
		FileInputStream fis = new FileInputStream(file);
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		
		byte[] buffer = new byte[1024 * 1024];
		
		while(true) {
			int size = fis.read(buffer);
			if(size == -1) break;
			bos.write(buffer, 0, size);
			bos.flush();
		}
 		
		bos.close();
		fis.close();
	}
	
	@GetMapping("/namweb/board/file")
	public FileDto selectBoardFile(int bno) {
		return boardFileService.selectBoardFile(bno);
	}
	
}
