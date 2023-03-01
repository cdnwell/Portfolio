package com.namweb.domain.member.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.namweb.domain.member.dto.MemberDto;

@Mapper
public interface MemberSelectMapper {

	MemberDto selectMemberInfo(String email);

}
