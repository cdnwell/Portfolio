package com.project.dto;

import java.io.File;

import org.apache.ibatis.type.Alias;

@Alias("fileup")
public class FileUploadDTO {
	private String path;
	private String fileName;
	private String type;
	private String noticeno;
	private int fno;
	public FileUploadDTO(String path, String fileName, String type, String noticeno, int fno) {
		super();
		this.path = path;
		this.fileName = fileName;
		this.type = type;
		this.noticeno = noticeno;
		this.fno = fno;
	}
	public FileUploadDTO() {
	}
	public FileUploadDTO(File file, String noticeno, int fno) {
		this.path = file.getAbsolutePath();
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
		this.noticeno = noticeno;
		this.fno = fno;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		File file = new File(path);
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
		this.path = path;
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
	public String getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(String noticeno) {
		this.noticeno = noticeno;
	}
	
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	@Override
	public String toString() {
		return "FileDTO [path=" + path + ", fileName=" + fileName + ", type=" + type + ", noticeno=" + noticeno + ", order="
				+ fno + "]";
	}
	
	
}
