package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("comment")
public class QnareplyDTO {
	private String qno;
	private String qnarecontent;
	private String writer;
	
	
	public QnareplyDTO() {
		super();
	}


	public QnareplyDTO(String qno, String qnarecontent, String writer) {
		super();
		this.qno = qno;
		this.qnarecontent = qnarecontent;
		this.writer = writer;
	}


	public String getQno() {
		return qno;
	}


	public void setQno(String qno) {
		this.qno = qno;
	}


	public String getQnarecontent() {
		return qnarecontent;
	}


	public void setQnarecontent(String qnarecontent) {
		this.qnarecontent = qnarecontent;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	@Override
	public String toString() {
		return "QnarepiyDTO [qno=" + qno + ", qnarecontent=" + qnarecontent + ", writer=" + writer + "]";
	}

	
}
