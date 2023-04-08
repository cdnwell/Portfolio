package com.namweb.domain.manager.graph.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.namweb.domain.manager.graph.dto.BarGraphDTO;

@Mapper
public interface ManagerGraphMapper {

	List<BarGraphDTO> selectBookData(String today);

}
