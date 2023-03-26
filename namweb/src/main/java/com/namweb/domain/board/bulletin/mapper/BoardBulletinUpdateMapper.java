package com.namweb.domain.board.bulletin.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.namweb.domain.board.bulletin.dto.ReplyDTO;

@Mapper
public interface BoardBulletinUpdateMapper {

	void updateBoardView(int bno);

	void updateBoardReply(ReplyDTO replyDTO);

	void updateBoardReplyNotDelete(int replyno);

}
