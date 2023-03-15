package com.namweb.global.quill.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.namweb.global.file.dto.FileDto;
import com.namweb.global.file.dto.FileImageDto;
import com.namweb.global.quill.dto.QuillImageLinkDto;

@Mapper
public interface QuillMapper {

	int selectBoardNo();

	int selectBoardPhotoNo();

	void insertQuillOnlyImage(FileImageDto fileImageDto);

	int selectBoardFileNo();

	void insertQuillOnlyFile(FileDto fileDto);

	void deleteNotUploadImage(int[] photoNumbers);

	void updateImageNoLink(HashMap<String, Object> map);

}
