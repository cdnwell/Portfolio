package com.namweb.domain.naver.login.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.namweb.domain.member.dto.MemberDto;
import com.namweb.domain.naver.login.dto.NaverMemberInfoDto;

@Mapper
public interface NaverLoginMapper {

	MemberDto selectMemberInfo(String email);

	int insertMember(NaverMemberInfoDto naverMemberInfoDto);

}
