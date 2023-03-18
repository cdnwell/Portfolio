package com.namweb.domain.member.service;

import org.springframework.stereotype.Service;

import com.namweb.domain.member.dto.MemberDto;
import com.namweb.domain.member.exception.MemberNoPasswordException;
import com.namweb.domain.member.mapper.MemberSelectMapper;
import com.namweb.domain.member.mapper.MemberUpdateMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberUpdateService {

	private final MemberUpdateMapper memberUpdateMapper;
	private final MemberSelectMapper memberSelectMapper;

	public void updatePhone(MemberDto memberDto) {
		memberUpdateMapper.updatePhone(memberDto);
	}

	public void updateName(MemberDto memberDto) {
		memberUpdateMapper.updateName(memberDto);
	}

	public void updateNick(MemberDto memberDto) {
		memberUpdateMapper.updateNick(memberDto);
	}

	public void updateAddress(MemberDto memberDto) {
		memberUpdateMapper.updateAddress(memberDto);
	}

	public void updatePassword(MemberDto memberDto) {
		memberUpdateMapper.updatePassword(memberDto);
	}

	public boolean updateExistPassword(MemberDto memberDto) {
		try {
			MemberDto isPwExist = memberSelectMapper.selectMemberPasswordByPassword(memberDto);

			if (isPwExist == null)
				throw new MemberNoPasswordException("해당 비밀번호는 기존 비밀번호가 아닙니다.");

			// 기존 pw = memberDto의 pw, 새로운 pw = memberdDto의 changePw
			// 기존 pw를 새로운 pw로 바꾸고 updatePassword mapper 실행
			memberDto.setPw(memberDto.getChangePw());
			memberUpdateMapper.updatePassword(memberDto);
			return true;
		} catch (MemberNoPasswordException e) {
			return false;
		}
	}

}
