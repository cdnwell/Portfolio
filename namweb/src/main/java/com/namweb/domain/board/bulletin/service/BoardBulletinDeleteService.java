package com.namweb.domain.board.bulletin.service;

import org.springframework.stereotype.Service;

import com.namweb.domain.board.bulletin.dto.ReplyDTO;
import com.namweb.domain.board.bulletin.mapper.BoardBulletinDeleteMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardBulletinDeleteService {

	private final BoardBulletinDeleteMapper boardBulletinDeleteMapper;
	private final BoardBulletinService boardBulletinService;
	private final BoardBulletinUpdateService boardBulletinUpdateService;

	public void deleteReply(int replyno) {
		boolean isReplyHasReply = boardBulletinService.selectBoardReplyHasReply(replyno);
		if(isReplyHasReply) {
			boardBulletinUpdateService.updateBoardReplyNotDelete(replyno);
		} else {
			boardBulletinDeleteMapper.deleteReply(replyno);
		}
	}

	public void deleteReplyLike(ReplyDTO replyDTO) {
		boardBulletinDeleteMapper.deleteReplyLike(replyDTO);
	}

	public void deleteReplyHate(ReplyDTO replyDTO) {
		boardBulletinDeleteMapper.deleteReplyHate(replyDTO);
	}
	
}
