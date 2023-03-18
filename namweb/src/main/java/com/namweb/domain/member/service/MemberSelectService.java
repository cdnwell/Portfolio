package com.namweb.domain.member.service;

import org.springframework.stereotype.Service;

import com.namweb.domain.member.dto.MemberDto;
import com.namweb.domain.member.mapper.MemberSelectMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberSelectService {

	private final MemberSelectMapper memberSelectMapper;

	public MemberDto selectMemberInfo(String email) {
		return memberSelectMapper.selectMemberInfo(email);
	}

	public MemberDto selectMemberExist(String email) {
		return memberSelectMapper.selectMemberExist(email);
	}

	public MemberDto selectMemberLogin(MemberDto memberDto) {
		return memberSelectMapper.selectMemberLogin(memberDto);
	}

	public boolean selectMemberPassword(String email) {
		MemberDto memberDto = memberSelectMapper.selectMemberPassword(email);
		if (memberDto == null || memberDto.getPw().trim().equals(""))
			return false;
		return true;
	}

}
