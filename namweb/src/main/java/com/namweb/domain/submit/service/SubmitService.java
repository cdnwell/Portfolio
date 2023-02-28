package com.namweb.domain.submit.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.function.Function;

import org.springframework.stereotype.Service;

import com.namweb.domain.submit.dto.SubmitDto;
import com.namweb.domain.submit.mapper.SubmitMapper;

@Service
public class SubmitService {
	private SubmitMapper submitMapper;
	
	public SubmitService(SubmitMapper submitMapper) {
		this.submitMapper = submitMapper;
	}

	public int insertBookWait(SubmitDto submitDTO) {
		int idx = submitMapper.selectBookWaitIdx();
		int count = 0;
		
		submitDTO.setIdx(idx);
		
		count += submitMapper.insertBookWait(submitDTO);
		
		ArrayList<HashMap<String,Object>> list = submitDTO.getWork_list();
		
		for(HashMap<String,Object> map : list) {
			map.put("book_wait_idx", idx);
			count += submitMapper.insertBookWaitList(map);
		}
		
		return count;
	}


}
