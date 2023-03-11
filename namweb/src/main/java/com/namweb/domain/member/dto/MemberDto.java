package com.namweb.domain.member.dto;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("member")
public class MemberDto {
	private String email;
	private String nick;
	private String pw;
	private String changePw;
	private String name;
	private String phone;
	private String address;
	private String address_detail;
	private LocalDateTime reg_date;
	private String register_type;
}
