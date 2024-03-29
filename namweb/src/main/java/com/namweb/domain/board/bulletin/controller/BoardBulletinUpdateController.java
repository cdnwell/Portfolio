package com.namweb.domain.board.bulletin.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.board.bulletin.dto.ReplyDTO;
import com.namweb.domain.board.bulletin.service.BoardBulletinUpdateService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class BoardBulletinUpdateController {

	private final BoardBulletinUpdateService boardBulletinUpdateService;
	
	@PutMapping("/board/bulletin/detail/{bno}")
	public void updateBoardView(@PathVariable("bno") int bno) {
		boardBulletinUpdateService.updateBoardView(bno);
	}
	
	@PutMapping("/board/bulletin/reply")
	public void updateBoardReply(@RequestBody ReplyDTO replyDTO) {
		boardBulletinUpdateService.updateBoardReply(replyDTO);
	}
	
}
