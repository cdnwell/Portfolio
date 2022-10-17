package com.project.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Alias("notice")
public class NoticeDTO {
	private String noticeno;
	private String title;
	private String writer;
	private String content;
	private String wdate;
	private String photono;
}
