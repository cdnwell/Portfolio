package com.project.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.MemberDTO;

@Mapper
public interface FruitMapper {

	int insertMember(MemberDTO member);
	MemberDTO login(Map<String, Object> map);
	MemberDTO selectId(String id);
	MemberDTO selectNick(String nick);
	
}
