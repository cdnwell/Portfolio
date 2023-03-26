package com.namweb.domain.board.bulletin.service;

import org.springframework.stereotype.Service;

import com.namweb.domain.board.bulletin.dto.ReplyDTO;
import com.namweb.domain.board.bulletin.mapper.BoardBulletinInsertMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardBulletinInsertService {
	
	private final BoardBulletinInsertMapper boardBulletinInsertMapper;

	public void insertReply(ReplyDTO replyDTO, int mno) {
		replyDTO.setMno(mno);
		String replyContent = replyDTO.getContent().replace("\n", "<br><p></p>");
		replyDTO.setContent(replyContent);
		boardBulletinInsertMapper.insertReply(replyDTO);
	}

}
