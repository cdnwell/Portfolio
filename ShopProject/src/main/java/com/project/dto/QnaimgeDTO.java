package com.project.dto;

import java.io.File;

import org.apache.ibatis.type.Alias;
@Alias("qnaimge")
public class QnaimgeDTO {
	private String photopath;
	private String fileName;
	private String type;
	private String productno;
	private String memberid;
	public QnaimgeDTO(String photopath, String fileName, String type, String productno, String memberid) {
		super();
		this.photopath = photopath;
		this.fileName = fileName;
		this.type = type;
		this.productno = productno;
		this.memberid = memberid;
	}
	public QnaimgeDTO() {
	}
	
	public QnaimgeDTO(File file, String productno, String memberid) {
		this.photopath = file.getAbsolutePath();
		this.fileName = file.getName();
		switch(fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase()) {
		case "png":
		case "bmp":
		case "jpg":
		case "gif":
			type="image";
			break;
		default:
			type="normal";
		}
		this.productno = productno;
		this.memberid = memberid;
	}
	
	public String getphotopath() {
		return photopath;
	}
	public void setphotopath(String photopath) {
		File file = new File(photopath);
		this.fileName = file.getName();
		switch(fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase()) {
		case "png":
		case "bmp":
		case "jpg":
		case "gif":
			type="image";
			break;
		default:
			type="normal";
		}
		this.photopath = photopath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getproductno() {
		return productno;
	}
	public void setproductno(String productno) {
		this.productno = productno;
	}
	
	public String getmemberid() {
		return memberid;
	}
	public void setmemberid(String memberid) {
		this.memberid = memberid;
	}
	@Override
	public String toString() {
		return "FileDTO [photopath=" + photopath + ", fileName=" + fileName + ", type=" + type + ", productno=" + productno + ", order="
				+ memberid + "]";
	}
	
	
}
