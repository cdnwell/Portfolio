package com.namweb.domain.board.bulletin.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardBulletinUpdateMapper {

	void updateBoardView(int bno);

}
