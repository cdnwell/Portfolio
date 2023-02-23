package com.namweb.domain.submit.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.namweb.domain.submit.dto.SubmitDTO;

@Mapper
public interface SubmitMapper {

	int selectBookWaitSeq();

	int insertBookWait(SubmitDTO submitDTO);

	int insertBookWaitList(HashMap<String, Object> map);

}
