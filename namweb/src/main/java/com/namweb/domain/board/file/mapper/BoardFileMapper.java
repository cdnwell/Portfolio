package com.namweb.domain.board.file.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.namweb.global.file.dto.FileDto;

@Mapper
public interface BoardFileMapper {

	public String selectFilePath(int bno);

	public FileDto selectBoardFile(int bno);

}
