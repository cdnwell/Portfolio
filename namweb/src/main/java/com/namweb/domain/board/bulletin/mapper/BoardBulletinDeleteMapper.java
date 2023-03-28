package com.namweb.domain.board.bulletin.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.namweb.domain.board.bulletin.dto.ReplyDTO;

@Mapper
public interface BoardBulletinDeleteMapper {

	void deleteReply(int replyno);

	void deleteReplyLike(ReplyDTO replyDTO);

	void deleteReplyHate(ReplyDTO replyDTO);

}
