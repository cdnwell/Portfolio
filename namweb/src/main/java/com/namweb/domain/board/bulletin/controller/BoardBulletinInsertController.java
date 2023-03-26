package com.namweb.domain.board.bulletin.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.board.bulletin.dto.ReplyDTO;
import com.namweb.domain.board.bulletin.service.BoardBulletinInsertService;
import com.namweb.domain.board.bulletin.service.BoardBulletinService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class BoardBulletinInsertController {

	private final BoardBulletinInsertService boardBulletinInsertService;
	private final BoardBulletinService boardBulletinService;
	
	@PostMapping("/board/bulletin/reply")
	public void insertReply(@RequestBody ReplyDTO replyDTO) {
		int mno = boardBulletinService.selectMemberNo(replyDTO.getEmail());
		boardBulletinInsertService.insertReply(replyDTO, mno);
	}
	
}
