package com.namweb.domain.member.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.member.dto.MemberDto;
import com.namweb.domain.member.service.MemberSelectService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class MemberSelectController {
	
	private final MemberSelectService memberSelectService;
	
	@GetMapping("/member/info")
	public MemberDto memberInfo(String email) {
		MemberDto result = memberSelectService.selectMemberInfo(email);
		return result;
	}
	
	@GetMapping("/member/exist")
	public MemberDto memberExist(String email) {
		MemberDto result = memberSelectService.selectMemberExist(email);
		return result;
	}
	
	@PostMapping("/member/login")
	public MemberDto memberLogin(@RequestBody MemberDto memberDto) {
		MemberDto result = memberSelectService.selectMemberLogin(memberDto);
		return result;
	}
 
}
