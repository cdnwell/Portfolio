package com.namweb.domain.member.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.namweb.domain.member.dto.MemberDto;

@Mapper
public interface MemberUpdateMapper {

	void updatePhone(MemberDto memberDto);

	void updateName(MemberDto memberDto);

	void updateNick(MemberDto memberDto);

	void updateAddress(MemberDto memberDto);

	void updatePassword(MemberDto memberDto);

}
