package com.namweb.domain.board.bulletin.controller;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.board.bulletin.service.BoardBulletinDeleteService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class BoardBulletinDeleteController {

	private final BoardBulletinDeleteService boardBulletinDeleteService;
	
	@DeleteMapping("/board/bulletin/reply")
	public void deleteReply(int replyno) {
		boardBulletinDeleteService.deleteReply(replyno);
	}
	
}
