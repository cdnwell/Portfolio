package com.project.namweb.submit.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.namweb.dto.SubmitDTO;

@Mapper
public interface SubmitMapper {

	int insertBookData(SubmitDTO submitDTO);

}