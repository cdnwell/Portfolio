package com.namweb.domain.board.bulletin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.namweb.domain.board.bulletin.dto.BoardDTO;

@Mapper
public interface BoardBulletinMapper {

	List<BoardDTO> selectBoardList(Map<String, Object> map);

	int selectBoardListCount(Map<String, Object> map);

	BoardDTO selectBoardDetail(int bno);

}
