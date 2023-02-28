package com.namweb.domain.member.dto;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("member")
public class MemberDto {
	private int idx;
	private String email;
	private String nick;
	private String pw;
	private String name;
	private String phone;
	private String address;
	private LocalDateTime reg_date;
	private String register_type;
}
