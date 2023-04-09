package com.namweb.domain.manager.book.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.manager.book.dto.ManagerBookStatusDTO;
import com.namweb.domain.manager.book.service.ManagerBookStatusService;
import com.namweb.global.page.dto.PagingDTO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ManagerBookStatusController {

	private final ManagerBookStatusService managerBookStatusService;

	@GetMapping("/namweb/manager/book/status")
	public Map<String, Object> selectBookStatus(@RequestParam(name = "pageNo", defaultValue = "0") int pageNo,
			@RequestParam(name = "date", defaultValue = "") String date) {
		List<ManagerBookStatusDTO> bookList = managerBookStatusService.selectBookStatus(pageNo, date);

		// 한 페이지당 출력할 게시글 개수
		int pageOfContentCount = 4;
		// 게시판 하단에 나타낼 페이지 번호 개수
		int pageGroupOfCount = 5;

		// 전체 게시글 수
		int count = managerBookStatusService.selectBookListCount(date);
		System.out.println("count : "+count);
		// mysql의 limit 시작 인덱스는 0 (1page = 0page)
		int currentPageNo = pageNo + 1;
		
		PagingDTO pagingDTO = new PagingDTO(count, currentPageNo, pageOfContentCount, pageGroupOfCount);
		
		Map<String, Object> result = new HashMap<>();
		result.put("book", bookList);
		result.put("paging", pagingDTO);
		

		return result;
	}

}
