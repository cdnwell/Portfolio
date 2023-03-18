package com.namweb.domain.member.controller;

import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.namweb.domain.member.dto.MemberDto;
import com.namweb.domain.member.service.MemberUpdateService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class MemberUpdateController {
	
	private final MemberUpdateService memberUpdateService;

	@PutMapping("/member/phone")
	public void updatePhone(@RequestBody MemberDto memberDto) {
		memberUpdateService.updatePhone(memberDto);
	}
	
	@PutMapping("/member/name")
	public void updateName(@RequestBody MemberDto memberDto) {
		memberUpdateService.updateName(memberDto);
	}
	
	@PutMapping("/member/nick")
	public void updateNick(@RequestBody MemberDto memberDto) {
		memberUpdateService.updateNick(memberDto);
	}
	
	@PutMapping("/member/address")
	public void updateAddress(@RequestBody MemberDto memberDto) {
		memberUpdateService.updateAddress(memberDto);
	}
	
	@PutMapping("/member/pw")
	public boolean updatePassword(@RequestBody MemberDto memberDto) {
		memberUpdateService.updatePassword(memberDto);
		return true;
	}
	
	@PutMapping("/member/current-pw")
	public boolean updateExistPassword(@RequestBody MemberDto memberDto) {
		return memberUpdateService.updateExistPassword(memberDto);
	}
	
}
