package com.namweb.domain.board.bulletin.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.namweb.domain.board.bulletin.dto.ReplyDTO;
import com.namweb.domain.board.bulletin.mapper.BoardBulletinInsertMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardBulletinInsertService {

	private final BoardBulletinInsertMapper boardBulletinInsertMapper;
	private final BoardBulletinService boardBulletinService;
	private final BoardBulletinDeleteService boardBulletinDeleteService;

	public void insertReply(ReplyDTO replyDTO, int mno) {
		replyDTO.setMno(mno);
		String replyContent = replyDTO.getContent().replace("\n", "<br><p></p>");
		replyDTO.setContent(replyContent);

		boardBulletinInsertMapper.insertReply(replyDTO);
	}

	public Map<String, String> insertReplyLike(ReplyDTO replyDTO, int mno) {
		Map<String, String> likeMap = new HashMap<>();
		String status = "status";
		
		replyDTO.setMno(mno);
		ReplyDTO replyHas = boardBulletinService.selectBoardReplyLikeHas(replyDTO);
		if (replyHas != null) {
			boardBulletinDeleteService.deleteReplyLike(replyDTO);
			likeMap.put(status, "LIKE_REPLY_DELETED");
			return likeMap;
		} else {
			replyHas = boardBulletinService.selectBoardReplyHateHas(replyDTO);
			if (replyHas == null) {
				boardBulletinInsertMapper.insertReplyLike(replyDTO);
				likeMap.put(status, "LIKE_REPLY_INSERTED");
				return likeMap;
			} else {
				likeMap.put(status, "HATE_REPLY_EXISTED");
				return likeMap;
			}
		}

	}

	public Map<String, String> insertReplyHate(ReplyDTO replyDTO, int mno) {
		Map<String, String> hateMap = new HashMap<>();
		String status = "status";
		
		replyDTO.setMno(mno);
		ReplyDTO replyHas = boardBulletinService.selectBoardReplyHateHas(replyDTO);
		if (replyHas != null) {
			boardBulletinDeleteService.deleteReplyHate(replyDTO);
			hateMap.put(status, "HATE_REPLY_DELETED");
			return hateMap;
		} else {
			replyHas = boardBulletinService.selectBoardReplyLikeHas(replyDTO);
			if (replyHas == null) {
				boardBulletinInsertMapper.insertReplyHate(replyDTO);
				hateMap.put(status, "HATE_REPLY_INSERTED");
				return hateMap;
			} else {
				hateMap.put(status, "LIKE_REPLY_EXISTED");
				return hateMap;
			}
		}
	}

}
