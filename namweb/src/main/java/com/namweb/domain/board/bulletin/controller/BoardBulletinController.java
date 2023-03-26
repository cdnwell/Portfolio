package com.namweb.domain.board.bulletin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.board.bulletin.dto.BoardDTO;
import com.namweb.domain.board.bulletin.dto.ReplyDTO;
import com.namweb.domain.board.bulletin.service.BoardBulletinService;
import com.namweb.global.page.dto.PagingDTO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class BoardBulletinController {

	private final BoardBulletinService boardBulletinService;

	@GetMapping("/board/bulletin")
	public Map<String, Object> selectBoardList(
			@RequestParam(name = "pageNo", defaultValue = "0") int pageNo,
			@RequestParam(name = "search", defaultValue = "") String search,
			@RequestParam(name = "category", defaultValue = "0") int category) {
		List<BoardDTO> boardList = boardBulletinService.selectBoardList(pageNo, search, category);
		
		// 한 페이지당 출력할 게시글 개수
		int pageOfContentCount = 15;
		// 게시판 하단에 나타낼 페이지 번호 개수
		int pageGroupOfCount = 5;

		// 전체 게시글 수
		int count = boardBulletinService.selectBoardListCount(search, category);
		// mysql의 limit 시작 인덱스는 0 (1page = 0page)
		int currentPageNo = pageNo + 1;

		PagingDTO pagingDTO = new PagingDTO(count, currentPageNo, pageOfContentCount, pageGroupOfCount);

		Map<String, Object> result = new HashMap<>();
		result.put("board", boardList);
		result.put("paging", pagingDTO);
		
		return result;
	}
	
	@GetMapping("/board/bulletin/detail/{bno}")
	public BoardDTO selectBoardDetail(@PathVariable("bno") int bno) {
	 	return boardBulletinService.selectBoardDetail(bno);
	} 
	
	@GetMapping("/board/bulletin/detail/reply/{bno}")
	public List<ReplyDTO> selectBoardReply(@PathVariable("bno") int bno) {
		return boardBulletinService.selectBoardReply(bno);
	}
	
	@GetMapping("/board/bulleting/detail/replynum/{bno}")
	public int selectBoardReplyNum(@PathVariable("bno") int bno) {
		return boardBulletinService.selectBoardReplyNum(bno);
	}

}
