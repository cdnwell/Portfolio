package com.project.namweb.submit.dto;

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
@Alias("submit")
public class SubmitDTO {
	private String name;
	private String phone;
	private String content;
	private String address;
	private double latitude;
	private double longitude;
	private String date_str;
	private boolean morning;
	private boolean afternoon;
	private boolean extra;
}
