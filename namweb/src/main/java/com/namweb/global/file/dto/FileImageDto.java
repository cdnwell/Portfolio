package com.namweb.global.file.dto;

import java.io.File;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Alias("image")
@NoArgsConstructor
@AllArgsConstructor
public class FileImageDto {
	private int bno; // 이미지가 속한 게시글 시퀀스 번호
	private int photoNo; // 이미지의 개별 시퀀스 번호
	private String photoPath;
	private String fileName;
	private String type;

	public FileImageDto(File file, int photoNo) {
		this.photoPath = file.getAbsolutePath();
		this.fileName = file.getName();

		switch (fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase()) {
		case "png":
		case "bmp":
		case "jpg":
		case "gif":
			this.type = "image";
			break;
		default:
			this.type = "normal";
		}

		this.photoNo = photoNo;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		File file = new File(photoPath);
		this.fileName = file.getName();

		switch (fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase()) {
		case "png":
		case "bmp":
		case "jpg":
		case "gif":
			this.type = "image";
			break;
		default:
			this.type = "normal";
		}

		this.photoPath = photoPath;
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

	@Override
	public String toString() {
		return "FileImageDto [bno=" + bno + ", photoNo=" + photoNo + ", photopath=" + photoPath + ", fileName="
				+ fileName + ", type=" + type + "]";
	}

}
