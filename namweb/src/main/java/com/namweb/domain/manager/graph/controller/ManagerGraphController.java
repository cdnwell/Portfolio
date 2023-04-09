package com.namweb.domain.manager.graph.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.manager.graph.dto.BarGraphDTO;
import com.namweb.domain.manager.graph.service.ManagerGraphService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ManagerGraphController {

	private final ManagerGraphService managerGraphService;
	
	@GetMapping("/namweb/manager/graph/book")
	public List<BarGraphDTO> selectBookData(String today) {
		return managerGraphService.selectBookData(today);
	}
	
}
