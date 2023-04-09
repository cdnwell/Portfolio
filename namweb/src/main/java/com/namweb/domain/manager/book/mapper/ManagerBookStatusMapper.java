package com.namweb.domain.manager.book.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.namweb.domain.manager.book.dto.ManagerBookStatusDTO;

@Mapper
public interface ManagerBookStatusMapper {

	List<ManagerBookStatusDTO> selectBookStatus(Map<String, Object> params);

	int selectBookListCount(String date);

}
