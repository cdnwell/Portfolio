package com.namweb.domain.member.service;

import org.springframework.stereotype.Service;

import com.namweb.domain.member.dto.MemberDto;
import com.namweb.domain.member.mapper.MemberUpdateMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberUpdateService {
	
	private final MemberUpdateMapper memberUpdateMapper;
	
	public void updatePhone(MemberDto memberDto) {
		memberUpdateMapper.updatePhone(memberDto);
	}

	public void updateName(MemberDto memberDto) {
		memberUpdateMapper.updateName(memberDto);
	}

	public void updateNick(MemberDto memberDto) {
		memberUpdateMapper.updateNick(memberDto);
	}

}
