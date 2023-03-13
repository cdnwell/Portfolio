package com.namweb.global.quill.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.namweb.global.file.dto.FileImageDto;

@Mapper
public interface QuillMapper {

	int selectBoardNo();

	int selectBoardPhotoNo();

	void insertQuillOnlyImage(FileImageDto fileImageDto);

}
