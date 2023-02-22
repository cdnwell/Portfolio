package com.namweb.domain.submit.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.namweb.domain.submit.dto.SubmitDTO;
import com.namweb.domain.submit.mapper.SubmitMapper;

@Service
public class SubmitService {
	private SubmitMapper submitMapper;
	
	public SubmitService(SubmitMapper submitMapper) {
		this.submitMapper = submitMapper;
	}

	public int insertBookData(SubmitDTO submitDTO, ArrayList<HashMap<String, Object>> work_list) {
		int count = 0;
		for (HashMap<String, Object> map : work_list) {
			submitDTO.setDate_str((String)map.get("date_str"));
			submitDTO.setMorning((boolean)map.get("morning"));
			submitDTO.setAfternoon((boolean)map.get("afternoon"));
			submitDTO.setExtra((boolean)map.get("extra"));
			
			count += submitMapper.insertBookData(submitDTO);
		}
		return count;
	}

}
