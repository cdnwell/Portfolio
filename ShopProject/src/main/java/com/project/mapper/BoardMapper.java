package com.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.CategoryDTO;
import com.project.dto.FileDTO;
import com.project.dto.FileUploadDTO;
import com.project.dto.NoticeDTO;
import com.project.dto.NoticeMainDTO;
import com.project.dto.NoticeReplyDTO;

@Mapper
public interface BoardMapper {

	List<NoticeMainDTO> selectNoticeContent(int pageNoLimit);
	int selectNoticeCount();
	String selectBoardImageNo();
	String selectImageFile(String photono);
	int insertBoardImage(Map<String, Object> map);
	String selectNoticeNo();
	int insertNoticeBoard(NoticeDTO dto);
	int insertFileList(FileDTO fileDTO);
	NoticeDTO selectNoticeDetail(String noticeno);
	void deleteNotUploadImg(int imgNo);
	List<Integer> selectAllImgNo(String noticeno);
	String selectNotUploadFileLoc(int imgNo);
	int updateNoticeContent(NoticeDTO notice);
	List<NoticeReplyDTO> selectNoticeReply(String noticeno);
	int insertNoticeReply(NoticeReplyDTO dto);
	int insertNoticeReplyRe(NoticeReplyDTO dto);
	int deleteNoticeContent(String noticeno);
	List<NoticeReplyDTO> selectNoticeRecent3Reply();
	List<NoticeDTO> selectNoticeRecent3();
	int deleteNoticeImgLoc(String noticeno);
	int deleteCartList(String cartno);
	int deleteNoticeReply(String replyno);
	List<NoticeMainDTO> selectNoticeSearch(Map<String, Object> map);
	int selectNoticeSearchCount(String search);
	List<FileUploadDTO> selectFileList(String noticeno);
	String selectNoFile(Map<String, Object> map);
	List<CategoryDTO> selectCategoryList();
	List<CategoryDTO> selectCategoryAllList();
	String selectPrImageFile(String productno);
	
}
