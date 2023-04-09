package com.namweb.domain.manager.book.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.namweb.domain.manager.book.dto.ManagerBookStatusDTO;
import com.namweb.domain.manager.book.mapper.ManagerBookStatusMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ManagerBookStatusService {
	
	private final ManagerBookStatusMapper managerBookStatusMapper;
	
	public List<ManagerBookStatusDTO> selectBookStatus(int pageNo, String date) {
		Map<String, Object> params = new HashMap<>();
		int limitPageNo = pageNo * 4;
		params.put("pageNo", limitPageNo);
		params.put("date", date);
		
		return managerBookStatusMapper.selectBookStatus(params);
	}

	public int selectBookListCount(String date) {
		return managerBookStatusMapper.selectBookListCount(date);
	}

}
