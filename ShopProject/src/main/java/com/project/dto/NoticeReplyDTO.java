package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("noticere")
public class NoticeReplyDTO {
	private String noticeno;
	private String replyforno;
	private String content;
	private String rdate;
	private String writer;
	private String replyno;
	private String memberid;

	public NoticeReplyDTO() {
	}

	public NoticeReplyDTO(String noticeno, String replyforno, String content, String rdate, String writer,
			String replyno, String memberid) {
		super();
		this.noticeno = noticeno;
		this.replyforno = replyforno;
		this.content = content;
		this.rdate = rdate;
		this.writer = writer;
		this.replyno = replyno;
		this.memberid = memberid;
	}

	public String getNoticeno() {
		return noticeno;
	}

	public void setNoticeno(String noticeno) {
		this.noticeno = noticeno;
	}

	public String getReplyforno() {
		return replyforno;
	}

	public void setReplyforno(String replyforno) {
		this.replyforno = replyforno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getReplyno() {
		return replyno;
	}

	public void setReplyno(String replyno) {
		this.replyno = replyno;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	@Override
	public String toString() {
		return "NoticeReplyDTO [noticeno=" + noticeno + ", replyforno=" + replyforno + ", content=" + content
				+ ", rdate=" + rdate + ", writer=" + writer + ", replyno=" + replyno + ", memberid=" + memberid + "]";
	}

}
