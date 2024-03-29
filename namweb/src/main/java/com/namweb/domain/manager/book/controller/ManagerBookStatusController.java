package com.namweb.domain.manager.book.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.manager.book.dto.ManagerBarGraphDTO;
import com.namweb.domain.manager.book.dto.ManagerBookInfoDTO;
import com.namweb.domain.manager.book.dto.ManagerBookStatusDTO;
import com.namweb.domain.manager.book.service.ManagerBookStatusService;
import com.namweb.global.page.dto.PagingDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@RequiredArgsConstructor
@Log4j2
public class ManagerBookStatusController {

	private final ManagerBookStatusService managerBookStatusService;

	@GetMapping("/namweb/manager/book/status")
	public Map<String, Object> selectBookStatus(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo,
			@RequestParam(name = "date", defaultValue = "") String date) {
		List<ManagerBookStatusDTO> bookList = managerBookStatusService.selectBookStatus(pageNo, date);

		// 한 페이지당 출력할 게시글 개수
		int pageOfContentCount = 4;
		// 게시판 하단에 나타낼 페이지 번호 개수
		int pageGroupOfCount = 5;

		// 전체 게시글 수
		int count = managerBookStatusService.selectBookListCount(date);
		// mysql의 limit 시작 인덱스는 0 (1page = 0page)
		int currentPageNo = pageNo;

		PagingDTO pagingDTO = new PagingDTO(count, currentPageNo, pageOfContentCount, pageGroupOfCount);

		Map<String, Object> result = new HashMap<>();
		result.put("book", bookList);
		result.put("paging", pagingDTO);

		return result;
	}

	@GetMapping("/namweb/manager/book/graph")
	public List<ManagerBarGraphDTO> selectBookGraphData(String today) {
		return managerBookStatusService.selectBookGraphData(today);
	}

	@GetMapping("/namweb/manager/book/info")
	public Map<String, Object> selectBookInfo(int bwno, @RequestParam(name = "pageNo", defaultValue = "1") int pageNo) {
		Map<String,Object> infoMap = managerBookStatusService.selectBookInfo(bwno, pageNo);

		int pageOfContentCount = 4;
		int pageGroupOfCount = 5;

		int count = managerBookStatusService.selectBookInfoCount(bwno);
		int currentPageNo = pageNo;

		PagingDTO pagingDTO = new PagingDTO(count, currentPageNo, pageOfContentCount, pageGroupOfCount);

		Map<String, Object> result = new HashMap<>();
		result.put("bookInfoList", infoMap.get("infoList"));
		result.put("total", infoMap.get("totalDTO"));
		result.put("paging", pagingDTO);

		return result;
	}

}
