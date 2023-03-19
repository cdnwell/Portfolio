package com.namweb.domain.board.bulletin.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Alias("board")
@Getter
@Setter
@ToString
public class BoardDTO {
	private int bno;
	private String category;
	private String title;
	private String writer;
	private String postDate;
	private String email;
	private int bView;
	private int bReply;
	private String content;
}
