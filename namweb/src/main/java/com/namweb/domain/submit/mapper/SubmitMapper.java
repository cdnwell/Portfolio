package com.namweb.domain.submit.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.namweb.domain.submit.dto.SubmitDto;

@Mapper
public interface SubmitMapper {

	int selectBookWaitIdx();

	int insertBookWait(SubmitDto submitDTO);

	int insertBookWaitList(HashMap<String, Object> map);

}
