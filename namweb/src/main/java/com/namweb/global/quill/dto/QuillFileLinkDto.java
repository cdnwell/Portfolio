package com.namweb.global.quill.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Alias("qlFile")
@Getter
@Setter
@ToString
public class QuillFileLinkDto {
	private int boardNo;
	private int fileNo;
}
