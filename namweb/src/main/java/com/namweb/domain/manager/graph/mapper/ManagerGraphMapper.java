package com.namweb.domain.manager.graph.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.namweb.domain.manager.graph.dto.BarGraphDTO;

@Mapper
public interface ManagerGraphMapper {

	BarGraphDTO selectBookData(String today);

}
