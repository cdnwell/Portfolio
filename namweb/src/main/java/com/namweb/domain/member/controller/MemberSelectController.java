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

	@PostMapping("/member/login")
	public MemberDto selectMemberLogin(@RequestBody MemberDto memberDto) {
		return memberSelectService.selectMemberLogin(memberDto);
	}

	@GetMapping("/member/info")
	public MemberDto selectMemberInfo(String email) {
		return memberSelectService.selectMemberInfo(email);
	}

	@GetMapping("/member/exist")
	public MemberDto selectMemberExist(String email) {
		return memberSelectService.selectMemberExist(email);
	}

	@GetMapping("/member/pw")
	public boolean selectMemberPassword(String email) {
		return memberSelectService.selectMemberPassword(email);
	}

}
