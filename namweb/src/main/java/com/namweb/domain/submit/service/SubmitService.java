package com.namweb.domain.submit.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.function.Function;

import org.springframework.stereotype.Service;

import com.namweb.domain.submit.dto.SubmitDTO;
import com.namweb.domain.submit.mapper.SubmitMapper;

@Service
public class SubmitService {
	private SubmitMapper submitMapper;
	
	public SubmitService(SubmitMapper submitMapper) {
		this.submitMapper = submitMapper;
	}

	public int insertBookWait(SubmitDTO submitDTO) {
		int seq = submitMapper.selectBookWaitSeq();
		int count = 0;
		
		submitDTO.setSeq(seq);
		
		count += submitMapper.insertBookWait(submitDTO);
		
		ArrayList<HashMap<String,Object>> list = submitDTO.getWork_list();
		
		for(HashMap<String,Object> map : list) {
			map.put("book_wait_seq", seq);
			count += submitMapper.insertBookWaitList(map);
		}
		
		return count;
	}


}
