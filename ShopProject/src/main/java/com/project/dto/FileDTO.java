package com.project.dto;

import java.io.File;

import org.apache.ibatis.type.Alias;

@Alias("file")
public class FileDTO {
	private String photopath;
	private String fileName;
	private String type;
	private String productno;
	private int productphotono;

	public FileDTO(String photopath, String fileName, String type, String productno, int productphotono) {
		super();
		this.photopath = photopath;
		this.fileName = fileName;
		this.type = type;
		this.productno = productno;
		this.productphotono = productphotono;
	}

	public FileDTO() {
	}

	public FileDTO(File file, String productno, int productphotono) {
		this.photopath = file.getAbsolutePath();
		this.fileName = file.getName();
		switch (fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase()) {
		case "png":
		case "bmp":
		case "jpg":
		case "gif":
			type = "image";
			break;
		default:
			type = "normal";
		}
		this.productno = productno;
		this.productphotono = productphotono;
	}

	public String getphotopath() {
		return photopath;
	}

	public void setphotopath(String photopath) {
		File file = new File(photopath);
		this.fileName = file.getName();
		switch (fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase()) {
		case "png":
		case "bmp":
		case "jpg":
		case "gif":
			type = "image";
			break;
		default:
			type = "normal";
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

	public int getproductphotono() {
		return productphotono;
	}

	public void setproductphotono(int productphotono) {
		this.productphotono = productphotono;
	}

	@Override
	public String toString() {
		return "FileDTO [photopath=" + photopath + ", fileName=" + fileName + ", type=" + type + ", productno="
				+ productno + ", order=" + productphotono + "]";
	}

}
