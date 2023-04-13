package com.namweb.domain.manager.book.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.namweb.domain.manager.book.dto.ManagerBarGraphDTO;
import com.namweb.domain.manager.book.dto.ManagerBookInfoDTO;
import com.namweb.domain.manager.book.dto.ManagerBookStatusDTO;
import com.namweb.domain.manager.book.mapper.ManagerBookStatusMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@RequiredArgsConstructor
@Log4j2
public class ManagerBookStatusService {
	
	private final ManagerBookStatusMapper managerBookStatusMapper;
	
	public List<ManagerBookStatusDTO> selectBookStatus(int pageNo, String date) {
		Map<String, Object> params = new HashMap<>();
		int limitPageNo = (pageNo - 1) * 4;
		params.put("pageNo", limitPageNo);
		params.put("date", date);
		
		log.info("{}",pageNo);
		log.info("{}",date);
		
		List<ManagerBookStatusDTO> list = managerBookStatusMapper.selectBookStatus(params);
		
		
		for (int i =0 ; i<list.size(); i++) {
			int bwno = list.get(i).getBwno();
			
			String[] conDate = managerBookStatusMapper.selectBookListConDate(bwno);
			
			log.info("con date : {}", Arrays.toString(conDate));
			list.get(i).setConDate(conDate);
			
		}
		
		return list;
	}

	public int selectBookListCount(String date) {
		return managerBookStatusMapper.selectBookListCount(date);
	}

	public List<ManagerBarGraphDTO> selectBookGraphData(String today) {
		return managerBookStatusMapper.selectBookGraphData(today);
	}

	public List<ManagerBookInfoDTO> selectBookInfo(String bookDate) {
		return managerBookStatusMapper.selectBookInfo(bookDate);
	}

}
