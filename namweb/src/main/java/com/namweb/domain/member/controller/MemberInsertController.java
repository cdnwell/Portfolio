package com.namweb.domain.member.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.member.dto.MemberDto;
import com.namweb.domain.member.service.MemberInsertService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class MemberInsertController {
	
	private final MemberInsertService memberInsertService;
	
	@PostMapping("/member/register")
	public String memberRegister(@RequestBody MemberDto memberDto) {
		memberInsertService.insertMember(memberDto);
		
		return "register, success";
	}

}
