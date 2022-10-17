package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.FileDTO;
import com.project.dto.FileImageDTO;
import com.project.dto.QnADTO;
import com.project.dto.QnaimgeDTO;
import com.project.dto.QnareplyDTO;

@Mapper
public interface QnAMapper {

	int insertBoard(QnADTO qnadto);
	int selectBoardNo();
	int insertFileList(FileImageDTO fileDTO);
	List<QnADTO> Allqnalist();
	QnADTO serqnaview(String qno);
	QnADTO selectqnaDTO(int qno);
	List<FileDTO> selectFileList(int qno);
	List<QnareplyDTO> selectqnarepiyDTO(int qno);
	int insertqnaDTO(QnareplyDTO qnareplydto);
	int insertqnaComment(QnareplyDTO dto);

}
