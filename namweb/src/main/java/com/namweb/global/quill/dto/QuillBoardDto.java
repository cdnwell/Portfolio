package com.namweb.global.quill.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Alias("qBoard")
@Getter
@Setter
@ToString
public class QuillBoardDto {
	private int bno;
	private int category;
	private String title;
	private String content;
	private String name;
	private String email;
}
