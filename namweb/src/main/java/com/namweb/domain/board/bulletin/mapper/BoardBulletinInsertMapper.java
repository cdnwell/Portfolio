package com.namweb.domain.board.bulletin.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.namweb.domain.board.bulletin.dto.ReplyDTO;

@Mapper
public interface BoardBulletinInsertMapper {

	void insertReply(ReplyDTO replyDTO);

}
