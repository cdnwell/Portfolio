package com.namweb.domain.board.bulletin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.namweb.domain.board.bulletin.dto.BoardDTO;

@Mapper
public interface BoardBulletinMapper {

	List<BoardDTO> selectBoardList(int pageNo);

	int selectBoardListCount();

}
