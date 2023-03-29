package com.namweb.domain.board.file.service;

import org.springframework.stereotype.Service;

import com.namweb.domain.board.file.mapper.BoardFileMapper;
import com.namweb.global.file.dto.FileDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardFileService {
	
	private final BoardFileMapper boardFileMapper;
	
	public String selectFilePath(int bno) {
		return boardFileMapper.selectFilePath(bno);
	}

	public FileDto selectBoardFile(int bno) {
		return boardFileMapper.selectBoardFile(bno);
	}

}
