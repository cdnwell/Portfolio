package com.namweb.domain.board.bulletin.service;

import org.springframework.stereotype.Service;

import com.namweb.domain.board.bulletin.dto.ReplyDTO;
import com.namweb.domain.board.bulletin.mapper.BoardBulletinUpdateMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardBulletinUpdateService {
	
	private final BoardBulletinUpdateMapper boardBulletinUpdateMapper;
	
	public void updateBoardView(int bno) {
		boardBulletinUpdateMapper.updateBoardView(bno);
	}

	public void updateBoardReply(ReplyDTO replyDTO) {
		String replyContent = replyDTO.getContent().replace("\n", "<br><p></p>");
		replyDTO.setContent(replyContent);
		boardBulletinUpdateMapper.updateBoardReply(replyDTO);
	}

	public void updateBoardReplyNotDelete(int replyno) {
		boardBulletinUpdateMapper.updateBoardReplyNotDelete(replyno);
	}

}
