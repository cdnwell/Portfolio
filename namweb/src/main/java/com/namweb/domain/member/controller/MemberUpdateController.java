package com.namweb.domain.member.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.member.dto.MemberDto;
import com.namweb.domain.member.service.MemberUpdateService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberUpdateController {
	
	private final MemberUpdateService memberUpdateService;

	@PostMapping("/update/phone")
	public String updatePhone(@RequestBody MemberDto memberDto) {
		memberUpdateService.updatePhone(memberDto);
		
		return "update phone, success";
	}
	
	@PostMapping("/update/name")
	public String updateName(@RequestBody MemberDto memberDto) {
		memberUpdateService.updateName(memberDto);
		
		return "update name, success";
	}
	
	@PostMapping("/update/nick")
	public String updateNick(@RequestBody MemberDto memberDto) {
		memberUpdateService.updateNick(memberDto);
		
		return "update nick, success";
	}
	
	@PostMapping("/update/address")
	public String updateAddress(@RequestBody MemberDto memberDto) {
		memberUpdateService.updateAddress(memberDto);
		
		return "update Address, success";
	}
	
}
