package com.namweb.domain.submit.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.namweb.domain.submit.dto.SubmitDTO;

@Mapper
public interface SubmitMapper {

	int insertBookData(SubmitDTO submitDTO);

}
