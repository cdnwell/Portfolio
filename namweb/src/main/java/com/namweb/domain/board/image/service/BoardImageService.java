package com.namweb.domain.board.image.service;

import org.springframework.stereotype.Service;

import com.namweb.domain.board.image.mapper.BoardImageMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardImageService {

	private final BoardImageMapper boardImageMapper;

	public String selectImagePath(String photoNo) {
		return boardImageMapper.selectImagePath(photoNo);
	}
	
}
