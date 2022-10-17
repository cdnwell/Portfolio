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
@Alias("ntMain")
public class NoticeMainDTO {
	private String noticeno;
	private String title;
	private String content;
	private String wdate;
	private String writer;
	private String photopath;
	private String photono;
}
