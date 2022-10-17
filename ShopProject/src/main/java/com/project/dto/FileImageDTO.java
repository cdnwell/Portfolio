package com.project.dto;

import java.io.File;

import org.apache.ibatis.type.Alias;
@Alias("img")
public class FileImageDTO {
	private String photopath;
	private String fileName;
	private String type;
	private int productphotono;
	private int qno;
	
	public FileImageDTO(String photopath, String fileName, String type, int qno, int productphotono) {
		super();
		this.photopath = photopath;
		this.fileName = fileName;
		this.type = type;
		this.qno = qno;
		this.productphotono = productphotono;
	}
	public FileImageDTO() {
	}
	public FileImageDTO(File file, int qno, int productphotono) {
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
		this.qno = qno;
		this.productphotono = productphotono;
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
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	
	public int getProductphotono() {
		return productphotono;
	}
	public void setProductphotono(int productphotono) {
		this.productphotono = productphotono;
	}
	@Override
	public String toString() {
		return "FileDTO [photopath=" + photopath + ", fileName=" + fileName + ", type=" + type + ", qno=" + qno + ", order="
				+ productphotono + "]";
	}
	
	
}
