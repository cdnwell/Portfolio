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
public class MemberUpdateController {
	
	private final MemberUpdateService memberUpdateService;

	@PostMapping("/member/update/phone")
	public boolean updatePhone(@RequestBody MemberDto memberDto) {
		memberUpdateService.updatePhone(memberDto);
		
		return true;
	}
	
	@PostMapping("/member/update/name")
	public boolean updateName(@RequestBody MemberDto memberDto) {
		memberUpdateService.updateName(memberDto);
		
		return true;
	}
	
	@PostMapping("/member/update/nick")
	public boolean updateNick(@RequestBody MemberDto memberDto) {
		memberUpdateService.updateNick(memberDto);
		
		return true;
	}
	
	@PostMapping("/member/update/address")
	public boolean updateAddress(@RequestBody MemberDto memberDto) {
		memberUpdateService.updateAddress(memberDto);
		
		return true;
	}
	
	@PostMapping("/member/update/pw")
	public boolean updatePassword(@RequestBody MemberDto memberDto) {
		memberUpdateService.updatePassword(memberDto);
		
		return true;
	}
	
	@PostMapping("/member/update/exist-pw")
	public boolean updateExistPassword(@RequestBody MemberDto memberDto) {
		boolean result = memberUpdateService.updateExistPassword(memberDto);
		
		return result;
	}
	
}
