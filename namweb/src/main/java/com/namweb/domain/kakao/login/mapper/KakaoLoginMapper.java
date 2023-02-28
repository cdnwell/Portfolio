package com.namweb.domain.kakao.login.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.namweb.domain.kakao.login.dto.KakaoMemberInfoDto;
import com.namweb.domain.member.dto.MemberDto;

@Mapper
public interface KakaoLoginMapper {

	MemberDto selectMemberInfo(String email);

	int insertMember(KakaoMemberInfoDto kakaoMemberInfoDto);

}
