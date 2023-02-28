package com.namweb.domain.google.login.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.namweb.domain.google.login.dto.GoogleMemberInfoDto;
import com.namweb.domain.member.dto.MemberDto;

@Mapper
public interface GoogleLoginMapper {

	MemberDto selectMemberInfo(String email);

	int insertMember(GoogleMemberInfoDto googleMemberInfoDto);

}
