package com.namweb.domain.board.bulletin.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardBulletinDeleteMapper {

	void deleteReply(int replyno);

}
