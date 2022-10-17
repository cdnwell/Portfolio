package com.project.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Alias("member")
public class MemberDTO {
	private String memberId;
	private String pw;
	private String memberName;
	private String address;
	private String birthDate;
	private String memberTelNo;
	private String withdraw;
	private String gender;
	private String addressDetail;
	private String postNo;

}
