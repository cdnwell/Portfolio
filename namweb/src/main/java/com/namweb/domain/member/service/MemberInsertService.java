package com.namweb.domain.member.service;

import org.springframework.stereotype.Service;

import com.namweb.domain.member.dto.MemberDto;
import com.namweb.domain.member.mapper.MemberInsertMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberInsertService {

	private final MemberInsertMapper memberInsertMapper;

	public void insertMember(MemberDto memberDto) {
		memberInsertMapper.insertMember(memberDto);
	}
	
}
