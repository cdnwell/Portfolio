package com.namweb.domain.board.bulletin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.namweb.domain.board.bulletin.dto.BoardDTO;
import com.namweb.domain.board.bulletin.mapper.BoardBulletinMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardBulletinService {

	private final BoardBulletinMapper boardBulletinMapper;

	public List<BoardDTO> selectBoardList(int pageNo) {
		int pageStartNo = pageNo*15;
		return boardBulletinMapper.selectBoardList(pageStartNo);		
	}

	public int selectBoardListCount() {
		return boardBulletinMapper.selectBoardListCount();
	}
	
}
