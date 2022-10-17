
package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("qna")
public class QnADTO {
private String qno;
private String memberid;
private String qnacontent;
private String qnareply;
private String title;
private String qnadate;

public QnADTO() {
	super();
}

public QnADTO(String qno, String memberid, String qnacontent, String qnareply, String title, String qnadate) {
	super();
	this.qno = qno;
	this.memberid = memberid;
	this.qnacontent = qnacontent;
	this.qnareply = qnareply;
	this.title = title;
	this.qnadate = qnadate;
}

public String getQno() {
	return qno;
}

public void setQno(String qno) {
	this.qno = qno;
}

public String getMemberid() {
	return memberid;
}

public void setMemberid(String memberid) {
	this.memberid = memberid;
}

public String getQnacontent() {
	return qnacontent;
}

public void setQnacontent(String qnacontent) {
	this.qnacontent = qnacontent;
}

public String getQnareply() {
	return qnareply;
}

public void setQnareply(String qnareply) {
	this.qnareply = qnareply;
}

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public String getQnadate() {
	return qnadate;
}

public void setQnadate(String qnadate) {
	this.qnadate = qnadate;
}

@Override
public String toString() {
	return "QnADTO [qno=" + qno + ", memberid=" + memberid + ", qnacontent=" + qnacontent + ", qnareply=" + qnareply
			+ ", title=" + title + ", qnadate=" + qnadate + "]";
}




}






