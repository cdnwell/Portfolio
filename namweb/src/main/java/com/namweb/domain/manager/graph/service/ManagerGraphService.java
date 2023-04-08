package com.namweb.domain.manager.graph.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.namweb.domain.manager.graph.dto.BarGraphDTO;
import com.namweb.domain.manager.graph.mapper.ManagerGraphMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ManagerGraphService {

	private final ManagerGraphMapper managerGraphMapper;

	public List<BarGraphDTO> selectBookData(String today) {
		return managerGraphMapper.selectBookData(today);
	}
	
}
