package com.namweb.domain.board.bulletin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.namweb.domain.board.bulletin.dto.BoardDTO;
import com.namweb.domain.board.bulletin.dto.ReplyDTO;
import com.namweb.domain.board.bulletin.mapper.BoardBulletinMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardBulletinService {

	private final BoardBulletinMapper boardBulletinMapper;

	public List<BoardDTO> selectBoardList(int pageNo, String search, int category) {
		Map<String, Object> map = new HashMap<>();
		int pageStartNo = pageNo*15;
		
		map.put("pageStartNo", pageStartNo);
		map.put("search", search);
		map.put("category", category);
		
		return boardBulletinMapper.selectBoardList(map);
	}

	public int selectBoardListCount(String search, int category) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("search", search);
		map.put("category", category);
		
		return boardBulletinMapper.selectBoardListCount(map);
	}

	public BoardDTO selectBoardDetail(int bno) {
		return boardBulletinMapper.selectBoardDetail(bno);
	}

	public List<ReplyDTO> selectBoardReply(int bno) {
		return boardBulletinMapper.selectBoardReply(bno);
	}
	
	public int selectMemberNo(String email) {
		return boardBulletinMapper.selectMemberNo(email);
	}

	public int selectBoardReplyNum(int bno) {
		return boardBulletinMapper.selectBoardReplyNum(bno);
	}
	
	public boolean selectBoardReplyHasReply(int bno) {
		int result = boardBulletinMapper.selectBoardReplyHasReply(bno);
		return result > 0;
	}

}
