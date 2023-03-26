package com.namweb.domain.board.bulletin.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Alias("reply")
@Getter
@Setter
@ToString
public class ReplyDTO {
	private int replyno;
	private int bno;
	private int replyforno;
	private String email;
	private String nick;
	private String content;
	private String replyDate;
	private int replyLikeNum;
	private int mno;
}
